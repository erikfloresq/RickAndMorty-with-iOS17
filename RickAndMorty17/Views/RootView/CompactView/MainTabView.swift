//
//  MainTabView.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 4/09/23.
//

import SwiftUI
import SwiftData
import OSLog

enum AppTabs: CaseIterable {
    case character
    case favorite
}

struct MainTabView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var selectionTab: AppTabs = .character
    @Query private var characters: [RMCharacter]
    private let charactersViewModel = CharactersViewModel()
    
    var body: some View {
        TabView(selection: $selectionTab) {
            NavigationStack {
                CharactersView()
            }.tabItem {
                Label("Characters", systemImage: "person")
            }
            NavigationStack {
                FavoritesView()
            }.tabItem {
                Label("Favorites", systemImage: "star")
            }
        }
        .task {
            do {
                if characters.isEmpty {
                    try await charactersViewModel.getCharacter()
                    charactersViewModel.characters.forEach { modelContext.insert($0) }
                    Logger.tabView.info("Initial sync data")
                }
            } catch {
                Logger.tabView.error("Error to get Data")
            }
        }
    }
}

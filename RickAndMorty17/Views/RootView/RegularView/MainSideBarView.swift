//
//  MainSideBarView.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 4/09/23.
//

import SwiftUI
import SwiftData
import OSLog

enum AppOptions: CaseIterable {
    case character
    case favorite
}

struct MainSideBarView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var characters: [RMCharacter]
    private let charactersViewModel = CharactersViewModel()
    @State private var path: [AppOptions] = []
    
    var body: some View {
        NavigationSplitView {
            NavigationStack(path: $path) {
                List {
                    NavigationLink {
                        CharactersView()
                    } label: {
                        Label("Characters", systemImage: "person")
                    }
                    NavigationLink {
                        FavoritesView()
                    } label: {
                        Label("Favorites", systemImage: "star")
                    }
                }
            }.navigationTitle("Rick&Morty")
        } detail: {
            ContentUnavailableView("Select a option", systemImage: "sidebar.left")
        }
        .task {
            do {
                if characters.isEmpty {
                    try await charactersViewModel.getCharacter()
                    charactersViewModel.characters.forEach { modelContext.insert($0) }
                    Logger.tabView.info("Initial sync data")
                }
            } catch {
                Logger.characterView.error("Error to get Data")
            }
        }
    }
}

//
//  RickAndMorty17App.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import SwiftUI
import SwiftData
import OSLog

enum AppTabs {
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
            CharactersView()
                .tabItem {
                    Label("Characters", systemImage: "person")
                }
            FavoritesView()
                .tabItem {
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
                Logger.characterView.error("Error to get Data")
            }
        }
    }
}

struct MainSideBarView: View {
    @Environment(\.modelContext) private var modelContext
    //@State private var selectionTab: AppTabs = .character
    @Query private var characters: [RMCharacter]
    private let charactersViewModel = CharactersViewModel()
    
    var body: some View {
        NavigationSplitView {
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
            }.navigationTitle("Rick & Morty")
        } detail: {
            CharactersView()
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

@main
struct RickAndMorty17App: App {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some Scene {
        WindowGroup {
            if horizontalSizeClass == .compact {
                MainTabView()
            } else {
                MainSideBarView()
            }
        }
        .modelContainer(for: RMCharacter.self)
    }
}

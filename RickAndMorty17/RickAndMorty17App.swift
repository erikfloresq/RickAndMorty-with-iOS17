//
//  RickAndMorty17App.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import SwiftUI
import SwiftData

enum AppTabs {
    case character
    case favorite
}

@main
struct RickAndMorty17App: App {
    @State var selectionTab: AppTabs = .character
    let charactersViewModel = CharactersViewModel()

    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectionTab) {
                CharactersView(viewModel: charactersViewModel)
                    .tabItem {
                        Label("Characters", systemImage: "person")
                    }
                FavoritesView()
                    .tabItem {
                        Label("Favorites", systemImage: "star")
                    }
            }
        }
        .modelContainer(for: RMCharacter.self)
    }
}

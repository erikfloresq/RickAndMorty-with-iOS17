//
//  FavoritesView.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Query(filter: #Predicate { $0.isFavorite == true },
           sort: [SortDescriptor(\RMCharacter.id)],
           animation: .easeInOut)
    private var characters: [RMCharacter]
    
    var body: some View {
        Group {
            if horizontalSizeClass == .regular && verticalSizeClass == .regular {
                FavoritesRegularView(characters: characters)
            } else {
                FavoritesCompactView(characters: characters)
            }
        }.navigationTitle("Favorites")
    }
}

struct FavoritesCompactView: View {
    let characters: [RMCharacter]
    
    var body: some View {
        if characters.isEmpty {
            ContentUnavailableView("You don't have any favorite", systemImage: "star.fill")
        } else {
            List {
                ForEach(characters) { character in
                    NavigationLink(value: character) {
                        CharacterCell(character: character)
                    }
                }
            }
            .navigationDestination(for: RMCharacter.self, destination: { character in
                CharacterDetailView(character: character)
            })
        }
    }
}

struct FavoritesRegularView: View {
    let characters: [RMCharacter]
    let columns = [GridItem(.fixed(250), spacing: 10, alignment: .center),
                   GridItem(.fixed(250), spacing: 10, alignment: .center),
                   GridItem(.fixed(250), spacing: 10, alignment: .center)]
    
    var body: some View {
        if characters.isEmpty {
            ContentUnavailableView("You don't have any favorite", systemImage: "star.fill")
        } else {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(characters) { character in
                        CharacterGrid(character: character)
                    }
                }
                Spacer()
            }
        }
    }
}

//#Preview {
//    FavoritesView()
//}

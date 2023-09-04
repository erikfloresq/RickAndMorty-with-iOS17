//
//  FavoritesView.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Query(filter: #Predicate { $0.isFavorite == true },
           sort: [SortDescriptor(\RMCharacter.id)],
           animation: .easeInOut)
    private var characters: [RMCharacter]
    
    var body: some View {
        NavigationStack {
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
        .navigationTitle("Favorites")
    }
}

#Preview {
    FavoritesView()
}

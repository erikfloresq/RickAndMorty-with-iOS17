//
//  FavoritesView.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Query private var characters: [RMCharacter]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(characters) { character in
                    CharacterCellView(image: character.image, name: character.name)
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoritesView()
}

//
//  CharacterCell.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import SwiftUI
import OSLog

struct CharacterCell: View {
    @Environment(\.modelContext) private var modelContext
    let character: RMCharacter
    @State var addFavorite: Bool = false
    @State var removeFavorite: Bool = false
    
    var body: some View {
        CharacterCellView(image: character.image,
                          name: character.name,
                          isFavorite: character.isFavorite)
        .swipeActions(edge: .trailing) {
            if character.isFavorite {
                EmptyView()
            } else {
                Button {
                    character.isFavorite = true
                    modelContext.insert(character)
                    addFavorite.toggle()
                } label: {
                    Label("Favorite", systemImage: "star.fill")
                }
                .tint(.yellow)
                .sensoryFeedback(.success, trigger: addFavorite)
            }
        }
        .swipeActions(edge: .trailing) {
            if character.isFavorite {
                Button {
                    character.isFavorite = false
                    modelContext.insert(character)
                    removeFavorite.toggle()
                } label: {
                    Label("Remove Favorite", systemImage: "star.slash.fill")
                }
                .tint(.red)
                .sensoryFeedback(.success, trigger: removeFavorite)
            } else {
                EmptyView()
            }
        }
    }
}

//
//  CharacterCell.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import SwiftUI
import RickAndMortyAPI

struct CharacterCell: View {
    @Environment(\.modelContext) private var modelContext
    let character: Character
    @State var addFavorite: Bool = false
    
    var body: some View {
        CharacterCellView(image: character.image, name: character.name)
        .swipeActions(edge: .trailing) {
            Button {
                let character = RMCharacter(id: character.id, name: character.name, status: character.status, species: character.species, type: character.type, gender: character.gender, image: character.image, episode: character.episode, url: character.url, created: character.created)
                modelContext.insert(character)
                addFavorite.toggle()
            } label: {
                Label("Favorite", systemImage: "star.fill")
            }
            .tint(.yellow)
            .sensoryFeedback(.success, trigger: addFavorite)
        }
    }
}

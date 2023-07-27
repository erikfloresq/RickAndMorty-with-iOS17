//
//  CharacterDetailView.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import SwiftUI
import RickAndMortyAPI

struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .frame(height: 200)
            } placeholder: {
                Color.gray
            }
            Text(character.name)
        }
    }
}

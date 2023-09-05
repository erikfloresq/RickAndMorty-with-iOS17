//
//  CharacterGrid.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 3/09/23.
//

import SwiftUI

struct CharacterGrid: View {
    @Environment(\.modelContext) private var modelContext
    let character: RMCharacter
    
    var body: some View {
        CharacterGridView(image: character.image,
                          name: character.name,
                          isFavorite: character.isFavorite)
        .contextMenu {
            Button(action: {
                character.isFavorite = true
                modelContext.insert(character)
            }, label: {
                Label("Favorite", systemImage: "star.fill")
            })
            Button(action: {
                character.isFavorite = false
                modelContext.insert(character)
            }, label: {
                Label("Remove Favorite", systemImage: "star.slash.fill")
            })
        }
    }
}

struct CharacterGridView: View {
    let image: String
    let name: String
    let isFavorite: Bool
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: image),
                       transaction: Transaction(animation: .easeInOut)) { imagePhase in
                switch imagePhase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(.rect(cornerRadius: 5))
                case .failure, .empty:
                    Color.gray
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 100, height: 100)
            .clipShape(.rect(cornerRadius: 5))
            .aspectRatio(1, contentMode: .fit)
            HStack {
                Text(name)
                if isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}

//#Preview {
//    CharacterGrid()
//}

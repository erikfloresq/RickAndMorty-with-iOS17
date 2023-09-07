//
//  CharacterGrid.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 3/09/23.
//

import SwiftUI

struct CharacterGrid: View {
    @Environment(\.modelContext) private var modelContext
    @State private var presentDetail = false
    let character: RMCharacter
    
    var body: some View {
        CharacterGridView(image: character.image,
                          name: character.name,
                          isFavorite: character.isFavorite)
        .contextMenu {
            if character.isFavorite {
                Button(role: .destructive, action: {
                    character.isFavorite = false
                    modelContext.insert(character)
                }, label: {
                    Label("Remove Favorite", systemImage: "star.slash.fill")
                })
            } else {
                Button(action: {
                    character.isFavorite = true
                    modelContext.insert(character)
                }, label: {
                    Label("Favorite", systemImage: "star.fill")
                })
            }
        }
        .onTapGesture {
            presentDetail.toggle()
        }
        .sheet(isPresented: $presentDetail) {
            CharacterDetailView(character: character)
        }
    }
}

struct CharacterGridView: View {
    let image: String
    let name: String
    let isFavorite: Bool
    
    var body: some View {
        VStack(spacing: 10) {
//            AsyncImage(url: URL(string: image),
//                       transaction: Transaction(animation: .easeInOut)) { imagePhase in
//                switch imagePhase {
//                case .success(let image):
//                    image
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 250, height: 250)
//                        .clipShape(.rect(cornerRadius: 5))
//                case .failure:
//                    Color.red
//                case .empty:
//                    Color.gray
//                @unknown default:
//                    Color.black
//                }
//            }
            Rectangle()
                .frame(width: 250, height: 250)
                .foregroundColor(.orange)
                .clipShape(.rect(cornerRadius: 5))
                .aspectRatio(1, contentMode: .fit)
            HStack {
                Text(name).font(.title2).lineLimit(1)
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

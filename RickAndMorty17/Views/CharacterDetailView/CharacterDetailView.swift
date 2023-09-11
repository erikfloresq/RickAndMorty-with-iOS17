//
//  CharacterDetailView.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import SwiftUI
import SwiftData
import CachedAsyncImage

struct CharacterDetailView: View {
    @Environment(\.modelContext) private var modelContext
    let character: RMCharacter
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ZStack {
                    CachedAsyncImage(url: URL(string: character.image),
                               transaction: Transaction(animation: .easeInOut)) { imagePhase in
                        switch imagePhase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 350)
                                .clipped()
                        case .failure, .empty:
                            Color.gray
                        @unknown default:
                            EmptyView()
                        }
                    }
                    VStack {
                        Spacer()
                        HStack {
                            Text(character.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding()
                            Spacer()
                        }
                    }
                }
                Grid(horizontalSpacing: 30) {
                    DetailGridRow(title: "Status", value: character.status)
                    DetailGridRow(title: "Species", value: character.species)
                    DetailGridRow(title: "Type", value: character.type)
                    DetailGridRow(title: "Gender", value: character.gender)
                    DetailGridRow(title: "URL", value: character.url)
                    DetailGridRow(title: "Episodes", value: "\(character.episode.count)")
                    DetailGridRow(title: "Created", value: character.created)
                }
                .padding()
            }
        }
        .ignoresSafeArea(edges: .top)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    character.isFavorite = !character.isFavorite
                    modelContext.insert(character)
                } label: {
                    if character.isFavorite {
                        Label("Favorite", systemImage: "star.fill")
                    } else {
                        Label("Favorite", systemImage: "star")
                    }
                }.tint(.yellow)

            }
        }
    }
}

struct DetailGridRow: View {
    let title: String
    let value: String
    
    var body: some View {
        GridRow {
            if !value.isEmpty {
                Text(title).font(.title3).fontWeight(.bold).gridColumnAlignment(.leading)
                Text(value).gridColumnAlignment(.leading)
            }
        }
        if !value.isEmpty {
            Divider()
        }
    }
}

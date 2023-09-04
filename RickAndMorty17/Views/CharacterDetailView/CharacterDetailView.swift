//
//  CharacterDetailView.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import SwiftUI
import SwiftData

struct CharacterDetailView: View {
    let character: RMCharacter
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ZStack {
                    AsyncImage(url: URL(string: character.image),
                               transaction: Transaction(animation: .easeInOut)) { imagePhase in
                        switch imagePhase {
                        case .success(let image):
                            image
                                .resizable()
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
                .frame(height: 350)
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

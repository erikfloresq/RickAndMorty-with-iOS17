//
//  ContentView.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import SwiftUI
import OSLog
import RickAndMortyAPI

struct CharactersView: View {
    let viewModel: CharactersViewModel
    let logger = Logger(subsystem: "dev.erikflores.RickAndMorty17", category: "CharactersView")
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.characters) { character in
                    NavigationLink(value: character) {
                        CharacterCell(character: character)
                    }
                }
            }
            .navigationDestination(for: Character.self, destination: { character in
                CharacterCell(character: character)
            })
            .navigationTitle("Rick&Morty")
        }
        .task {
            do {
                try await viewModel.getCharacter()
            } catch {
                logger.error("Error to get Character")
            }
        }
    }
}

#Preview {
    CharactersView(viewModel: CharactersViewModel())
}

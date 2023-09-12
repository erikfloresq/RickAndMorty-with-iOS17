//
//  ContentView.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import SwiftUI
import SwiftData
import OSLog

struct CharactersView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Query(sort: [SortDescriptor(\RMCharacter.id)], animation: .easeInOut)
    private var characters: [RMCharacter]
    
    var body: some View {
        if horizontalSizeClass == .regular && verticalSizeClass == .regular {
            CharactersRegularView(characters: characters)
        } else {
            CharactersCompactView(characters: characters)
        }
    }
}

struct CharactersCompactView: View {
    var characters: [RMCharacter]
    
    var body: some View {
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
        .navigationTitle("Rick&Morty")
    }
}

struct CharactersRegularView: View {
    var characters: [RMCharacter]
    let columns: [GridItem] = [
        GridItem(.fixed(250), spacing: 10, alignment: .center),
        GridItem(.fixed(250), spacing: 10, alignment: .center),
        GridItem(.fixed(250), spacing: 10, alignment: .center)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(characters) { character in
                    CharacterGrid(character: character)
                }
            }
        }.navigationTitle("Characters")
    }
}

//#Preview {
//    CharactersView(viewModel: CharactersViewModel())
//}

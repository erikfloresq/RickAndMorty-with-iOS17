//
//  CharactersViewModel.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import Foundation
import Observation

@Observable class CharactersViewModel {
    var characters: [RMCharacter] = []
    private let repository = Repository()
    
    func getCharacter() async throws {
        characters = try await repository.getCharacter()
    }
}

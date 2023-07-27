//
//  Repository.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import Foundation
import RickAndMortyAPI

class Repository {
    private let api = RickAndMortyAPI()
    
    func getCharacter() async throws -> [Character] {
        let response = try await api.getCharacter()
        return response.results
    }
}

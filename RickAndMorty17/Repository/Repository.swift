//
//  Repository.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import Foundation
import RickAndMortyAPI
import SwiftData
import OSLog

class Repository {
    private let api = RickAndMortyAPI()
    
    func getCharacter() async throws -> [RMCharacter] {
        let response = try await api.getCharacter()
        return response.results.map { RMCharacter(id: $0.id,
                                                  name: $0.name,
                                                  status: $0.status,
                                                  species: $0.species,
                                                  type: $0.type,
                                                  gender: $0.gender,
                                                  image: $0.image,
                                                  episode: $0.episode,
                                                  url: $0.url,
                                                  created: $0.created,
                                                  isFavorite: false) }
    }
}

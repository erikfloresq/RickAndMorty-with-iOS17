//
//  RMCharacter.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import Foundation
import SwiftData

@Model
class RMCharacter {
    @Attribute(.unique) var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var image: String
    var episode: [String]
    var url: String
    var created: String
    var isFavorite: Bool
    
    init(id: Int,
         name: String,
         status: String,
         species: String,
         type: String,
         gender: String,
         image: String,
         episode: [String],
         url: String,
         created: String,
         isFavorite: Bool) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
        self.isFavorite = isFavorite
    }
}

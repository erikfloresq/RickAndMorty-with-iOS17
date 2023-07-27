//
//  Character.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import Foundation
import RickAndMortyAPI

extension Character: Hashable {
    public static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
}

extension Character.Origin: Hashable {
    public static func == (lhs: Character.Origin, rhs: Character.Origin) -> Bool {
        return lhs.name == rhs.name && lhs.url == rhs.url
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(url)
    }
}

extension Character.Location: Hashable {
    public static func == (lhs: Character.Location, rhs: Character.Location) -> Bool {
        return lhs.name == rhs.name && lhs.url == rhs.url
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(url)
    }
}

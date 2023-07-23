//
//  Item.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

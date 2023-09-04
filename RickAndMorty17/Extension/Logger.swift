//
//  Logger.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 3/09/23.
//

import Foundation
import OSLog

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    static let `default` = Logger(subsystem: subsystem, category: "default")
    static let tabView = Logger(subsystem: subsystem, category: "tabView")
    static let characterView = Logger(subsystem: subsystem, category: "characterView")
    static let favoriteView = Logger(subsystem: subsystem, category: "favoriteView")
    static let characterDetailView = Logger(subsystem: subsystem, category: "characterDetailView")
}

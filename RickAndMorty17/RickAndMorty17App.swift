//
//  RickAndMorty17App.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import SwiftUI
import OSLog

@main
struct RickAndMorty17App: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: RMCharacter.self)
    }
}

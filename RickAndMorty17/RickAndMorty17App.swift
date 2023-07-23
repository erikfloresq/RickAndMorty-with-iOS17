//
//  RickAndMorty17App.swift
//  RickAndMorty17
//
//  Created by Erik Flores on 23/07/23.
//

import SwiftUI
import SwiftData

@main
struct RickAndMorty17App: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}

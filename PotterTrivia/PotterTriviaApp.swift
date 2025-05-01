//
//  PotterTriviaApp.swift
//  PotterTrivia
//
//  Created by Andersson on 3/04/25.
//

import SwiftUI

@main
struct PotterTriviaApp: App {
    @StateObject private var store = Store()
    @StateObject private var game = Game()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
                .environmentObject(game)
                .task {
                    await store.loadProducts()
                    game.loadScores()
                    store.loadBookStatus()
                }
        }
    }
}

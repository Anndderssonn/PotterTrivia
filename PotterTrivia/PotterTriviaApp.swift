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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
                .task {
                    await store.loadProducts()
                }
        }
    }
}

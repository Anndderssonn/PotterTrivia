//
//  PotterTriviaApp.swift
//  PotterTrivia
//
//  Created by Andersson on 3/04/25.
//

import SwiftUI

@main
struct PotterTriviaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//
//  Store.swift
//  PotterTrivia
//
//  Created by Andersson on 27/04/25.
//

import Foundation
import StoreKit

enum BookStatus {
    case active
    case inactive
    case locked
}

@MainActor
class Store: ObservableObject {
    @Published var books: [BookStatus] = [.active, .active, .inactive, .locked, .locked, .locked, .locked]
    @Published var products: [Product] = []
    private var productsIDs = ["potterbooks4", "potterbooks5", "potterbooks6", "potterbooks7"]
    
    func loadProducts() async {
        do {
            products = try await Product.products(for: productsIDs)
        } catch {
            print("Couldn't fetch those products: \(error)")
        }
    }
}

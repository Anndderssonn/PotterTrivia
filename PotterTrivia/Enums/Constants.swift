//
//  Constants.swift
//  PotterTrivia
//
//  Created by Andersson on 3/04/25.
//

import Foundation
import SwiftUI

enum Constants {
    static let potterFont = "PartyLetPlain"
}

enum BookStatus {
    case active
    case inactive
    case locked
}

struct InfoBkgImage: View {
    var body: some View {
        Image("parchment")
            .resizable()
            .ignoresSafeArea()
            .background(.brown)
    }
}

extension Button {
    func doneButton() -> some View {
        self
            .font(.title)
            .padding()
            .buttonStyle(.borderedProminent)
            .tint(.brown)
            .foregroundStyle(.white)
    }
}

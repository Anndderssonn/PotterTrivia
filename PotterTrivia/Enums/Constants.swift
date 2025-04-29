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
    static let previewQuestion = try! JSONDecoder().decode([QuestionModel].self, from: Data(contentsOf: Bundle.main.url(forResource: "trivia", withExtension: "json")!))[0]
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

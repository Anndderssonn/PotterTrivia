//
//  Game.swift
//  PotterTrivia
//
//  Created by Andersson on 30/04/25.
//

import Foundation

@MainActor
class Game: ObservableObject {
    private var allQuestions: [QuestionModel] = []
    private var answeredQuestions: [Int] = []
    var filteredQuestions: [QuestionModel] = []
    var currentQuestion = Constants.previewQuestion
    
    init() {
        decodeQuestions()
    }
    
    private func decodeQuestions() {
        if let url = Bundle.main.url(forResource: "trivia", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                allQuestions = try decoder.decode([QuestionModel].self, from: data)
                filteredQuestions = allQuestions
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
    func filterQuestions(to books: [Int]) {
        filteredQuestions = allQuestions.filter{ books.contains($0.book) }
    }
    
    func newQuestion() {
        if filteredQuestions.isEmpty {
            return
        }
        if answeredQuestions.count == filteredQuestions.count {
            answeredQuestions = []
        }
        var potentialQuestion = filteredQuestions.randomElement()!
        while answeredQuestions.contains(potentialQuestion.id) {
            potentialQuestion = filteredQuestions.randomElement()!
        }
        currentQuestion = potentialQuestion
    }
}

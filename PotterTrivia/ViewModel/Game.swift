//
//  Game.swift
//  PotterTrivia
//
//  Created by Andersson on 30/04/25.
//

import Foundation
import SwiftUI

@MainActor
class Game: ObservableObject {
    @Published var gameScore = 0
    @Published var questionScore = 5
    @Published var recentScores = [0,0,0]
    private var allQuestions: [QuestionModel] = []
    private var answeredQuestions: [Int] = []
    private let savePath = FileManager.documentsDirectory.appending(path: "SavedScores")
    var filteredQuestions: [QuestionModel] = []
    var currentQuestion = Constants.previewQuestion
    var answers: [String] = []
    var correctAnswer: String {
        currentQuestion.answers.first(where: { $0.value == true })!.key
    }
    
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
    
    private func saveScores() {
        do {
            let data = try JSONEncoder().encode(recentScores)
            try data.write(to: savePath)
        } catch {
            print("Unable to save data: \(error)")
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
        answers = []
        for answer in currentQuestion.answers.keys {
            answers.append(answer)
        }
        answers.shuffle()
        questionScore = 5
    }
    
    func correct() {
        answeredQuestions.append(currentQuestion.id)
        withAnimation {
            gameScore += questionScore
        }
    }
    
    func startGame() {
        gameScore = 0
        questionScore = 5
        answeredQuestions = []
    }
    
    func endGame() {
        recentScores[2] = recentScores[1]
        recentScores[1] = recentScores[0]
        recentScores[0] = gameScore
        saveScores()
    }
    
    func loadScores() {
        do {
            let data = try Data(contentsOf: savePath)
            recentScores = try JSONDecoder().decode([Int].self, from: data)
        } catch {
            recentScores = [0, 0, 0]
        }
    }
}

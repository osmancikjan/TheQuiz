//
//  MockDashboardDataStore.swift
//  TheQuiz
//
//  Created by Jan Osmančík on 24.03.2024.
//

import Foundation

class MockDashboardDataStore: DashboardDataStore {

    var invokedQuizSetter = false
    var invokedQuizSetterCount = 0
    var invokedQuiz: QuizModel?
    var invokedQuizList = [QuizModel?]()
    var invokedQuizGetter = false
    var invokedQuizGetterCount = 0
    var stubbedQuiz: QuizModel!

    var quiz: QuizModel? {
        set {
            invokedQuizSetter = true
            invokedQuizSetterCount += 1
            invokedQuiz = newValue
            invokedQuizList.append(newValue)
        }
        get {
            invokedQuizGetter = true
            invokedQuizGetterCount += 1
            return stubbedQuiz
        }
    }
}

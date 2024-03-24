//
//  MockQuizDataStore.swift
//  TheQuiz
//
//  Created by Jan Osmančík on 24.03.2024.
//

import Foundation

class MockQuizDataStore: QuizDataStore {
    static func == (lhs: MockQuizDataStore, rhs: MockQuizDataStore) -> Bool {
        lhs.quiz == rhs.quiz
    }
    

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

    var invokedActualQuestionIndexSetter = false
    var invokedActualQuestionIndexSetterCount = 0
    var invokedActualQuestionIndex: Int?
    var invokedActualQuestionIndexList = [Int]()
    var invokedActualQuestionIndexGetter = false
    var invokedActualQuestionIndexGetterCount = 0
    var stubbedActualQuestionIndex: Int! = 0

    var actualQuestionIndex: Int {
        set {
            invokedActualQuestionIndexSetter = true
            invokedActualQuestionIndexSetterCount += 1
            invokedActualQuestionIndex = newValue
            invokedActualQuestionIndexList.append(newValue)
        }
        get {
            invokedActualQuestionIndexGetter = true
            invokedActualQuestionIndexGetterCount += 1
            return stubbedActualQuestionIndex
        }
    }
}

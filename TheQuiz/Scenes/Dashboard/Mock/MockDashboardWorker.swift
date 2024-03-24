//
//  MockDashboardWorker.swift
//  TheQuiz
//
//  Created by Jan Osmančík on 24.03.2024.
//

import Foundation
import Combine

final class MockDashboardWorker: DashboardWorker {

    var invokedFetchMockQuizData = false
    var invokedFetchMockQuizDataCount = 0
    var stubbedFetchMockQuizDataResult: AnyPublisher<QuizModel, Error>!

    override func fetchMockQuizData() -> AnyPublisher<QuizModel, Error> {
        invokedFetchMockQuizData = true
        invokedFetchMockQuizDataCount += 1
        return stubbedFetchMockQuizDataResult
    }
}

//
//  QuizInteractorTests.swift
//  TheQuizTests
//
//  Created by Jan Osmančík on 24.03.2024.
//

import XCTest
@testable import TheQuiz 

class MockQuizInteractorTests: XCTestCase {

    func testGetAnswersCount() {
        // Given
        let interactor = MockQuizInteractor()
        interactor.stubbedGetAnswersCountResult = 2

        // When
        let answersCount = interactor.getAnswersCount()

        // Then
        XCTAssertEqual(answersCount, 2)
    }

    func testGetAnswer() {
        // Given
        let interactor = MockQuizInteractor()
        let expectedAnswer = AnswerModel(id: "1", text: "Answer 1", selected: false, correct: true)
        interactor.stubbedGetAnswerResult = expectedAnswer

        // When
        let answer = interactor.getAnswer(for: 0)

        // Then
        XCTAssertEqual(answer, expectedAnswer)
    }

    // Add more test cases for other methods as needed...
}

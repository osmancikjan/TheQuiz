//
//  QuizModelsTests.swift
//  TheQuizTests
//
//  Created by Jan Osmančík on 24.03.2024.
//

import XCTest
@testable import TheQuiz

class QuizModelTests: XCTestCase {

    func testQuizModelEquality() {
        // Given
        let quiz1 = QuizModel(id: "1", title: "Quiz 1", questions: [])
        let quiz2 = QuizModel(id: "1", title: "Quiz 1", questions: [])
        let quiz3 = QuizModel(id: "2", title: "Quiz 2", questions: [])

        // Then
        XCTAssertEqual(quiz1, quiz2)
        XCTAssertNotEqual(quiz1, quiz3)
    }
}

class QuestionModelTests: XCTestCase {

    func testQuestionModelDeselectAllAnswers() {
        // Given
        var question = QuestionModel(id: "1", text: "Question 1", allowsMultipleAnswers: true, answers: [
            AnswerModel(id: "1", text: "Answer 1", selected: true, correct: true),
            AnswerModel(id: "2", text: "Answer 2", selected: true, correct: false)
        ])

        // When
        question.deselectAllAnswers()

        // Then
        XCTAssertFalse(question.answers[0].selected)
        XCTAssertFalse(question.answers[1].selected)
    }
}

class AnswerModelTests: XCTestCase {

    func testAnswerModelEquality() {
        // Given
        let answer1 = AnswerModel(id: "1", text: "Answer 1", selected: true, correct: true)
        let answer2 = AnswerModel(id: "1", text: "Answer 1", selected: true, correct: true)
        let answer3 = AnswerModel(id: "2", text: "Answer 2", selected: false, correct: false)

        // Then
        XCTAssertEqual(answer1, answer2)
        XCTAssertNotEqual(answer1, answer3)
    }
}


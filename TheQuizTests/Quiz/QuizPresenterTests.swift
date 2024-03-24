//
//  QuizPresenterTests.swift
//  TheQuizTests
//
//  Created by Jan Osmančík on 24.03.2024.
//

import XCTest
@testable import TheQuiz

class MockQuizPresenterTests: XCTestCase {

    var sut: MockQuizPresenter!

    override func setUp() {
        super.setUp()
        sut = MockQuizPresenter()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testViewControllerSetter() {
        // Given
        let mockViewController = MockQuizViewController()

        // When
        sut.viewController = mockViewController

        // Then
        XCTAssertTrue(sut.invokedViewControllerSetter)
        XCTAssertEqual(sut.invokedViewControllerSetterCount, 1)
    }

    func testReloadData() {
        // When
        sut.reloadData()

        // Then
        XCTAssertTrue(sut.invokedReloadData)
        XCTAssertEqual(sut.invokedReloadDataCount, 1)
    }

    func testShowLeaveAlert() {
        // When
        sut.showLeaveAlert()

        // Then
        XCTAssertTrue(sut.invokedShowLeaveAlert)
        XCTAssertEqual(sut.invokedShowLeaveAlertCount, 1)
    }

    func testPresentCorrectAnswer() {
        // When
        sut.presentCorrectAnswer()

        // Then
        XCTAssertTrue(sut.invokedPresentCorrectAnswer)
        XCTAssertEqual(sut.invokedPresentCorrectAnswerCount, 1)
    }

    func testPresentIncorrectAnswer() {
        // When
        sut.presentIncorrectAnswer()

        // Then
        XCTAssertTrue(sut.invokedPresentIncorrectAnswer)
        XCTAssertEqual(sut.invokedPresentIncorrectAnswerCount, 1)
    }
}

//
//  QuizRouterTests.swift
//  TheQuizTests
//
//  Created by Jan Osmančík on 24.03.2024.
//

import XCTest
@testable import TheQuiz

class MockQuizRouterTests: XCTestCase {

    var sut: MockQuizRouter!

    override func setUp() {
        super.setUp()
        sut = MockQuizRouter()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testViewControllerSetter() {
        // Given
        let mockViewController = QuizViewController()

        // When
        sut.viewController = mockViewController

        // Then
        XCTAssertTrue(sut.invokedViewControllerSetter)
        XCTAssertEqual(sut.invokedViewControllerSetterCount, 1)
        XCTAssertEqual(sut.invokedViewController, mockViewController)
    }

    func testDataStoreSetter() {
        // Given
        let mockDataStore = MockQuizDataStore()

        // When
        sut.dataStore = mockDataStore

        // Then
        XCTAssertTrue(sut.invokedDataStoreSetter)
        XCTAssertEqual(sut.invokedDataStoreSetterCount, 1)
        //XCTAssertEqual(sut.invokedDataStore, mockDataStore)
    }
}


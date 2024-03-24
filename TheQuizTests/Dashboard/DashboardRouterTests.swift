//
//  DashboardRouterTests.swift
//  TheQuizTests
//
//  Created by Jan Osmančík on 24.03.2024.
//

import XCTest
@testable import TheQuiz

class DashboardRouterTests: XCTestCase {

    var sut: DashboardRouter!
    var mockViewController: MockDashboardViewController!
    var mockDataStore: MockDashboardDataStore!
    
    override func setUp() {
        super.setUp()
        mockViewController = MockDashboardViewController()
        mockDataStore = MockDashboardDataStore()
        sut = DashboardRouter()
        sut.viewController = mockViewController
        sut.dataStore = mockDataStore
        sut.dataStore?.quiz = QuizMockData().mockQuiz
    }
    
    override func tearDown() {
        sut = nil
        mockViewController = nil
        mockDataStore = nil
        super.tearDown()
    }
    
    func testRouteToQuiz() {
        // Given
        let mockQuiz = QuizMockData().mockQuiz
        mockDataStore.quiz = mockQuiz
        
        // When
        sut.routeToQuiz()
        
        // Then
        XCTAssertTrue(mockViewController.navigationController?.topViewController is QuizViewController)
        XCTAssertEqual((mockViewController.navigationController?.topViewController as? QuizViewController)?.router?.dataStore?.quiz, mockQuiz)
    }
}

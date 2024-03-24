//
//  DashboardPresenterTests.swift
//  TheQuizTests
//
//  Created by Jan Osmančík on 24.03.2024.
//

import XCTest
@testable import TheQuiz

class DashboardPresenterTests: XCTestCase {
    
    var sut: MockDashboardPresenter!
    var mockViewController: MockDashboardViewController!
    
    override func setUp() {
        super.setUp()
        mockViewController = MockDashboardViewController()
        sut = MockDashboardPresenter()
        sut.viewController = mockViewController
    }
    
    override func tearDown() {
        sut = nil
        mockViewController = nil
        super.tearDown()
    }
    
    func testPresentQuizWithError() {
        // Given
        let mockError = NSError(domain: "MockErrorDomain", code: 500, userInfo: nil)
        let response = Dashboard.Quiz.Detail.Response(error: mockError, result: nil)
        
        // When
        sut.presentQuiz(response: response)
        
        // Then
        XCTAssertTrue(mockViewController.invokedDisplayError)
        XCTAssertFalse(mockViewController.invokedDisplayQuiz)
    }
    
    func testPresentQuizWithQuiz() {
        // Given
        let mockQuiz = QuizMockData().mockQuiz
        let response = Dashboard.Quiz.Detail.Response(error: nil, result: mockQuiz)
        
        // When
        sut.presentQuiz(response: response)
        
        // Then
        XCTAssertTrue(mockViewController.invokedDisplayQuiz)
        XCTAssertFalse(mockViewController.invokedDisplayError)
    }
    
    func testPresentQuizWithUnknownError() {
        // Given
        let response = Dashboard.Quiz.Detail.Response(error: nil, result: nil)
        
        // When
        sut.presentQuiz(response: response)
        
        // Then
        XCTAssertTrue(mockViewController.invokedDisplayError)
        XCTAssertFalse(mockViewController.invokedDisplayQuiz)
    }
}

//
//  DashboardInteractorTests.swift
//  TheQuizTests
//
//  Created by Jan Osmančík on 24.03.2024.
//

import XCTest
@testable import TheQuiz

final class DashboardInteractorTests: XCTestCase {
    var sut: DashboardInteractor!
    var mockWorker: MockDashboardWorker!
    var mockPresenter: MockDashboardPresenter!
    
    override func setUp() {
        super.setUp()
        
        mockPresenter = MockDashboardPresenter()
        mockWorker = MockDashboardWorker()
        sut = DashboardInteractor()
        
        sut.presenter = mockPresenter
        sut.worker = mockWorker
    }
    
    override func tearDown() {
        sut = nil
        mockWorker = nil
        super.tearDown()
    }
    
    func testStartQuizSuccess() {
//        // Given
//        let mockQuiz = QuizMockData()
//        
//        // When
//        sut.startQuiz(request: Dashboard.Quiz.Detail.Request(id: "1"))
//        
//        // Then
//        XCTAssertTrue(mockPresenter.invokedPresentQuiz)
//        XCTAssertNotNil(sut.quiz)
    }
    
    func testStartQuizFailure() {
//        // Given
//        let mockError = NSError(domain: "MockErrorDomain", code: 500, userInfo: nil)
//        mockWorker.mockError = mockError
//        
//        // When
//        sut.startQuiz(request: Dashboard.Quiz.Detail.Request(id: "1"))
//        
//        // Then
//        XCTAssertTrue(mockPresenter.presentQuizCalled)
//        XCTAssertNil(sut.quiz)
    }
}

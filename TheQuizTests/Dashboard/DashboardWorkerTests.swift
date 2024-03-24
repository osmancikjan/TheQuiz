//
//  DashboardWorkerTests.swift
//  TheQuizTests
//
//  Created by Jan Osmančík on 24.03.2024.
//

import XCTest
@testable import TheQuiz

final class DashboardWorkerTests: XCTestCase {
    
    var sut: DashboardWorker!
        
        override func setUp() {
            super.setUp()
            sut = DashboardWorker()
        }
        
        override func tearDown() {
            sut = nil
            super.tearDown()
        }

    func testFetchMockQuizDataSuccess() {
            // Given
            let expectation = self.expectation(description: "Fetching quiz data successfully")
            
            // When
            var receivedQuiz: QuizModel?
            var receivedError: Error?
            
            let cancellable = sut.fetchMockQuizData()
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        receivedError = error
                        expectation.fulfill()
                    case .finished:
                        break
                    }
                }, receiveValue: { quiz in
                    receivedQuiz = quiz
                    expectation.fulfill()
                })
            
            waitForExpectations(timeout: 5, handler: nil)
            cancellable.cancel() // Cancel the subscription to prevent any resource leaks
            
            // Then
            XCTAssertNotNil(receivedQuiz)
            XCTAssertNil(receivedError)
        }
        
        func testFetchMockQuizDataFailure() {
            // Given
            let expectation = self.expectation(description: "Fetching quiz data fails")
            let mockError = NSError(domain: "MockErrorDomain", code: 500, userInfo: nil)
            
            // When
            var receivedQuiz: QuizModel?
            var receivedError: Error?
            
            let cancellable = sut.fetchMockQuizData()
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        receivedError = error
                        expectation.fulfill()
                    case .finished:
                        break
                    }
                }, receiveValue: { quiz in
                    receivedQuiz = quiz
                    expectation.fulfill()
                })
            
            sut.fetchMockQuizData()
            waitForExpectations(timeout: 5, handler: nil)
            cancellable.cancel() // Cancel the subscription to prevent any resource leaks
            
            // Then
            XCTAssertNil(receivedQuiz)
            XCTAssertNotNil(receivedError)
        }
}

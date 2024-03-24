//
//  DashboardModelsTests.swift
//  TheQuizTests
//
//  Created by Jan Osmančík on 24.03.2024.
//

import XCTest
@testable import TheQuiz

class QuizListModelsTests: XCTestCase {

    func testListRequest() {
        // Given
        let request = Dashboard.Quiz.List.Request()
        
        // Then
        // No assertions needed for a simple struct
    }
    
    func testListResponse() {
        // Given
        let mockError = NSError(domain: "MockErrorDomain", code: 500, userInfo: nil)
        let mockQuizList = [QuizModel(id: "1", title: "Quiz 1", questions: []), QuizModel(id: "2", title: "Quiz 2", questions: [])]
        let responseWithResult = Dashboard.Quiz.List.Response(error: nil, result: mockQuizList)
        let responseWithError = Dashboard.Quiz.List.Response(error: mockError, result: nil)
        
        // Then
        XCTAssertNil(responseWithResult.error)
        XCTAssertEqual(responseWithResult.result?.count, 2)
        
        XCTAssertEqual(responseWithError.error as NSError?, mockError)
        XCTAssertNil(responseWithError.result)
    }
    
    func testListViewModel() {
        // Given
        let mockQuizList = [QuizModel(id: "1", title: "Quiz 1", questions: []), QuizModel(id: "2", title: "Quiz 2", questions: [])]
        let viewModel = Dashboard.Quiz.List.ViewModel(quizList: mockQuizList)
        
        // Then
        XCTAssertEqual(viewModel.quizList.count, 2)
    }
}

class QuizDetailModelsTests: XCTestCase {

    func testDetailRequest() {
        // Given
        let request = Dashboard.Quiz.Detail.Request(id: "1")
        
        // Then
        XCTAssertEqual(request.id, "1")
    }
    
    func testDetailResponse() {
        // Given
        let mockError = NSError(domain: "MockErrorDomain", code: 500, userInfo: nil)
        let mockQuiz = QuizModel(id: "1", title: "Mock Quiz", questions: [])
        let responseWithResult = Dashboard.Quiz.Detail.Response(error: nil, result: mockQuiz)
        let responseWithError = Dashboard.Quiz.Detail.Response(error: mockError, result: nil)
        
        // Then
        XCTAssertNil(responseWithResult.error)
        XCTAssertEqual(responseWithResult.result?.id, "1")
        
        XCTAssertEqual(responseWithError.error as NSError?, mockError)
        XCTAssertNil(responseWithError.result)
    }
    
    func testDetailViewModel() {
        // Given
        let mockQuiz = QuizModel(id: "1", title: "Mock Quiz", questions: [])
        let viewModel = Dashboard.Quiz.Detail.ViewModel(quiz: mockQuiz)
        
        // Then
        XCTAssertEqual(viewModel.quiz.id, "1")
        XCTAssertEqual(viewModel.quiz.title, "Mock Quiz")
    }
}

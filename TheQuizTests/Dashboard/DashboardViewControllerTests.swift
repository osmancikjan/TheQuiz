//
//  DashboardViewControllerTests.swift
//  TheQuizTests
//
//  Created by Jan Osmančík on 24.03.2024.
//

import XCTest
@testable import TheQuiz // Import your app module

class DashboardViewControllerTests: XCTestCase {
    
    var sut: DashboardViewController!
    var mockInteractor: MockDashboardInteractor!
    var mockPresenter: MockDashboardPresenter!
    var mockQuizModel: QuizMockData!
    var mockRouter: MockDashboardRouter!
    
    override func setUp() {
        super.setUp()
        sut = DashboardViewController()
        mockInteractor = MockDashboardInteractor()
        mockPresenter = MockDashboardPresenter()
        mockQuizModel = QuizMockData()
        mockRouter = MockDashboardRouter()
        
        sut.interactor = mockInteractor
        sut.router = mockRouter
        
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        mockInteractor = nil
        mockRouter = nil
        super.tearDown()
    }
    
    func testDisplayQuizCallsRouterRouteToQuiz() {
        // When
        sut.displayQuiz(viewModel: Dashboard.Quiz.Detail.ViewModel(quiz: mockQuizModel.mockQuiz))
        
        // Then
        XCTAssertTrue(mockRouter.invokedRouteToQuiz)
    }
    
    func testCollectionViewNumberOfItemsInSection() {
        // When
        let numberOfItems = sut.collectionView(sut.collectionView, numberOfItemsInSection: 0)
        
        // Then
        XCTAssertEqual(numberOfItems, 100)
    }
    
    func testCollectionViewCellForItemAt() {
        // Given
        let indexPath = IndexPath(item: 0, section: 0)
        
        // When
        let cell = sut.collectionView(sut.collectionView, cellForItemAt: indexPath) as? QuizCollectionCell
        
        // Then
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.quizName.text, "0")
    }
    
    func testDidSelectItemAtCallsInteractorStartQuiz() {
        // Given
        let indexPath = IndexPath(item: 0, section: 0)
        
        // When
        sut.collectionView(sut.collectionView, didSelectItemAt: indexPath)
        
        // Then
        XCTAssertTrue(mockInteractor.invokedStartQuiz)
    }
}

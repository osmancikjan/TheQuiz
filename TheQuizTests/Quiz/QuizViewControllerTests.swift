//
//  QuizViewControllerTests.swift
//  TheQuizTests
//
//  Created by Jan Osmančík on 24.03.2024.
//
import XCTest
@testable import TheQuiz

class QuizViewControllerTests: XCTestCase {
    var sut: MockQuizViewController!
        
        override func setUp() {
            super.setUp()
            sut = MockQuizViewController()
        }
        
        override func tearDown() {
            sut = nil
            super.tearDown()
        }
        
        // MARK: - Tests for overridden properties
        
        func testInteractorSetter() {
            // Given
            let mockInteractor = MockQuizInteractor()
            
            // When
            sut.interactor = mockInteractor
            
            // Then
            XCTAssertTrue(sut.invokedInteractorSetter)
            XCTAssertEqual(sut.invokedInteractorSetterCount, 2)
            XCTAssertNotNil(sut.invokedInteractor)
        }
        
        // Similarly, you can write tests for other overridden properties such as router, nextButton, label, and answersTableView
        
        // MARK: - Tests for overridden methods
        
        func testViewDidLoad() {
            // When
            sut.viewDidLoad()
            
            // Then
            XCTAssertTrue(sut.invokedViewDidLoad)
            XCTAssertEqual(sut.invokedViewDidLoadCount, 1)
        }
        
        func testSubmitQuestionAction() {
            // When
            sut.submitQuestionAction()
            
            // Then
            XCTAssertTrue(sut.invokedSubmitQuestionAction)
            XCTAssertEqual(sut.invokedSubmitQuestionActionCount, 1)
        }
        
        // Similarly, you can write tests for other overridden methods such as reloadData, displayLeaveAlert, diplayCorrectAnswer, and diplayIncorrectAnswer
        
        // MARK: - Tests for UITableViewDelegate methods
        
        func testTableViewDidSelectRowAt() {
            // Given
            let tableView = UITableView()
            let indexPath = IndexPath(row: 0, section: 0)
            
            // When
            sut.tableView(tableView, didSelectRowAt: indexPath)
            
            // Then
            XCTAssertTrue(sut.invokedTableViewDidSelectRowAt)
            XCTAssertEqual(sut.invokedTableViewDidSelectRowAtCount, 1)
            XCTAssertEqual(sut.invokedTableViewDidSelectRowAtParameters?.tableView, tableView)
            XCTAssertEqual(sut.invokedTableViewDidSelectRowAtParameters?.indexPath, indexPath)
        }
        
        // Similarly, you can write tests for other UITableViewDelegate methods such as tableView(_:heightForHeaderInSection:) and tableView(_:viewForHeaderInSection:)
        
        // MARK: - Tests for UITableViewDataSource methods
        
        func testTableViewNumberOfRowsInSection() {
            // Given
            let tableView = UITableView()
            let section = 0
            sut.stubbedTableViewNumberOfRowsInSectionResult = 5
            
            // When
            let numberOfRows = sut.tableView(tableView, numberOfRowsInSection: section)
            
            // Then
            XCTAssertTrue(sut.invokedTableViewNumberOfRowsInSection)
            XCTAssertEqual(sut.invokedTableViewNumberOfRowsInSectionCount, 1)
            XCTAssertEqual(sut.invokedTableViewNumberOfRowsInSectionParameters?.tableView, tableView)
            XCTAssertEqual(sut.invokedTableViewNumberOfRowsInSectionParameters?.section, section)
            XCTAssertEqual(numberOfRows, sut.stubbedTableViewNumberOfRowsInSectionResult)
        }
        
        // Similarly, you can write tests for other UITableViewDataSource methods such as tableView(_:cellForRowAt:)
}

// Mock UIAlertController for testing
class MockAlertController: UIAlertController {
    var presentCalled = false
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentCalled = true
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}

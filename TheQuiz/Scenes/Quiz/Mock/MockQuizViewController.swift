//
//  MockQuizViewController.swift
//  TheQuiz
//
//  Created by Jan Osmančík on 24.03.2024.
//

import Foundation
import UIKit

class MockQuizViewController: QuizViewController {

    var invokedInteractorSetter = false
    var invokedInteractorSetterCount = 0
    var invokedInteractor: (any QuizBusinessLogic)?
    var invokedInteractorList = [MockQuizInteractor?]()
    var invokedInteractorGetter = false
    var invokedInteractorGetterCount = 0
    var stubbedInteractor: MockQuizInteractor!

    override var interactor: (any QuizBusinessLogic)? {
        set {
            invokedInteractorSetter = true
            invokedInteractorSetterCount += 1
            invokedInteractor = newValue
            invokedInteractorList.append(newValue as? MockQuizInteractor)
        }
        get {
            invokedInteractorGetter = true
            invokedInteractorGetterCount += 1
            return stubbedInteractor
        }
    }

    var invokedRouterSetter = false
    var invokedRouterSetterCount = 0
    var invokedRouter: (NSObjectProtocol & QuizRoutingLogic & QuizDataPassing)?
    var invokedRouterList = [(NSObjectProtocol & QuizRoutingLogic & QuizDataPassing)?]()
    var invokedRouterGetter = false
    var invokedRouterGetterCount = 0
    var stubbedRouter: (NSObjectProtocol & QuizRoutingLogic & QuizDataPassing)!

    override var router: (NSObjectProtocol & QuizRoutingLogic & QuizDataPassing)? {
        set {
            invokedRouterSetter = true
            invokedRouterSetterCount += 1
            invokedRouter = newValue
            invokedRouterList.append(newValue)
        }
        get {
            invokedRouterGetter = true
            invokedRouterGetterCount += 1
            return stubbedRouter
        }
    }

    var invokedNextButtonSetter = false
    var invokedNextButtonSetterCount = 0
    var invokedNextButton: UIButton?
    var invokedNextButtonList = [UIButton]()
    var invokedNextButtonGetter = false
    var invokedNextButtonGetterCount = 0
    var stubbedNextButton: UIButton!

    override var nextButton: UIButton {
        set {
            invokedNextButtonSetter = true
            invokedNextButtonSetterCount += 1
            invokedNextButton = newValue
            invokedNextButtonList.append(newValue)
        }
        get {
            invokedNextButtonGetter = true
            invokedNextButtonGetterCount += 1
            return stubbedNextButton
        }
    }

    var invokedLabelSetter = false
    var invokedLabelSetterCount = 0
    var invokedLabel: UILabel?
    var invokedLabelList = [UILabel]()
    var invokedLabelGetter = false
    var invokedLabelGetterCount = 0
    var stubbedLabel: UILabel!

    override var label: UILabel {
        set {
            invokedLabelSetter = true
            invokedLabelSetterCount += 1
            invokedLabel = newValue
            invokedLabelList.append(newValue)
        }
        get {
            invokedLabelGetter = true
            invokedLabelGetterCount += 1
            return stubbedLabel
        }
    }

    var invokedAnswersTableViewSetter = false
    var invokedAnswersTableViewSetterCount = 0
    var invokedAnswersTableView: UITableView?
    var invokedAnswersTableViewList = [UITableView]()
    var invokedAnswersTableViewGetter = false
    var invokedAnswersTableViewGetterCount = 0
    var stubbedAnswersTableView: UITableView!

    override var answersTableView: UITableView {
        set {
            invokedAnswersTableViewSetter = true
            invokedAnswersTableViewSetterCount += 1
            invokedAnswersTableView = newValue
            invokedAnswersTableViewList.append(newValue)
        }
        get {
            invokedAnswersTableViewGetter = true
            invokedAnswersTableViewGetterCount += 1
            return stubbedAnswersTableView
        }
    }

    var invokedViewDidLoad = false
    var invokedViewDidLoadCount = 0

    override func viewDidLoad() {
        invokedViewDidLoad = true
        invokedViewDidLoadCount += 1
    }

    var invokedReloadData = false
    var invokedReloadDataCount = 0

    override func reloadData() {
        invokedReloadData = true
        invokedReloadDataCount += 1
    }

    var invokedInitUI = false
    var invokedInitUICount = 0

    override func initUI() {
        invokedInitUI = true
        invokedInitUICount += 1
    }

    var invokedSubmitQuestionAction = false
    var invokedSubmitQuestionActionCount = 0

    override func submitQuestionAction() {
        invokedSubmitQuestionAction = true
        invokedSubmitQuestionActionCount += 1
    }

    var invokedDisplayLeaveAlert = false
    var invokedDisplayLeaveAlertCount = 0

    override func displayLeaveAlert() {
        invokedDisplayLeaveAlert = true
        invokedDisplayLeaveAlertCount += 1
    }

    var invokedDiplayCorrectAnswer = false
    var invokedDiplayCorrectAnswerCount = 0

    override func diplayCorrectAnswer() {
        invokedDiplayCorrectAnswer = true
        invokedDiplayCorrectAnswerCount += 1
    }

    var invokedDiplayIncorrectAnswer = false
    var invokedDiplayIncorrectAnswerCount = 0

    override func diplayIncorrectAnswer() {
        invokedDiplayIncorrectAnswer = true
        invokedDiplayIncorrectAnswerCount += 1
    }

    var invokedTableViewDidSelectRowAt = false
    var invokedTableViewDidSelectRowAtCount = 0
    var invokedTableViewDidSelectRowAtParameters: (tableView: UITableView, indexPath: IndexPath)?
    var invokedTableViewDidSelectRowAtParametersList = [(tableView: UITableView, indexPath: IndexPath)]()

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        invokedTableViewDidSelectRowAt = true
        invokedTableViewDidSelectRowAtCount += 1
        invokedTableViewDidSelectRowAtParameters = (tableView, indexPath)
        invokedTableViewDidSelectRowAtParametersList.append((tableView, indexPath))
    }

    var invokedTableViewNumberOfRowsInSection = false
    var invokedTableViewNumberOfRowsInSectionCount = 0
    var invokedTableViewNumberOfRowsInSectionParameters: (tableView: UITableView, section: Int)?
    var invokedTableViewNumberOfRowsInSectionParametersList = [(tableView: UITableView, section: Int)]()
    var stubbedTableViewNumberOfRowsInSectionResult: Int! = 0

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        invokedTableViewNumberOfRowsInSection = true
        invokedTableViewNumberOfRowsInSectionCount += 1
        invokedTableViewNumberOfRowsInSectionParameters = (tableView, section)
        invokedTableViewNumberOfRowsInSectionParametersList.append((tableView, section))
        return stubbedTableViewNumberOfRowsInSectionResult
    }

    var invokedNumberOfSections = false
    var invokedNumberOfSectionsCount = 0
    var invokedNumberOfSectionsParameters: (tableView: UITableView, Void)?
    var invokedNumberOfSectionsParametersList = [(tableView: UITableView, Void)]()
    var stubbedNumberOfSectionsResult: Int! = 0

    override func numberOfSections(in tableView: UITableView) -> Int {
        invokedNumberOfSections = true
        invokedNumberOfSectionsCount += 1
        invokedNumberOfSectionsParameters = (tableView, ())
        invokedNumberOfSectionsParametersList.append((tableView, ()))
        return stubbedNumberOfSectionsResult
    }

    var invokedTableViewCellForRowAt = false
    var invokedTableViewCellForRowAtCount = 0
    var invokedTableViewCellForRowAtParameters: (tableView: UITableView, indexPath: IndexPath)?
    var invokedTableViewCellForRowAtParametersList = [(tableView: UITableView, indexPath: IndexPath)]()
    var stubbedTableViewCellForRowAtResult: UITableViewCell!

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        invokedTableViewCellForRowAt = true
        invokedTableViewCellForRowAtCount += 1
        invokedTableViewCellForRowAtParameters = (tableView, indexPath)
        invokedTableViewCellForRowAtParametersList.append((tableView, indexPath))
        return stubbedTableViewCellForRowAtResult
    }

    var invokedTableViewHeightForHeaderInSection = false
    var invokedTableViewHeightForHeaderInSectionCount = 0
    var invokedTableViewHeightForHeaderInSectionParameters: (tableView: UITableView, section: Int)?
    var invokedTableViewHeightForHeaderInSectionParametersList = [(tableView: UITableView, section: Int)]()
    var stubbedTableViewHeightForHeaderInSectionResult: CGFloat!

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        invokedTableViewHeightForHeaderInSection = true
        invokedTableViewHeightForHeaderInSectionCount += 1
        invokedTableViewHeightForHeaderInSectionParameters = (tableView, section)
        invokedTableViewHeightForHeaderInSectionParametersList.append((tableView, section))
        return stubbedTableViewHeightForHeaderInSectionResult
    }

    var invokedTableViewViewForHeaderInSection = false
    var invokedTableViewViewForHeaderInSectionCount = 0
    var invokedTableViewViewForHeaderInSectionParameters: (tableView: UITableView, section: Int)?
    var invokedTableViewViewForHeaderInSectionParametersList = [(tableView: UITableView, section: Int)]()
    var stubbedTableViewViewForHeaderInSectionResult: UIView!

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        invokedTableViewViewForHeaderInSection = true
        invokedTableViewViewForHeaderInSectionCount += 1
        invokedTableViewViewForHeaderInSectionParameters = (tableView, section)
        invokedTableViewViewForHeaderInSectionParametersList.append((tableView, section))
        return stubbedTableViewViewForHeaderInSectionResult
    }
}

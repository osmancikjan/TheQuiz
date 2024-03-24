//
//  MockQuizPresenter.swift
//  TheQuiz
//
//  Created by Jan Osmančík on 24.03.2024.
//

import Foundation

class MockQuizPresenter: QuizPresenter {

    var invokedViewControllerSetter = false
    var invokedViewControllerSetterCount = 0
    var invokedViewController: (any QuizDisplayLogic)?
    var invokedViewControllerList = [(any QuizDisplayLogic)?]()
    var invokedViewControllerGetter = false
    var invokedViewControllerGetterCount = 0
    var stubbedViewController: (any QuizDisplayLogic)?

    override var viewController: (any QuizDisplayLogic)? {
        set {
            invokedViewControllerSetter = true
            invokedViewControllerSetterCount += 1
            invokedViewController = newValue
            invokedViewControllerList.append(newValue)
        }
        get {
            invokedViewControllerGetter = true
            invokedViewControllerGetterCount += 1
            return stubbedViewController
        }
    }

    var invokedReloadData = false
    var invokedReloadDataCount = 0

    override func reloadData() {
        invokedReloadData = true
        invokedReloadDataCount += 1
    }

    var invokedShowLeaveAlert = false
    var invokedShowLeaveAlertCount = 0

    override func showLeaveAlert() {
        invokedShowLeaveAlert = true
        invokedShowLeaveAlertCount += 1
    }

    var invokedPresentCorrectAnswer = false
    var invokedPresentCorrectAnswerCount = 0

    override func presentCorrectAnswer() {
        invokedPresentCorrectAnswer = true
        invokedPresentCorrectAnswerCount += 1
    }

    var invokedPresentIncorrectAnswer = false
    var invokedPresentIncorrectAnswerCount = 0

    override func presentIncorrectAnswer() {
        invokedPresentIncorrectAnswer = true
        invokedPresentIncorrectAnswerCount += 1
    }
}

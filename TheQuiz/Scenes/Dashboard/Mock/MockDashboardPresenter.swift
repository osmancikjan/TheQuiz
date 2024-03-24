//
//  MockDashboardPresenter.swift
//  TheQuiz
//
//  Created by Jan Osmančík on 24.03.2024.
//

import Foundation

class MockDashboardPresenter: DashboardPresenter {

    var invokedViewControllerSetter = false
    var invokedViewControllerSetterCount = 0
    var invokedViewController: DashboardDisplayLogic?
    var invokedViewControllerList = [DashboardDisplayLogic?]()
    var invokedViewControllerGetter = false
    var invokedViewControllerGetterCount = 0
    var stubbedViewController: DashboardDisplayLogic!

    override var viewController: DashboardDisplayLogic? {
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

    var invokedPresentQuiz = false
    var invokedPresentQuizCount = 0
    var invokedPresentQuizParameters: (response: Dashboard.Quiz.Detail.Response, Void)?
    var invokedPresentQuizParametersList = [(response: Dashboard.Quiz.Detail.Response, Void)]()

    override func presentQuiz(response: Dashboard.Quiz.Detail.Response) {
        invokedPresentQuiz = true
        invokedPresentQuizCount += 1
        invokedPresentQuizParameters = (response, ())
        invokedPresentQuizParametersList.append((response, ()))
    }
}

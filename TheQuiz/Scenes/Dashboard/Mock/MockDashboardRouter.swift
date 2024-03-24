//
//  MockDashboardRouter.swift
//  TheQuiz
//
//  Created by Jan Osmančík on 24.03.2024.
//

import Foundation

final class MockDashboardRouter: DashboardRouter {

    var invokedViewControllerSetter = false
    var invokedViewControllerSetterCount = 0
    var invokedViewController: DashboardViewController?
    var invokedViewControllerList = [DashboardViewController?]()
    var invokedViewControllerGetter = false
    var invokedViewControllerGetterCount = 0
    var stubbedViewController: DashboardViewController!

    override var viewController: DashboardViewController? {
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

    var invokedDataStoreSetter = false
    var invokedDataStoreSetterCount = 0
    var invokedDataStore: DashboardDataStore?
    var invokedDataStoreList = [DashboardDataStore?]()
    var invokedDataStoreGetter = false
    var invokedDataStoreGetterCount = 0
    var stubbedDataStore: DashboardDataStore!

    override var dataStore: DashboardDataStore? {
        set {
            invokedDataStoreSetter = true
            invokedDataStoreSetterCount += 1
            invokedDataStore = newValue
            invokedDataStoreList.append(newValue)
        }
        get {
            invokedDataStoreGetter = true
            invokedDataStoreGetterCount += 1
            return stubbedDataStore
        }
    }

    var invokedRouteToQuiz = false
    var invokedRouteToQuizCount = 0

    override func routeToQuiz() {
        invokedRouteToQuiz = true
        invokedRouteToQuizCount += 1
    }

    var invokedNavigateToQuiz = false
    var invokedNavigateToQuizCount = 0
    var invokedNavigateToQuizParameters: (source: DashboardViewController, destination: QuizViewController)?
    var invokedNavigateToQuizParametersList = [(source: DashboardViewController, destination: QuizViewController)]()

    override func navigateToQuiz(source: DashboardViewController, destination: QuizViewController) {
        invokedNavigateToQuiz = true
        invokedNavigateToQuizCount += 1
        invokedNavigateToQuizParameters = (source, destination)
        invokedNavigateToQuizParametersList.append((source, destination))
    }

    var invokedPassDataToQuizScene = false
    var invokedPassDataToQuizSceneCount = 0
    var invokedPassDataToQuizSceneParameters: (source: DashboardDataStore, destination: any QuizDataStore)?
    var invokedPassDataToQuizSceneParametersList = [(source: DashboardDataStore, destination: any QuizDataStore)]()

    override func passDataToQuizScene(source: DashboardDataStore, destination: inout any QuizDataStore) {
        invokedPassDataToQuizScene = true
        invokedPassDataToQuizSceneCount += 1
        invokedPassDataToQuizSceneParameters = (source, destination)
        invokedPassDataToQuizSceneParametersList.append((source, destination))
    }
}

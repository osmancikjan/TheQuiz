//
//  MockQuizRouter.swift
//  TheQuiz
//
//  Created by Jan Osmančík on 24.03.2024.
//

import Foundation

class MockQuizRouter: QuizRouter {

    var invokedViewControllerSetter = false
    var invokedViewControllerSetterCount = 0
    var invokedViewController: QuizViewController?
    var invokedViewControllerList = [QuizViewController?]()
    var invokedViewControllerGetter = false
    var invokedViewControllerGetterCount = 0
    var stubbedViewController: QuizViewController!

    override var viewController: QuizViewController? {
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
    var invokedDataStore: (any QuizDataStore)?
    var invokedDataStoreList = [(any QuizDataStore)?]()
    var invokedDataStoreGetter = false
    var invokedDataStoreGetterCount = 0
    var stubbedDataStore: (any QuizDataStore)?

    override var dataStore: (any QuizDataStore)? {
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
}

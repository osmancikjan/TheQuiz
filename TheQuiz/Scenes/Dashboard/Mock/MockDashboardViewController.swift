//
//  MockDashboardViewController.swift
//  TheQuiz
//
//  Created by Jan Osmančík on 24.03.2024.
//

import Foundation
import UIKit
 
final class MockDashboardViewController: DashboardViewController {

    var invokedInteractorSetter = false
    var invokedInteractorSetterCount = 0
    var invokedInteractor: DashboardBusinessLogic?
    var invokedInteractorList = [DashboardBusinessLogic?]()
    var invokedInteractorGetter = false
    var invokedInteractorGetterCount = 0
    var stubbedInteractor: DashboardBusinessLogic!

    override var interactor: DashboardBusinessLogic? {
        set {
            invokedInteractorSetter = true
            invokedInteractorSetterCount += 1
            invokedInteractor = newValue
            invokedInteractorList.append(newValue)
        }
        get {
            invokedInteractorGetter = true
            invokedInteractorGetterCount += 1
            return stubbedInteractor
        }
    }

    var invokedRouterSetter = false
    var invokedRouterSetterCount = 0
    var invokedRouter: (NSObjectProtocol & DashboardRoutingLogic & DashboardDataPassing)?
    var invokedRouterList = [(NSObjectProtocol & DashboardRoutingLogic & DashboardDataPassing)?]()
    var invokedRouterGetter = false
    var invokedRouterGetterCount = 0
    var stubbedRouter: (NSObjectProtocol & DashboardRoutingLogic & DashboardDataPassing)!

    override var router: (NSObjectProtocol & DashboardRoutingLogic & DashboardDataPassing)? {
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

    var invokedCollectionViewSetter = false
    var invokedCollectionViewSetterCount = 0
    var invokedCollectionView: UICollectionView?
    var invokedCollectionViewList = [UICollectionView]()
    var invokedCollectionViewGetter = false
    var invokedCollectionViewGetterCount = 0
    var stubbedCollectionView: UICollectionView!

    override var collectionView: UICollectionView {
        set {
            invokedCollectionViewSetter = true
            invokedCollectionViewSetterCount += 1
            invokedCollectionView = newValue
            invokedCollectionViewList.append(newValue)
        }
        get {
            invokedCollectionViewGetter = true
            invokedCollectionViewGetterCount += 1
            return stubbedCollectionView
        }
    }

    var invokedSetup = false
    var invokedSetupCount = 0

    override func setup() {
        invokedSetup = true
        invokedSetupCount += 1
    }

    var invokedViewDidLoad = false
    var invokedViewDidLoadCount = 0

    override func viewDidLoad() {
        invokedViewDidLoad = true
        invokedViewDidLoadCount += 1
    }

    var invokedDisplayQuiz = false
    var invokedDisplayQuizCount = 0
    var invokedDisplayQuizParameters: (viewModel: Dashboard.Quiz.Detail.ViewModel, Void)?
    var invokedDisplayQuizParametersList = [(viewModel: Dashboard.Quiz.Detail.ViewModel, Void)]()

    override func displayQuiz(viewModel: Dashboard.Quiz.Detail.ViewModel) {
        invokedDisplayQuiz = true
        invokedDisplayQuizCount += 1
        invokedDisplayQuizParameters = (viewModel, ())
        invokedDisplayQuizParametersList.append((viewModel, ()))
    }

    var invokedDisplayError = false
    var invokedDisplayErrorCount = 0
    var invokedDisplayErrorParameters: (message: String, Void)?
    var invokedDisplayErrorParametersList = [(message: String, Void)]()

    override func displayError(message: String) {
        invokedDisplayError = true
        invokedDisplayErrorCount += 1
        invokedDisplayErrorParameters = (message, ())
        invokedDisplayErrorParametersList.append((message, ()))
    }
}

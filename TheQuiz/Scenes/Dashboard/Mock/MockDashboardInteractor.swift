//
//  MockDashboardInteractor.swift
//  TheQuiz
//
//  Created by Jan Osmančík on 24.03.2024.
//

import Foundation

final class MockDashboardInteractor: DashboardInteractor {

    var invokedQuizSetter = false
    var invokedQuizSetterCount = 0
    var invokedQuiz: QuizModel?
    var invokedQuizList = [QuizModel?]()
    var invokedQuizGetter = false
    var invokedQuizGetterCount = 0
    var stubbedQuiz: QuizModel!

    override var quiz: QuizModel? {
        set {
            invokedQuizSetter = true
            invokedQuizSetterCount += 1
            invokedQuiz = newValue
            invokedQuizList.append(newValue)
        }
        get {
            invokedQuizGetter = true
            invokedQuizGetterCount += 1
            return stubbedQuiz
        }
    }

    var invokedPresenterSetter = false
    var invokedPresenterSetterCount = 0
    var invokedPresenter: DashboardPresentationLogic?
    var invokedPresenterList = [DashboardPresentationLogic?]()
    var invokedPresenterGetter = false
    var invokedPresenterGetterCount = 0
    var stubbedPresenter: DashboardPresentationLogic!

    override var presenter: DashboardPresentationLogic? {
        set {
            invokedPresenterSetter = true
            invokedPresenterSetterCount += 1
            invokedPresenter = newValue
            invokedPresenterList.append(newValue)
        }
        get {
            invokedPresenterGetter = true
            invokedPresenterGetterCount += 1
            return stubbedPresenter
        }
    }

    var invokedWorkerSetter = false
    var invokedWorkerSetterCount = 0
    var invokedWorker: DashboardWorker?
    var invokedWorkerList = [DashboardWorker]()
    var invokedWorkerGetter = false
    var invokedWorkerGetterCount = 0
    var stubbedWorker: DashboardWorker!

    override var worker: DashboardWorker {
        set {
            invokedWorkerSetter = true
            invokedWorkerSetterCount += 1
            invokedWorker = newValue
            invokedWorkerList.append(newValue)
        }
        get {
            invokedWorkerGetter = true
            invokedWorkerGetterCount += 1
            return stubbedWorker
        }
    }

    var invokedStartQuiz = false
    var invokedStartQuizCount = 0
    var invokedStartQuizParameters: (request: Dashboard.Quiz.Detail.Request, Void)?
    var invokedStartQuizParametersList = [(request: Dashboard.Quiz.Detail.Request, Void)]()

    override func startQuiz(request: Dashboard.Quiz.Detail.Request) {
        invokedStartQuiz = true
        invokedStartQuizCount += 1
        invokedStartQuizParameters = (request, ())
        invokedStartQuizParametersList.append((request, ()))
    }
}

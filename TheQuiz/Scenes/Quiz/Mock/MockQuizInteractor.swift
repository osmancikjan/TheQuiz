//
//  MockQuizInteractor.swift
//  TheQuiz
//
//  Created by Jan Osmančík on 24.03.2024.
//

import Foundation

class MockQuizInteractor: QuizInteractor {

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

    var invokedActualQuestionIndexSetter = false
    var invokedActualQuestionIndexSetterCount = 0
    var invokedActualQuestionIndex: Int?
    var invokedActualQuestionIndexList = [Int]()
    var invokedActualQuestionIndexGetter = false
    var invokedActualQuestionIndexGetterCount = 0
    var stubbedActualQuestionIndex: Int! = 0

    override var actualQuestionIndex: Int {
        set {
            invokedActualQuestionIndexSetter = true
            invokedActualQuestionIndexSetterCount += 1
            invokedActualQuestionIndex = newValue
            invokedActualQuestionIndexList.append(newValue)
        }
        get {
            invokedActualQuestionIndexGetter = true
            invokedActualQuestionIndexGetterCount += 1
            return stubbedActualQuestionIndex
        }
    }

    var invokedPresenterSetter = false
    var invokedPresenterSetterCount = 0
    var invokedPresenter: QuizPresentationLogic?
    var invokedPresenterList = [QuizPresentationLogic?]()
    var invokedPresenterGetter = false
    var invokedPresenterGetterCount = 0
    var stubbedPresenter: QuizPresentationLogic!

    override var presenter: QuizPresentationLogic? {
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
    var invokedWorker: QuizWorker?
    var invokedWorkerList = [QuizWorker?]()
    var invokedWorkerGetter = false
    var invokedWorkerGetterCount = 0
    var stubbedWorker: QuizWorker!

    override var worker: QuizWorker? {
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

    var invokedGetAnswersCount = false
    var invokedGetAnswersCountCount = 0
    var stubbedGetAnswersCountResult: Int! = 0

    override func getAnswersCount() -> Int {
        invokedGetAnswersCount = true
        invokedGetAnswersCountCount += 1
        return stubbedGetAnswersCountResult
    }

    var invokedGetAnswer = false
    var invokedGetAnswerCount = 0
    var invokedGetAnswerParameters: (index: Int, Void)?
    var invokedGetAnswerParametersList = [(index: Int, Void)]()
    var stubbedGetAnswerResult: AnswerModel!

    override func getAnswer(for index: Int) -> AnswerModel? {
        invokedGetAnswer = true
        invokedGetAnswerCount += 1
        invokedGetAnswerParameters = (index, ())
        invokedGetAnswerParametersList.append((index, ()))
        return stubbedGetAnswerResult
    }

    var invokedGetQuestionText = false
    var invokedGetQuestionTextCount = 0
    var stubbedGetQuestionTextResult: String!

    override func getQuestionText() -> String? {
        invokedGetQuestionText = true
        invokedGetQuestionTextCount += 1
        return stubbedGetQuestionTextResult
    }

    var invokedGetMultipleAnswersValue = false
    var invokedGetMultipleAnswersValueCount = 0
    var stubbedGetMultipleAnswersValueResult: Bool! = false

    override func getMultipleAnswersValue() -> Bool {
        invokedGetMultipleAnswersValue = true
        invokedGetMultipleAnswersValueCount += 1
        return stubbedGetMultipleAnswersValueResult
    }

    var invokedChangeSelectionState = false
    var invokedChangeSelectionStateCount = 0
    var invokedChangeSelectionStateParameters: (index: Int, Void)?
    var invokedChangeSelectionStateParametersList = [(index: Int, Void)]()

    override func changeSelectionState(ofAnswer index: Int) {
        invokedChangeSelectionState = true
        invokedChangeSelectionStateCount += 1
        invokedChangeSelectionStateParameters = (index, ())
        invokedChangeSelectionStateParametersList.append((index, ()))
    }

    var invokedGoToNextQuestion = false
    var invokedGoToNextQuestionCount = 0

    override func goToNextQuestion() {
        invokedGoToNextQuestion = true
        invokedGoToNextQuestionCount += 1
    }

    var invokedCheckAnswer = false
    var invokedCheckAnswerCount = 0

    override func checkAnswer() {
        invokedCheckAnswer = true
        invokedCheckAnswerCount += 1
    }
}

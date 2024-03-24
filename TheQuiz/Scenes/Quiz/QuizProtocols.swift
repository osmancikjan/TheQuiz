//
//  QuizProtocols.swift
//  TheQuiz
//
//  Created by Jan Osmančík on 22.03.2024.
//

import Foundation

protocol QuizDisplayLogic: AnyObject, Equatable {
    func reloadData()
    func displayLeaveAlert()
    func diplayCorrectAnswer()
    func diplayIncorrectAnswer()
}

protocol QuizBusinessLogic: Equatable {
    func getAnswersCount() -> Int
    func getAnswer(for index: Int) -> AnswerModel?
    func getQuestionText() -> String?
    func getMultipleAnswersValue() -> Bool
    func changeSelectionState(ofAnswer index: Int)
    func goToNextQuestion()
    func checkAnswer()
}

protocol QuizDataStore: Equatable {
    var quiz: QuizModel? { get set }
    var actualQuestionIndex: Int { get set }
}

protocol QuizPresentationLogic {
    func reloadData()
    func showLeaveAlert()
    func presentCorrectAnswer()
    func presentIncorrectAnswer()
}

@objc protocol QuizRoutingLogic {}

protocol QuizDataPassing {
    var dataStore: (any QuizDataStore)? { get }
}

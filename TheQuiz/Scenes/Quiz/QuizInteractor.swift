//
//  QuizInteractor.swift
//  TheQuiz
//
//  Created by Jan Osmančík on 22.03.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class QuizInteractor: QuizBusinessLogic, QuizDataStore {
    static func == (lhs: QuizInteractor, rhs: QuizInteractor) -> Bool {
        lhs.quiz == rhs.quiz
    }
    
    var quiz: QuizModel?
    var actualQuestionIndex: Int = 0
    
    var presenter: QuizPresentationLogic?
    var worker: QuizWorker?
    
    func getAnswersCount() -> Int {
        return getCurrentQuestion()?.answers.count ?? 0
    }
    
    func getAnswer(for index: Int) -> AnswerModel? {
        return getCurrentQuestion()?.answers[index]
    }
    
    func getQuestionText() -> String? {
        return getCurrentQuestion()?.text
    }
    
    func getMultipleAnswersValue() -> Bool {
        return getCurrentQuestion()?.allowsMultipleAnswers ?? false
    }
    
    func changeSelectionState(ofAnswer index: Int) {
        guard let question = getCurrentQuestion() else { return }
        
        if (!question.allowsMultipleAnswers) {
            selectSingleAnswer(index: index)
        }
        // Due to mutating NO getCurrentQuestion() method usage
        quiz?.questions[actualQuestionIndex].answers[index].selected = !question.answers[index].selected
    }
    
    private func getCurrentQuestion() -> QuestionModel? {
        return quiz?.questions[actualQuestionIndex]
    }
    
    private func selectSingleAnswer(index: Int) {
        // Due to mutating NO getCurrentQuestion() method usage
        quiz?.questions[actualQuestionIndex].deselectAllAnswers()
        quiz?.questions[actualQuestionIndex].answers[index].selected = true
        presenter?.reloadData()
    }
    
    func goToNextQuestion() {
        if (actualQuestionIndex < (quiz?.questions.count ?? 0) - 1) {
            actualQuestionIndex += 1
            presenter?.reloadData()
        } else {
            presenter?.showLeaveAlert()
        }
    }
    
    func checkAnswer() {
        guard let answers = getCurrentQuestion()?.answers else { return }
        
        for answer in answers {
            // Check if the selected answer is correct
            if answer.selected != answer.correct {
                // If any selected answer is incorrect, present INCORRECT and return
                presenter?.presentIncorrectAnswer()
                return
            }
        }
        // If all selected answers are correct, present CORRECT
        presenter?.presentCorrectAnswer()
    }
}

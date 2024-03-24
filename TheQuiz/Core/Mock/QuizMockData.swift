//
//  QuizMockData.swift
//  TheQuiz
//
//  Created by Jan Osmančík on 23.03.2024.
//

import Foundation

struct QuizMockData {
    let mockQuiz: QuizModel
    
    init() {
        
        let multipleChoiceQuestion = QuestionModel(
            id: "1",
            text: "What is the capital of France?",
            allowsMultipleAnswers: true,
            answers: [
                AnswerModel(id: "1", text: "London", correct: false),
                AnswerModel(id: "2", text: "Paris", correct: true),
                AnswerModel(id: "3", text: "Berlin", correct: false),
                AnswerModel(id: "4", text: "Rome", correct: false)
            ]
        )
        
        let trueFalseQuestion = QuestionModel(
            id: "2",
            text: "Is the Earth flat?",
            allowsMultipleAnswers: false,
            answers: [
                AnswerModel(id: "1", text: "True", correct: false),
                AnswerModel(id: "2", text: "False", correct: true)
            ]
        )
        
        let singleAnswerQuestion = QuestionModel(
            id: "3",
            text: "What is the capital of Japan?",
            allowsMultipleAnswers: false,
            answers: [
                AnswerModel(id: "1", text: "Beijing", correct: false),
                AnswerModel(id: "2", text: "Tokyo", correct: true),
                AnswerModel(id: "3", text: "Seoul", correct: false)
            ]
        )
        
        let multipleSelectionQuestion = QuestionModel(
            id: "4",
            text: "Which of the following are primary colors?",
            allowsMultipleAnswers: true,
            answers: [
                AnswerModel(id: "1", text: "Red", correct: true),
                AnswerModel(id: "2", text: "Green", correct: false),
                AnswerModel(id: "3", text: "Blue", correct: true),
                AnswerModel(id: "4", text: "Yellow", correct: true)
            ]
        )
        
        mockQuiz = QuizModel(id: "oneandonly", title: "The Quizzz", questions: [
            multipleChoiceQuestion,
            trueFalseQuestion,
            singleAnswerQuestion,
            multipleSelectionQuestion
        ])
    }
}

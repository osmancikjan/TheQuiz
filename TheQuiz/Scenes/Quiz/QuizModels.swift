//
//  QuizModels.swift
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

enum Quiz {
    // MARK: Use cases
    enum Detail {
        struct Request {}
        struct Response {}
        struct ViewModel {}
    }
}

struct QuizModel: Equatable, Codable {
    static func == (lhs: QuizModel, rhs: QuizModel) -> Bool {
        lhs.id == rhs.id && lhs.title == rhs.title && lhs.questions == rhs.questions
    }
    
    let id: String
    let title: String
    var questions: [QuestionModel]
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case questions
    }
    
    init(id: String, title: String, questions: [QuestionModel]) {
        self.id = id
        self.title = title
        self.questions = questions
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        questions = try container.decode([QuestionModel].self, forKey: .questions)
    }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(id, forKey: .id)
            try container.encode(title, forKey: .title)
            try container.encode(questions, forKey: .questions)
        }

}

struct QuestionModel: Equatable, Codable {
    static func == (lhs: QuestionModel, rhs: QuestionModel) -> Bool {
        lhs.id == rhs.id && lhs.text == rhs.text && lhs.allowsMultipleAnswers == rhs.allowsMultipleAnswers && lhs.answers == rhs.answers
    }
    
    let id: String
    let text: String
    let allowsMultipleAnswers: Bool
    var answers: [AnswerModel]
    
    mutating func deselectAllAnswers() {
        for index in answers.indices {
            answers[index].selected = false
        }
    }
    
    enum CodingKeys: CodingKey {
        case id
        case text
        case allowsMultipleAnswers
        case answers
    }
    
    init(id: String, text: String, allowsMultipleAnswers: Bool, answers: [AnswerModel]) {
        self.id = id
        self.text = text
        self.allowsMultipleAnswers = allowsMultipleAnswers
        self.answers = answers
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        text = try container.decode(String.self, forKey: .text)
        allowsMultipleAnswers = try container.decode(Bool.self, forKey: .allowsMultipleAnswers)
        answers = try container.decode([AnswerModel].self, forKey: .answers)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(text, forKey: .text)
        try container.encode(allowsMultipleAnswers, forKey: .allowsMultipleAnswers)
        try container.encode(answers, forKey: .answers)
    }
}

struct AnswerModel: Equatable, Codable {
    static func == (lhs: AnswerModel, rhs: AnswerModel) -> Bool {
        lhs.id == rhs.id && lhs.text == rhs.text && lhs.selected == rhs.selected && lhs.correct == rhs.correct
    }
    
    let id: String
    let text: String
    var selected: Bool = false 
    let correct: Bool
    
    enum CodingKeys: CodingKey {
        case id
        case text
        case selected
        case correct
    }
    
    init(id: String, text: String, selected: Bool? = false, correct: Bool) {
        self.id = id
        self.text = text
        self.selected = selected ?? false
        self.correct = correct
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.text = try container.decode(String.self, forKey: .text)
        self.selected = try container.decode(Bool.self, forKey: .selected)
        self.correct = try container.decode(Bool.self, forKey: .correct)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(text, forKey: .text)
        try container.encode(selected, forKey: .selected)
        try container.encode(correct, forKey: .correct)
    }
}


//
//  DashboardInteractor.swift
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

class DashboardInteractor: DashboardBusinessLogic, DashboardDataStore {
    var quiz: QuizModel?
    
    var presenter: DashboardPresentationLogic?
    var worker: DashboardWorker = DashboardWorker()
    
    // MARK: Do something
    
    func startQuiz(request: Dashboard.Quiz.Detail.Request) {
        //worker = DashboardWorker()
        
        // MOCK
        _ = worker.fetchMockQuizData()
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        let response = Dashboard.Quiz.Detail.Response(error: error, result: nil)
                        self.presenter?.presentQuiz(response: response)
                    default:
                        return
                    }
                },
                receiveValue: { quiz in
                    DispatchQueue.main.async {
                        let response = Dashboard.Quiz.Detail.Response(error: nil, result: quiz)
                        self.quiz = quiz
                        self.presenter?.presentQuiz(response: response)
                    }
                }
            )
    }
}
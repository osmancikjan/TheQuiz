//
//  DashboardPresenter.swift
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

class DashboardPresenter: DashboardPresentationLogic {
    weak var viewController: DashboardDisplayLogic?
    
    // MARK: Do something
    
    func presentQuiz(response: Dashboard.Quiz.Detail.Response) {
        if let error = response.error {
            DispatchQueue.main.async {
                self.viewController?.displayError(message: error.localizedDescription)
                return
            }
        } else if let quiz = response.result {
            DispatchQueue.main.async {
                let viewModel = Dashboard.Quiz.Detail.ViewModel(quiz: quiz)
                self.viewController?.displayQuiz(viewModel: viewModel)
                return
            }
        } else {
            DispatchQueue.main.async {
                self.viewController?.displayError(message: "Unknown Error")
                return
            }
        }
    }
}

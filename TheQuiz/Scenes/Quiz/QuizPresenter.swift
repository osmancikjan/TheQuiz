//
//  QuizPresenter.swift
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

class QuizPresenter: QuizPresentationLogic {
    weak var viewController: (any QuizDisplayLogic)?
    
    func reloadData() {
        viewController?.reloadData()
    }
    
    func showLeaveAlert() {
        viewController?.displayLeaveAlert()
    }
    
    func presentCorrectAnswer() {
        viewController?.diplayCorrectAnswer()
    }
    
    func presentIncorrectAnswer() {
        viewController?.diplayIncorrectAnswer()
    }
}

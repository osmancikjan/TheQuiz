//
//  DashboardProtocols.swift
//  TheQuiz
//
//  Created by Jan Osmančík on 22.03.2024.
//

import Foundation
import UIKit

protocol DashboardDisplayLogic: AnyObject {
    func displayQuiz(viewModel: Dashboard.Quiz.Detail.ViewModel)
    func displayError(message: String)
}

protocol DashboardBusinessLogic {
    func startQuiz(request: Dashboard.Quiz.Detail.Request)
}

protocol DashboardDataStore {
    var quiz: QuizModel? { get set }
}

protocol DashboardPresentationLogic {
    func presentQuiz(response: Dashboard.Quiz.Detail.Response)
}

@objc protocol DashboardRoutingLogic {
    func routeToQuiz()
}

protocol DashboardDataPassing {
    var dataStore: DashboardDataStore? { get }
}

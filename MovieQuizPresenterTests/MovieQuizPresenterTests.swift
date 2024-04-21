//
//  MovieQuizPresenterTests.swift
//  MovieQuiz
//
//  Created by Daria Granina on 21.04.2024.
//

import Foundation
import XCTest
@testable import MovieQuiz

final class MovieQuizViewControllerMock: UIViewController ,MovieQuizViewControllerProtocol {
    func show(quiz step: QuizStepViewModel) {
        
    }
    func show(quiz result: QuizResultsViewModel) {
        
    }
    func highlightImageBorder(isCorrectAnswer: Bool) {
        
    }
    func unlockButton() {
        
    }
    func blockButton() {
        
    }
    func showLoadingIndicator() {
        
    }
    func hideLoadingIndicator() {
        
    }
    func showNetworkError(message: String) {
        
    }
}

final class MovieQuizPresenterTests: XCTestCase {
    func testPresenterConvertModel() throws {
        let viewControllerMock = MovieQuizViewController()
        let sut = MovieQuizPresenter(viewController: viewControllerMock)
        
        let emptyData = Data()
        let question = QuizQuestion(image: emptyData, text: "Question Text", correctAnswer: true)
        let viewModel = sut.convert(model: question)
        
        XCTAssertNotNil(viewModel.image)
        XCTAssertEqual(viewModel.question, "Question Text")
        XCTAssertEqual(viewModel.questionNumber, "1/10")
    }
}

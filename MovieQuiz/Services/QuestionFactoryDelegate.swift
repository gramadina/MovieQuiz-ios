import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
    func didLoadFromServer()
    func didFailToLoadData(with error: Error)
}

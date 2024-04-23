import UIKit

protocol AlertPresenterProtocol {
    func showAlert(quiz result: AlertModel)
}

final class AlertPresenter: AlertPresenterProtocol {
    
    weak var alertDelegate: UIViewController?
    
    init(alertDelegate: UIViewController?) {
        self.alertDelegate = alertDelegate
    }
    
    func showAlert(quiz result: AlertModel) {
        let alert = UIAlertController(
            title: result.title,
            message: result.message,
            preferredStyle: .alert)
        
        guard let alertDelegate = alertDelegate else { return }
        
        let action = UIAlertAction(
            title: result.buttonText,
            style: .default,
            handler: result.completion)
        
        alert.addAction(action)
        alert.preferredAction = action
        
        alertDelegate.present(alert, animated: true, completion: nil)
    }
}

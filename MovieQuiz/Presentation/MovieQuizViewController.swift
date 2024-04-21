import UIKit

final class MovieQuizViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var counterLabel: UILabel!
    @IBOutlet weak private var noButton: UIButton!
    @IBOutlet weak private var yesButton: UIButton!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    private var presenter: MovieQuizPresenter!
    
    //MARK: - Override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MovieQuizPresenter(viewController: self)
        
        showLoadingIndicator()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Actions
    
    @IBAction private func yesButtonClicked(_ sender: Any) {
        presenter.yesButtonClicked()
        blockButton()
    }
    
    
    @IBAction private func noButtonClicked(_ sender: Any) {
        presenter.noButtonClicked()
        blockButton()
    }
    
    func unlockButton() {
            noButton.isEnabled = true
            yesButton.isEnabled = true
        }

    func blockButton() {
            noButton.isEnabled = false
            yesButton.isEnabled = false
        }
    
    // MARK: - Private functions
    
    func show(quiz step: QuizStepViewModel) {
        imageView.layer.borderColor = UIColor.clear.cgColor
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
    }
    
    func show(quiz result: QuizResultsViewModel) {
        let message = presenter.makeResultsMessage()
        
        let alert = UIAlertController(
            title: result.title,
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: result.buttonText, style: .default) { [weak self] _ in
            guard let self = self else { return }
            
            self.presenter.restartGame()
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func highlightImageBorder(isCorrectAnswer: Bool) {
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.cornerRadius = 20
        imageView.layer.borderColor = isCorrectAnswer ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
    }
    
    func showLoadingIndicator() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hideLoadingIndicator() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func showNetworkError(message: String) {
        hideLoadingIndicator()
        
        let alert = UIAlertController(
            title: "Ошибка",
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Попробовать ещё раз",
                                   style: .default) { [weak self] _ in
            guard let self = self else { return }
            
            self.presenter.restartGame()
        }
        
        alert.addAction(action)
    }
    
    
}



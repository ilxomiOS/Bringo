
import UIKit

class SigninViewController: UIViewController {
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private let phoneLabel = makeLabel(text: "Phone:", font: UIFont(name: "Arial", size: 20))
    private let phoneTextField = makeTextField()
    private let passwordLabel = makeLabel(text: "Password:", font: UIFont(name: "Arial", size: 20))
    private let passwordTextField = makeTextField(isSecureTextEntry: true)
    
    private let signinButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        phoneTextField.delegate = self
        passwordTextField.delegate = self
        signinButton.addTarget(self, action: #selector(signinButtonPressed), for: .touchUpInside)
        
        view.addSubview(logoImage)
        view.addSubview(phoneLabel)
        view.addSubview(phoneTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(signinButton)
        
        NSLayoutConstraint.activate([
            logoImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 150),
            
            phoneLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            phoneLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 50),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: phoneLabel.trailingAnchor, constant: 32),
            
            phoneTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            phoneTextField.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 16),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: phoneTextField.trailingAnchor, constant: 32),
            
            passwordLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            passwordLabel.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 16),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: passwordLabel.trailingAnchor, constant: 32),
            
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 16),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: 32),
            
            signinButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            signinButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: signinButton.trailingAnchor, constant: 32),
            signinButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func signinButtonPressed() {
        let foodVC = FoodViewController()
        let navigationController = UINavigationController(rootViewController: foodVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}

extension SigninViewController {
    static func makeLabel(text: String, font: UIFont? = nil) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = font
        return label
    }
    
    static func makeTextField(borderStyle: UITextField.BorderStyle? = nil, isSecureTextEntry: Bool? = nil) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = borderStyle ?? .roundedRect
        textField.isSecureTextEntry = isSecureTextEntry ?? false
        return textField
    }
}

extension SigninViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        phoneTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
        
    }
}

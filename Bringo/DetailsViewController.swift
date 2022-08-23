
import UIKit

class DetailsViewController: UIViewController {
    var pizza: Pizzas!
    
    private let pizzaImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let mozzarellaLabel = makeLabel(text: "Mozzarella")
    private let hamLabel = makeLabel(text: "Ham")
    private let mushroomsLabel = makeLabel(text: "Mushrooms")
    private let olivesLabel = makeLabel(text: "Olives")
    
    private let mozzarellaSwitch = makeSwitch(isOn: false)
    private let hamSwitch = makeSwitch(isOn: false)
    private let mushroomsSwitch = makeSwitch(isOn: false)
    private let olivesSwitch = makeSwitch(isOn: false)
    
    private let continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        pizzaImage.image = UIImage(named: pizza.pizza)
        
        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        
        view.addSubview(pizzaImage)
        view.addSubview(mozzarellaLabel)
        view.addSubview(hamLabel)
        view.addSubview(mushroomsLabel)
        view.addSubview(olivesLabel)
        view.addSubview(mozzarellaSwitch)
        view.addSubview(hamSwitch)
        view.addSubview(mushroomsSwitch)
        view.addSubview(olivesSwitch)
        view.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            pizzaImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            pizzaImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: pizzaImage.trailingAnchor, constant: 40),
            pizzaImage.heightAnchor.constraint(equalToConstant: 200),
            
            mozzarellaSwitch.centerYAnchor.constraint(equalTo: mozzarellaLabel.centerYAnchor),
            mozzarellaSwitch.leadingAnchor.constraint(equalTo: mozzarellaLabel.trailingAnchor, constant: 150),
            mozzarellaSwitch.topAnchor.constraint(equalTo: pizzaImage.bottomAnchor, constant: 30),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: mozzarellaSwitch.trailingAnchor, constant: 32),
            mozzarellaLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            hamSwitch.centerYAnchor.constraint(equalTo: hamLabel.centerYAnchor),
            hamSwitch.leadingAnchor.constraint(equalTo: hamLabel.trailingAnchor, constant: 150),
            hamSwitch.topAnchor.constraint(equalTo: mozzarellaSwitch.bottomAnchor, constant: 30),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: hamSwitch.trailingAnchor, constant: 32),
            hamLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            mushroomsSwitch.centerYAnchor.constraint(equalTo: mushroomsLabel.centerYAnchor),
            mushroomsSwitch.leadingAnchor.constraint(equalTo: mushroomsLabel.trailingAnchor, constant: 150),
            mushroomsSwitch.topAnchor.constraint(equalTo: hamSwitch.bottomAnchor, constant: 30),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: mushroomsSwitch.trailingAnchor, constant: 32),
            mushroomsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            olivesSwitch.centerYAnchor.constraint(equalTo: olivesLabel.centerYAnchor),
            olivesSwitch.leadingAnchor.constraint(equalTo: olivesLabel.trailingAnchor, constant: 150),
            olivesSwitch.topAnchor.constraint(equalTo: mushroomsSwitch.bottomAnchor, constant: 30),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: olivesSwitch.trailingAnchor, constant: 32),
            olivesLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            continueButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            continueButton.topAnchor.constraint(equalTo: olivesLabel.bottomAnchor, constant: 50),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: continueButton.trailingAnchor, constant: 32),
            continueButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func continueButtonPressed() {
//        let orderVC = OrderViewController()
//        let navigationVC = UINavigationController(rootViewController: orderVC)
//        navigationVC.modalPresentationStyle = .fullScreen
//        present(navigationVC, animated: true)
        
        let alertController = UIAlertController(title: "The order is paid", message: "Your order will be delivered soon", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.view.window?.rootViewController?.dismiss(animated: true)
        }))
        present(alertController, animated: true)
    }
    
}

extension DetailsViewController {
    static func makeLabel(text: String, font: UIFont? = nil) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = font
        return label
    }
    
    static func makeSwitch(isOn: Bool? = nil) -> UISwitch {
        let switchLabel = UISwitch()
        switchLabel.translatesAutoresizingMaskIntoConstraints = false
        switchLabel.isOn = isOn ?? true
        return switchLabel
    }
}

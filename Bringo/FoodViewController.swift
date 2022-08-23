
import UIKit

class FoodViewController: UIViewController {
    
    private let pizzaButton = makeButoon(title: "Pizza",
                                         titleColor: .black,
                                         cornerRadius: 0,
                                         borderWidth: 2,
                                         borderColor: UIColor.lightGray.cgColor)
    
    private let sushiButton = makeButoon(title: "Sushi",
                                         titleColor: .black,
                                         cornerRadius: 0,
                                         borderWidth: 2,
                                         borderColor: UIColor.lightGray.cgColor)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        title = "Food"
        view.backgroundColor = .white
        
        sushiButton.addTarget(self, action: #selector(sushiButtonPressed), for: .touchUpInside)
        pizzaButton.addTarget(self, action: #selector(pizzaButtonPressed), for: .touchUpInside)
        
        view.addSubview(pizzaButton)
        view.addSubview(sushiButton)
        
        NSLayoutConstraint.activate([
            pizzaButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            pizzaButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            pizzaButton.heightAnchor.constraint(equalToConstant: 150),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: pizzaButton.trailingAnchor, constant: 16),
            
            sushiButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            sushiButton.topAnchor.constraint(equalTo: pizzaButton.bottomAnchor, constant: 20),
            sushiButton.heightAnchor.constraint(equalToConstant: 150),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: sushiButton.trailingAnchor, constant: 16)
        ])
    }
    
}

extension FoodViewController {
    static func makeButoon(title: String? = nil,
                           titleColor: UIColor? = nil,
                           backgroundColor: UIColor? = nil,
                           font: UIFont? = nil,
                           cornerRadius: CGFloat? = nil,
                           borderWidth: CGFloat? = nil,
                           borderColor: CGColor? = nil)-> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.titleLabel?.font = font
        button.layer.cornerRadius = cornerRadius ?? 6
        button.layer.borderWidth = borderWidth ?? 0
        button.layer.borderColor = borderColor ?? UIColor.clear.cgColor
        return button
    }
    
    @objc private func sushiButtonPressed() {
        sushiButton.setTitle("Sushi (Coming soon)", for: .normal)
        sushiButton.layer.borderColor = UIColor.red.cgColor
    }
    
    @objc private func pizzaButtonPressed() {
        let tableViewController = PizzaListViewController()
        navigationController?.pushViewController(tableViewController, animated: true)
        pizzaButton.layer.borderColor = UIColor.green.cgColor
    }
}

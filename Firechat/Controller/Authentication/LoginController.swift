//
//  LoginController.swift
//  Firechat
//
//  Created by Alec Meyer on 11/5/21.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Properties
    
    private let iconImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "bubble.right")
        iv.tintColor = .white
        return iv
    }()
    
    private lazy var emailContainerView: InputContainerView = {
        let imageView = InputContainerImageView(image: UIImage(systemName: "envelope")!, frame: CGRect(height: 24, width: 28))
        let containerView = InputContainerView(imageView: imageView, textField: emailTextField)
        return containerView
    }()
    
    private lazy var passwordContainerView: InputContainerView = {
        let imageView = InputContainerImageView(image: UIImage(systemName: "lock")!, frame: CGRect(height: 28, width: 28))
        let containerView = InputContainerView(imageView: imageView, textField: passwordTextField)
        return containerView
    }()
    
    private let loginButton: UIButton = {
        let button = OnboardingButton(title: "Log In")
        return button
    }()
    
    private let emailTextField: InputContainerTextField = {
        let textField = InputContainerTextField(placeholder: "Email")
        return textField
    }()
    
    private let passwordTextField: InputContainerTextField = {
        let textField = InputContainerTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = OnboardingSwitchFlowButton(description: "Don't have an account?", callToAction: "Sign Up")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Selectors
    @objc func handleShowSignUp() {
        let controller = RegistrationController()
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradientLayer()
        configureUI()

    }
    
    // MARK: - Helpers
    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .systemRed
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 120, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stack = UIStackView(arrangedSubviews: [
            emailContainerView,
            passwordContainerView,
            loginButton
        ])
        
        stack.axis = .vertical
        stack.spacing = 16
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }

}

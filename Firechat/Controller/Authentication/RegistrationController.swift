//
//  RegistrationController.swift
//  Firechat
//
//  Created by Alec Meyer on 11/5/21.
//

import UIKit

class RegistrationController: UIViewController {
    
    // MARK: - Properties
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var emailContainerView: InputContainerView = {
        let imageView = InputContainerImageView(image: UIImage(systemName: "envelope")!, frame: CGRect(height: 24, width: 28))
        let containerView = InputContainerView(imageView: imageView, textField: emailTextField)
        return containerView
    }()
    
    private lazy var fullNameContainerView: InputContainerView = {
        let imageView = InputContainerImageView(image: UIImage(systemName: "person")!, frame: CGRect(height: 28, width: 28))
        let containerView = InputContainerView(imageView: imageView, textField: fullNameTextField)
        return containerView
    }()
    
    private lazy var usernameContainerView: InputContainerView = {
        let imageView = InputContainerImageView(image: UIImage(systemName: "person")!, frame: CGRect(height: 28, width: 28))
        let containerView = InputContainerView(imageView: imageView, textField: usernameTextField)
        return containerView
    }()
    
    private lazy var passwordContainerView: InputContainerView = {
        let imageView = InputContainerImageView(image: UIImage(systemName: "lock")!, frame: CGRect(height: 28, width: 28))
        let containerView = InputContainerView(imageView: imageView, textField: passwordTextField)
        return containerView
    }()
    
    private let emailTextField: InputContainerTextField = {
        let textField = InputContainerTextField(placeholder: "Email")
        return textField
    }()
    
    private let fullNameTextField: InputContainerTextField = {
        let textField = InputContainerTextField(placeholder: "Full Name")
        return textField
    }()
    
    private let usernameTextField: InputContainerTextField = {
        let textField = InputContainerTextField(placeholder: "Username")
        return textField
    }()
    
    private let passwordTextField: InputContainerTextField = {
        let textField = InputContainerTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let signUpButton: UIButton = {
        let button = OnboardingButton(title: "Sign Up")
        button.isEnabled = false
        return button
    }()
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = OnboardingSwitchFlowButton(description: "Already have an account?", callToAction: "Log In")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc func handleSelectPhoto() {
        
    }
    
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpers
    func configureUI() {
        configureGradientLayer()
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.setDimensions(height: 200, width: 200)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        
        let stack = UIStackView(arrangedSubviews: [
            emailContainerView,
            fullNameContainerView,
            usernameContainerView,
            passwordContainerView,
            signUpButton
        ])
        
        stack.axis = .vertical
        stack.spacing = 16
        view.addSubview(stack)
        stack.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
}

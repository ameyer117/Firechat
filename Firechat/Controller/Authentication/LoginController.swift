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
    
    private lazy var emailContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        containerView.setHeight(height: 50)
        
        // Lock Icon
        let iv = UIImageView()
        iv.image = UIImage(systemName: "envelope")
        iv.tintColor = .white
        containerView.addSubview(iv)
        iv.anchor(left: containerView.leftAnchor, paddingLeft: 8)
        iv.setDimensions(height: 24, width: 28)
        iv.centerY(inView: containerView)
        
        // Password Text Field
        containerView.addSubview(emailTextField)
        emailTextField.centerY(inView: containerView)
        emailTextField.anchor(left: iv.rightAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingLeft: 8, paddingBottom: -8)
        
        return containerView
    }()
    
    private lazy var passwordContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        containerView.setHeight(height: 50)
        
        // Lock Icon
        let iv = UIImageView()
        iv.image = UIImage(systemName: "lock")
        iv.tintColor = .white
        containerView.addSubview(iv)
        iv.anchor(left: containerView.leftAnchor, paddingLeft: 8)
        iv.setDimensions(height: 28, width: 28)
        iv.centerY(inView: containerView)
        
        // Password text field
        containerView.addSubview(passwordTextField)
        passwordTextField.centerY(inView: containerView)
        passwordTextField.anchor(left: iv.rightAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingLeft: 8, paddingBottom: -8)
        
        return containerView
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemRed
        button.setHeight(height: 50)
        return button
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.textColor = .white
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.textColor = .white
        
        return textField
    }()
    
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
    }
    
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}

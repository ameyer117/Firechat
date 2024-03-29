//
//  RegistrationController.swift
//  Firechat
//
//  Created by Alec Meyer on 11/5/21.
//

import UIKit
import FirebaseStorage
import FirebaseAuth

class RegistrationController: UIViewController {
    
    // MARK: - ViewModel
    private var viewModel = RegistrationViewModel()
    
    // MARK: - Properties
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        button.clipsToBounds = true
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
        textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        return textField
    }()
    
    private let fullNameTextField: InputContainerTextField = {
        let textField = InputContainerTextField(placeholder: "Full Name")
        textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        return textField
    }()
    
    private let usernameTextField: InputContainerTextField = {
        let textField = InputContainerTextField(placeholder: "Username")
        textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        return textField
    }()
    
    private let passwordTextField: InputContainerTextField = {
        let textField = InputContainerTextField(placeholder: "Password")
        textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let signUpButton: UIButton = {
        let button = OnboardingButton(title: "Sign Up")
        button.addTarget(self, action: #selector(signUpUser), for: .touchUpInside)
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
    @objc func signUpUser() {
        viewModel.registerUser { error in
            if let error = error {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func handleSelectPhoto() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func textDidChange(_ sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        } else if sender == passwordTextField {
            viewModel.password = sender.text
        } else if sender == usernameTextField {
            viewModel.username = sender.text
        } else if sender == fullNameTextField {
            viewModel.fullName = sender.text
        }
        
        signUpButton.isEnabled = viewModel.formIsValid
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
    
    func configureNotificationObservers() {
//        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
    }
}

// MARK: - UIImagePickerControllerDelegate

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        plusPhotoButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.layer.borderWidth = 3.0
        plusPhotoButton.layer.cornerRadius = 200 / 2
        plusPhotoButton.imageView?.contentMode = .scaleAspectFill
        viewModel.profileImageData = image?.jpegData(compressionQuality: 0.3)
        signUpButton.isEnabled = viewModel.formIsValid
        
        dismiss(animated: true, completion: nil)
    }
}

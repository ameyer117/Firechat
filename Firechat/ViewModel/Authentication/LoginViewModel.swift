//
//  LoginViewModel.swift
//  Firechat
//
//  Created by Alec Meyer on 11/6/21.
//

import UIKit
import FirebaseAuth

struct LoginViewModel: FormValidationProtocol {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    func loginUser(completion: ((AuthDataResult?, Error?) -> Void)? = nil) {
        guard let email = email else { return }
        guard let password = password else { return }
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
}

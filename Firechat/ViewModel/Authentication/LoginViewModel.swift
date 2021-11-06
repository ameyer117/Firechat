//
//  LoginViewModel.swift
//  Firechat
//
//  Created by Alec Meyer on 11/6/21.
//

import UIKit

struct LoginViewModel: FormValidationProtocol {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
}

//
//  RegistrationViewModel.swift
//  Firechat
//
//  Created by Alec Meyer on 11/6/21.
//

import Foundation

struct RegistrationViewModel: FormValidationProtocol {
    var email: String?
    var fullName: String?
    var username: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && fullName?.isEmpty == false && username?.isEmpty == false
    }
}

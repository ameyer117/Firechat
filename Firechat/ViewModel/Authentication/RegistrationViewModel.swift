//
//  RegistrationViewModel.swift
//  Firechat
//
//  Created by Alec Meyer on 11/6/21.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

struct RegistrationViewModel: FormValidationProtocol {
    var email: String?
    var fullName: String?
    var username: String?
    var password: String?
    var profileImageData: Data?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && fullName?.isEmpty == false && username?.isEmpty == false && profileImageData != nil
    }
    
    func registerUser() {
        guard let imageData = profileImageData else { return }
        guard let email = email else { return }
        guard let password = password else { return }
        guard let username = username?.lowercased() else { return }
        guard let fullName = fullName else { return }

        let filename = "\(NSUUID().uuidString).jpg"
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        ref.putData(imageData, metadata: nil) { meta, error in
            if let error = error {
                print("Failed to upload image \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, error in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("Failed to create user: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let uid = result?.user.uid else { return }
                    
                    let data = [
                        "uid": uid,
                        "email": email,
                        "fullName": fullName,
                        "userName": username,
                        "profileImageUrl": profileImageUrl
                    ]
                    
                    Firestore.firestore().collection("users").document(uid).setData(data) { error in
                        if let error = error {
                            print("Firestore error: \(error.localizedDescription)")
                            return
                        }
                        
                        print("Hooray go check firestore!")
                    }
                    
                }
            }
        }
    }
}

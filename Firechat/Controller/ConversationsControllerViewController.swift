//
//  ConversationsViewController.swift
//  Firechat
//
//  Created by Alec Meyer on 11/5/21.
//

import UIKit

class ConversationsViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc func showProfile() {
        print(123)
    }

    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Messages"
        
        let image = UIImage(systemName: "person.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(showProfile))
    }
}

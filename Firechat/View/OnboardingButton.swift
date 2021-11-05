//
//  OnboardingButton.swift
//  Firechat
//
//  Created by Alec Meyer on 11/5/21.
//

import UIKit

class OnboardingButton: HighlightedButton {
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        layer.cornerRadius = 5
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        backgroundColor = .systemPink
        setHeight(height: 50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

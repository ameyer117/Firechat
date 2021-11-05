//
//  OnboardingSwitchFlowButton.swift
//  Firechat
//
//  Created by Alec Meyer on 11/5/21.
//

import UIKit

class OnboardingSwitchFlowButton: HighlightedButton {
   
    init(description: String, callToAction: String) {
        super.init(frame: .zero)
        let attributedTitle = NSMutableAttributedString(string: "\(description) ", attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: callToAction, attributes: [.font: UIFont.boldSystemFont(ofSize: 16), .foregroundColor: UIColor.white]))
        setAttributedTitle(attributedTitle, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

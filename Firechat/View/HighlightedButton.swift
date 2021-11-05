//
//  HighlightedButton.swift
//  Firechat
//
//  Created by Alec Meyer on 11/5/21.
//

import UIKit

class HighlightedButton: UIButton {
    open override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.5 : 1
        }
    }
    
    open override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1 : 0.5
        }
    }
}

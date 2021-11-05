//
//  InputContainerImageView.swift
//  Firechat
//
//  Created by Alec Meyer on 11/5/21.
//

import UIKit

class InputContainerImageView : UIImageView {
    
    init(image: UIImage, frame: CGRect) {
        super.init(frame: .zero)
        self.image = image
        tintColor = .white
        alpha = 0.87
        setDimensions(height: frame.height, width: frame.width)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

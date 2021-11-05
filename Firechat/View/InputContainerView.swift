//
//  InputContainerView.swift
//  Firechat
//
//  Created by Alec Meyer on 11/5/21.
//

import UIKit

class InputContainerView: UIView {
    
    init(imageView: UIImageView, textField: UITextField) {
        super.init(frame: .zero)
        setHeight(height: 50)
        
        // Icon image
        addSubview(imageView)
        imageView.centerY(inView: self)
        imageView.anchor(left: leftAnchor, paddingLeft: 8)
        
        //Text Field
        addSubview(textField)
        textField.centerY(inView: self)
        textField.anchor(left: imageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 8, paddingBottom: -8)
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        addSubview(dividerView)
        dividerView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 8, height: 0.75)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

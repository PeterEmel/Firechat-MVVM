//
//  CustomTextField.swift
//  FireChat MVVM
//
//  Created by Peter Emel on 6/10/21.
//  Copyright © 2021 Peter Emel. All rights reserved.
//

import UIKit

class CustomTextField : UITextField {
    init(placeholder: String){
        super.init(frame: .zero)
    
        borderStyle = .none
        font = UIFont.systemFont(ofSize: 16)
        textColor = UIColor.white
        keyboardAppearance = .dark
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  CustomButton.swift
//  FireChat MVVM
//
//  Created by Peter Emel on 6/14/21.
//  Copyright © 2021 Peter Emel. All rights reserved.
//

import UIKit

class CustomButton : UIButton {
    init(title: String){
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        layer.cornerRadius = 5
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        setTitleColor(UIColor.white, for: .normal)
        setHeight(height: 50)
        isEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

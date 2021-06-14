//
//  InputContainerView.swift
//  FireChat MVVM
//
//  Created by Peter Emel on 6/10/21.
//  Copyright © 2021 Peter Emel. All rights reserved.
//

import UIKit

class InputContainerView : UIView {
    
    init(image: UIImage?, textField: UITextField){
        super.init(frame: .zero)
        
        setHeight(height: 50)
        
        let iv = UIImageView()
        iv.image = image
        iv.tintColor = UIColor.white
        iv.alpha = 0.87
        
        addSubview(iv)
        iv.centerY(inView: self)
        iv.setDimensions(height: 24, width: 24)
        iv.anchor(left: leftAnchor, paddingLeft: 8)
        
        addSubview(textField)
        textField.centerY(inView: self)
        textField.anchor(left: iv.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 8, paddingBottom: -8)
        
        let dividerView = UIView()
        dividerView.backgroundColor = UIColor.white
        addSubview(dividerView)
        dividerView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 8, height: 0.75)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  AccountButton.swift
//  FireChat MVVM
//
//  Created by Peter Emel on 6/14/21.
//  Copyright © 2021 Peter Emel. All rights reserved.
//

import UIKit

class AccountButton : UIButton {
    init(title: String, title2: String){
        super.init(frame: .zero)
        
        let attributedTitle = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.white])
        attributedTitle.append(NSAttributedString(string: title2, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.white]))
        
        setAttributedTitle(attributedTitle, for: .normal)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  MessageViewModel.swift
//  FireChat MVVM
//
//  Created by Peter Emel on 6/18/21.
//  Copyright © 2021 Peter Emel. All rights reserved.
//

import UIKit

struct MessageViewModel {
    private let message : Message
    
    var messageBackgroundColor: UIColor {
        return message.isFromCurrentUser ? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) : UIColor.purple
    }
    var messageTextColor: UIColor {
        return message.isFromCurrentUser ? UIColor.black : UIColor.white
    }
    
    
    var rightAnchorActive: Bool {
        return message.isFromCurrentUser
    }
    var leftAnchorActive: Bool {
        return !message.isFromCurrentUser
    }
  
    
    var shouldHideProfileImage: Bool {
        return message.isFromCurrentUser
    }
    
    var profileImageUrl: URL? {
        guard let user = message.user else {return nil}
        return URL(string: user.profileImageUrl)
    }
    
    
    init(message: Message) {
        self.message = message
    }
}

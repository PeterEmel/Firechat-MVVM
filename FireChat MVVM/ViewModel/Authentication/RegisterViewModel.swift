//
//  RegisterViewModel.swift
//  FireChat MVVM
//
//  Created by Peter Emel on 6/14/21.
//  Copyright © 2021 Peter Emel. All rights reserved.
//

import Foundation

struct RegisterViewModel: AuthenticationProtocol {
    
    var email: String?
    var fullname: String?
    var username: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && fullname?.isEmpty == false && username?.isEmpty == false && password?.isEmpty == false
    }
}

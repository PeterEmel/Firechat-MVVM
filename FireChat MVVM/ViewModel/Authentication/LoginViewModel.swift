//
//  LoginViewModel.swift
//  FireChat MVVM
//
//  Created by Peter Emel on 6/14/21.
//  Copyright © 2021 Peter Emel. All rights reserved.
//

import Foundation

protocol AuthenticationProtocol {
    var formIsValid: Bool {get}
}

struct LoginViewModel: AuthenticationProtocol {
    
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
}

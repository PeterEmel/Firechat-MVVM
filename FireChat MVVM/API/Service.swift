//
//  Service.swift
//  FireChat MVVM
//
//  Created by Peter Emel on 6/16/21.
//  Copyright © 2021 Peter Emel. All rights reserved.
//

import Foundation
import Firebase

struct Service {
    static func fetchUsers(completion: @escaping([User]) -> Void) {
        
        var users = [User]()
        
        Firestore.firestore().collection("users").getDocuments { snapshot, error in
            snapshot?.documents.forEach({ document in
                
                let dictionary = document.data()
                let user = User(dictionary: dictionary)
                
                users.append(user)
                completion(users)
            })
        }
    }
}

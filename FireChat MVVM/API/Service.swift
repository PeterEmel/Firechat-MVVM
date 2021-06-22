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
    
    static func fetchMessages(forUser user: User, completion: @escaping ([Message]) -> Void) {
        var messages = [Message]()
        
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        
        let query = COLLECTION_MESSAGES.document(currentUid).collection(user.uid).order(by: "timestamp")
        query.addSnapshotListener { (snapshot, error) in
            snapshot?.documentChanges.forEach({ (change) in
                if change.type == .added {
                    let dictionary = change.document.data()
                    messages.append(Message(dictionary: dictionary))
                    completion(messages)
                }
            })
        }
    }
    
    static func uploadMessage(_ message: String, toUser user: User, completion: ((Error?) -> Void)?) {
        guard let currentuid = Auth.auth().currentUser?.uid else {return}
        let data = ["text": message, "fromId": currentuid, "toId": user.uid, "timestamp": Timestamp(date: Date())] as [String : Any]
      
        COLLECTION_MESSAGES.document(currentuid).collection(user.uid).addDocument(data: data) { _ in
            COLLECTION_MESSAGES.document(user.uid).collection(currentuid).addDocument(data: data, completion: completion)
        }
    }
}

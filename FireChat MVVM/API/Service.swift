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
        
//        var users = [User]()
        
        COLLECTION_USERS.getDocuments { snapshot, error in
//            snapshot?.documents.forEach({ document in
//
//                let dictionary = document.data()
//                let user = User(dictionary: dictionary)
//
//                users.append(user)
//                completion(users)
//            })
            
            guard var users = snapshot?.documents.map({ User(dictionary: $0.data()) }) else {return}
            
            if let i = users.firstIndex(where: { $0.uid == Auth.auth().currentUser?.uid }) {
                users.remove(at: i)
            }
            completion(users)
        }
    }
    
    static func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        COLLECTION_USERS.document(uid).getDocument { (snapshot, error) in
            guard let dictionary = snapshot?.data() else {return}
            let user = User(dictionary: dictionary)
            completion(user)
        }
    }
    
    
    static func uploadMessage(_ message: String, toUser user: User, completion: ((Error?) -> Void)?) {
        guard let currentuid = Auth.auth().currentUser?.uid else {return}
        let data = ["text": message, "fromId": currentuid, "toId": user.uid, "timestamp": Timestamp(date: Date())] as [String : Any]
      
        COLLECTION_MESSAGES.document(currentuid).collection(user.uid).addDocument(data: data) { _ in
            COLLECTION_MESSAGES.document(user.uid).collection(currentuid).addDocument(data: data, completion: completion)
            
            COLLECTION_MESSAGES.document(currentuid).collection("recent-messages").document(user.uid).setData(data)
            
            COLLECTION_MESSAGES.document(user.uid).collection("recent-messages").document(currentuid).setData(data)

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
    
    static func fetchConversations(completion: @escaping ([Conversation]) -> Void) {
        var conversations = [Conversation]()
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let query = COLLECTION_MESSAGES.document(uid).collection("recent-messages").order(by: "timestamp")
        query.addSnapshotListener { (snapshot, error) in
            snapshot?.documentChanges.forEach({ (change) in
                let dictionary = change.document.data()
                let message = Message(dictionary: dictionary)
                
                self.fetchUser(withUid: message.chatPartnerId, completion: { (user) in
                    let conversation = Conversation(user: user, message: message)
                    conversations.append(conversation)
                    completion(conversations)
                })
            })
        }
    }
}

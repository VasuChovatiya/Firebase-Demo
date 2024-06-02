//
//  AuthResultInfo.swift
//  Firebase-Demo(All-in-one)
//
//  Created by Vasu Chovatiya on 02/06/2024.
//

import Foundation
import FirebaseAuth

struct AuthResultInfo: Codable {
    var id: String
    var email: String?
    var photoURl: String?
    var phoneNumber: String?
    var fullName: String?
    
    init(user: User) {
        self.id = user.uid
        self.email = user.email
        self.photoURl = user.photoURL?.absoluteString
        self.phoneNumber = user.phoneNumber
        self.fullName = user.displayName
    }
}

//
//  AuthenticationManager.swift
//  Firebase-Demo(All-in-one)
//
//  Created by Vasu Chovatiya on 02/06/2024.
//

import Foundation
import FirebaseAuth


final class AuthenticationManager {
    // MARK: -  Properties
    static let shared = AuthenticationManager()
    
    // MARK: -  Init
    private init() {
        
    }
    
    
    
    // MARK: -  Functions
    
    func getAUthenticatedUser() -> AuthResultInfo? {
        if let user = Auth.auth().currentUser {
            return AuthResultInfo(user: user)
        }
        return nil
    }
    
    func createUser(email: String, password: String, onCompletion: @escaping((_ user: AuthResultInfo?, _ error: Error?) -> ())) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                onCompletion(nil, error)
                print("Error While Creating user in Firebase :- \(error)")
            }
            
            if let result = result {
                let authResult = AuthResultInfo(user: result.user)
                onCompletion(authResult, nil)
                print("User Successfully Created :- \(authResult)")
            }
        }
    }
    
    func signIn(email: String, password: String, onCompletion: @escaping((_ user: AuthResultInfo?, _ error: Error?) -> ())) {
      
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                onCompletion(nil, error)
                print("Error While Creating user in Firebase :- \(error)")
            }
            
            if let result = result {
                let authResult = AuthResultInfo(user: result.user)
                onCompletion(authResult, nil)
                print("User Successfully Created :- \(authResult)")
            }
        }
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
    func changePassword(email: String) async throws {
        return try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
}

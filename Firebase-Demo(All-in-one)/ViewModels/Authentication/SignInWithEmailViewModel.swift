//
//  SignInWithEmailViewModel.swift
//  Firebase-Demo(All-in-one)
//
//  Created by Vasu Chovatiya on 02/06/2024.
//

import Foundation
final class SignInWithEmailViewModel: ObservableObject {
    // MARK: -  Properties
    @Published var emailStr: String = ""
    @Published var passwordStr: String = ""
    
    
    // MARK: -  Functions
    
    func signIn(onCompletion: @escaping((_ user: AuthResultInfo?, _ error: Error?) -> ())) {
        AuthenticationManager.shared.signIn(email: self.emailStr.trimed(), password: self.passwordStr.trimed(), onCompletion: onCompletion)
    }
    
    
    // MARK: -  Deinit
    deinit {
        print("SignInWithEmailViewModel Deinited")
    }
}

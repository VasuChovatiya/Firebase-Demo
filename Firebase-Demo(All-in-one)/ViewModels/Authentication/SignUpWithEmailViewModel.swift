//
//  SignUpWithEmailViewModel.swift
//  Firebase-Demo(All-in-one)
//
//  Created by Vasu Chovatiya on 02/06/2024.
//

import Foundation


@MainActor
final class SignUpWithEmailViewModel: ObservableObject {
    
    // MARK: -  Properties
    @Published var emailStr: String = ""
    @Published var passwordStr: String = ""
    
    
    // MARK: -  Functions
    
    func creatUser(onCompletion: @escaping((_ user: AuthResultInfo?, _ error: Error?) -> ())) {
        AuthenticationManager.shared.createUser(email: self.emailStr.trimed(), password: self.passwordStr.trimed(), onCompletion: onCompletion)
    }
    
    
    // MARK: -  Deinit
    deinit {
        print("SignUpWithEmailViewModel Deinited")
    }

}

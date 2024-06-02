//
//  SettingsViewModel.swift
//  Firebase-Demo(All-in-one)
//
//  Created by Vasu Chovatiya on 02/06/2024.
//

import Foundation

@MainActor
final class SettingsViewModel: ObservableObject {
    
    //MARK: - Function
    
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
    
    
    func changePassword(for user: AuthResultInfo) async throws {
        if let email = user.email {
            try await AuthenticationManager.shared.changePassword(email: email)
        } else {
            throw URLError(.cannotDecodeRawData)
        }
    }
    
}

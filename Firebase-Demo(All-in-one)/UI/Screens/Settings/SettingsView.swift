//
//  SettingsView.swift
//  Firebase-Demo(All-in-one)
//
//  Created by Vasu Chovatiya on 02/06/2024.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - Properties
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    //MARK: - Body
    var body: some View {
        VStack(content: {
            List {
                Button("Log Out") {
                    self.signOutCurrentUser()
                }
                
                Button("Change password") {
                    self.changePasswordForCurrentUser()
                }
            }
            
        })
        .navigationTitle("Settings")
    }
    
    
    //MARK: - Functions
    func signOutCurrentUser() {
        Task {
            do {
                try viewModel.signOut()
                UIApplication.shared.keyWindow1?.showToastAtTop(message: "Signed Out!")
                showSignInView = true
            } catch {
                print("Error While logging out current User: - \(error)")
                UIApplication.shared.keyWindow1?.showToastAtTop(message: "Something went wrong please try again later!")
            }
        }
    }
    
    func changePasswordForCurrentUser() {
        Task {
            do {
                if let currentUser = AuthenticationManager.shared.getAUthenticatedUser() {
                    try await viewModel.changePassword(for: currentUser)
                    UIApplication.shared.keyWindow1?.showToastAtTop(message: "Reset Password link send to your mail!")
                } else {
                    UIApplication.shared.keyWindow1?.showToastAtTop(message: "Something went wrong please try again later!")
                }
            } catch {
                print("Error While logging out current User: - \(error)")
                UIApplication.shared.keyWindow1?.showToastAtTop(message: "Something went wrong please try again later!")
            }
        }
        
    }
}



//MARK: - Preview

#Preview {
    NavigationStack {
        SettingsView(showSignInView: .constant(false))
    }
}

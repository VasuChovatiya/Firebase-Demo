//
//  SignInWithEmailView.swift
//  Firebase-Demo(All-in-one)
//
//  Created by Vasu Chovatiya on 02/06/2024.
//

import SwiftUI

struct SignUpWithEmailView: View {
    //MARK: - Properties
    
    @StateObject private var viewModel = SignUpWithEmailViewModel()
    @State private var isLoading: Bool = false
    
    
    //MARK: - Body
    
    var body: some View {
        VStack(content: {
            TextField("Email....", text: $viewModel.emailStr)
                .padding()
                .background {
                    Color.gray.opacity(0.4)
                }
                .cornerRadius(10.0)
                .keyboardType(.emailAddress)
            
            SecureField("Password....", text: $viewModel.passwordStr)
                .padding()
                .background {
                    Color.gray.opacity(0.4)
                }
                .cornerRadius(10.0)

            
            Button {
                validateEmailAndPasswordAndCreateUser()
            } label: {
                ZStack(alignment: .center, content: {
                    if isLoading == true {
                        ProgressView()
                            .progressViewStyle(.circular)
                    } else {
                        Text("Create Account")
                            .font(.headline)
                    }
                })
                .tint(.White)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .foregroundStyle(Color.White)
                .background(content: {
                    Color.blue
                })
                .cornerRadius(10.0)
                
            }
            
            Spacer()
            
        })
        .padding()
        .navigationTitle("Sign Up With Email")
    }
    
    
    
    //MARK: - Functions
    
    private func validateEmailAndPasswordAndCreateUser() {
        guard viewModel.emailStr.isEmpty == false, viewModel.passwordStr.isEmpty == false else {
            UIApplication.shared.keyWindow1?.showToastAtTop(message: "mail or password Can't be empty")
            print("Email or Password is not Valid")
            return
        }
        
        
        /// Add Addtional Validation Like IsEmail Valid or not xyz
        self.isLoading = true
        viewModel.creatUser { user, error in
            self.isLoading = false
            if error != nil {
                UIApplication.shared.keyWindow1?.showToastAtTop(message: "Something went wrong please try again late! or Check your credentials")
            }
            
            if user != nil {
                
                UIApplication.shared.keyWindow1?.showToastAtTop(message: "Signed up")
                NotificationCenter.default.post(name: .checkIsUserSignedIn, object: user)
            }
        }
    }
}


//MARK: - Preview

#Preview {
    NavigationStack {
        SignUpWithEmailView()
    }
}

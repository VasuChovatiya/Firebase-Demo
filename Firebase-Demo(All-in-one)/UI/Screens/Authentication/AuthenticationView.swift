//
//  SignInView.swift
//  Firebase-Demo(All-in-one)
//
//  Created by Vasu Chovatiya on 02/06/2024.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        VStack(content: {
        
            Spacer()
            
            NavigationLink {
                SignUpWithEmailView()
            } label: {
                Text("Create an Acoout With Email")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .foregroundStyle(Color.White)
                    .background(content: {
                        Color.blue
                    })
                    .cornerRadius(10.0)
                    
            }
            
            
            HStack(content: {
                Text("Already have an account?")
                
                NavigationLink {
                    SignInWithEmailView()
                } label: {
                    Text("Sign In")
                        .bold()
                        .font(.headline)
                        .foregroundStyle(Color.blue)
                }
            })

        })
        .padding()
        .navigationTitle("Create Account")
    }
    
}

#Preview {
    NavigationStack {
        AuthenticationView()
    }
}

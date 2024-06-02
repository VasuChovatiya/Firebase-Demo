//
//  ContentView.swift
//  Firebase-Demo(All-in-one)
//
//  Created by Vasu Chovatiya on 13/11/23.
//

import SwiftUI

struct RootView: View {
    //MARK: - Properties
    @State private var showAuthenticationView: Bool = false
    @State private var isOnAppearCalledOnce: Bool = false
    
    //MARK: - Body
    
    var body: some View {
        ZStack(alignment: .center, content: {
            NavigationStack {
                SettingsView(showSignInView: $showAuthenticationView)
            }
        })
        .onAppear(perform: {
            if isOnAppearCalledOnce == false {
                isOnAppearCalledOnce = true
                checkIsUserSignedIn()
                NotificationCenter.default.addObserver(forName: .checkIsUserSignedIn, object: nil, queue: .main) { _ in
                    checkIsUserSignedIn()
                }
            }
            
        })
        .fullScreenCover(isPresented: $showAuthenticationView, content: {
            NavigationStack {
                AuthenticationView()
            }
        })
    }
    
    //MARK: - Functions
    
    private func checkIsUserSignedIn() {
        if AuthenticationManager.shared.getAUthenticatedUser() != nil {
            showAuthenticationView = false
        } else {
            showAuthenticationView = true
        }
    }
}


//MARK: - Preview

#Preview {
    RootView()
}

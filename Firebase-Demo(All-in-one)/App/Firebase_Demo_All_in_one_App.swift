//
//  Firebase_Demo_All_in_one_App.swift
//  Firebase-Demo(All-in-one)
//
//  Created by Vasu Chovatiya on 13/11/23.
//

import SwiftUI
import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct Firebase_Demo_All_in_one_App: App {
    
    
    //MARK: - Properties
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    //MARK: - Body
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
    
    //MARK: - Functions

}

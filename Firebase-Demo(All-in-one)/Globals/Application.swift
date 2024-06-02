//
//  Application.swift
//  Firebase-Demo(All-in-one)
//
//  Created by Vasu Chovatiya on 02/06/2024.
//

import Foundation
import SwiftUI
import UIKit


struct Application {
    static var appBundleID: String = "com.vc.firebasedemo"
}

extension Notification.Name {
    static let checkIsUserSignedIn = Notification.Name("CHCEK_IS_USER_SIGNED_IN")
}

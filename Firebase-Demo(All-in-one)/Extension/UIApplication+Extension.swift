//
//  UIApplication+Extension.swift
//  Firebase-Demo(All-in-one)
//
//  Created by Vasu Chovatiya on 02/06/2024.
//

import UIKit

extension UIApplication {

    var keyWindow1: UIWindow? {
        connectedScenes
//            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .filter { $0.isKeyWindow }
            .first
    }
}

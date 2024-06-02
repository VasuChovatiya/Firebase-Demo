//
//  UIView+Extension.swift
//  Firebase-Demo(All-in-one)
//
//  Created by Vasu Chovatiya on 02/06/2024.
//

import Foundation
import UIKit
import Toast


extension UIView {
    public func showToastAtBottom(message: String, duration: TimeInterval = 3.0) {
        var style = ToastStyle()
        style.messageColor = .white
        style.backgroundColor = .black
        self.makeToast(message, duration: duration, position: .bottom, style: style)
    }

    public func showToastAtTop(message: String) {
        var style = ToastStyle()
        style.messageColor = .white
        style.backgroundColor = .black
        self.makeToast(message, duration: 3.0, position: .top, style: style)
    }

    public func showToastAtCenter(message: String) {
        var style = ToastStyle()
        style.messageColor = .white
        style.backgroundColor = .black
        self.makeToast(message, duration: 3.0, position: .center, style: style)
    }
}

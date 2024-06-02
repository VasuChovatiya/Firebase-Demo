//
//  String+Extension.swift
//  Firebase-Demo(All-in-one)
//
//  Created by Vasu Chovatiya on 02/06/2024.
//

import Foundation

extension String {
    
    func trimed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

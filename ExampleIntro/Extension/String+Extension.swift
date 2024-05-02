//
//  String+Extension.swift
//  ExampleIntro
//
//  Created by Diego on 10/12/23.
//

import Foundation
extension String {
    
    public func toDate(format: String = "dd-MM-yyyy") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
}

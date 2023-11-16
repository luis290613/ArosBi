//
//  UITextField+Extension.swift
//  ExampleIntro
//
//  Created by Diego on 14/11/23.
//

import UIKit

extension UITextField {
    func setLeftPadding(_ points: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: points, height: frame.size.height))
        leftView = paddingView
        leftViewMode = .always
    }
    
    func setRightPadding(_ points: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: points, height: frame.size.height))
        rightView = paddingView
        rightViewMode = .always
    }
    
    func setPadding(_ points: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: points, height: frame.size.height))
        leftView = paddingView
        leftViewMode = .always
        
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: points, height: frame.size.height))
        rightView = rightPaddingView
        rightViewMode = .always
    }
    
}

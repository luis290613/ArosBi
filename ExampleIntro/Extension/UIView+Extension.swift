//
//  UIView+Extension.swift
//  ExampleIntro
//
//  Created by Diego on 10/12/23.
//

import Foundation
import UIKit

extension UIView {
    
    public enum RoundedCorners {
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
        case all
    }
    
    public func roundCorners(corner: CGFloat, maskedCorners: [RoundedCorners] = [.topLeft, .bottomRight]) {
        var cornerMask: CACornerMask = []
        
        for corner in maskedCorners {
            switch corner {
            case .topLeft:
                cornerMask.insert(.layerMinXMinYCorner)
            case .topRight:
                cornerMask.insert(.layerMaxXMinYCorner)
            case .bottomLeft:
                cornerMask.insert(.layerMinXMaxYCorner)
            case .bottomRight:
                cornerMask.insert(.layerMaxXMaxYCorner)
            case .all:
                cornerMask.insert([.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner])
            }
        }
        
        self.layer.cornerRadius = corner
        self.layer.maskedCorners = cornerMask
        self.layer.masksToBounds = true
    }
}

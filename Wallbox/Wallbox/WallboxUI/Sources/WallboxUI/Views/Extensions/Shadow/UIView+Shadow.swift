//
//  File.swift
//  
//
//  Created by Manuel Martinez Gomez on 20/9/22.
//
import UIKit

extension UIView {
  public func applyBorderAndShadow(cornerRadius: CGFloat = 10,
                            borderWidth: CGFloat = 0.5,
                            borderColor: CGColor = UIColor.lightGray.cgColor,
                            shadowColor: CGColor = UIColor.black.cgColor,
                            shadowOffset: CGSize = .init(width: 3, height: 3),
                            shadowOpacity: Float = 0.4,
                            shadowRadius: CGFloat = 2.0) {
    layer.cornerRadius = cornerRadius
    
    // border
    layer.borderWidth = borderWidth
    layer.borderColor = borderColor
    
    // shadow
    layer.shadowColor = shadowColor
    layer.shadowOffset = shadowOffset
    layer.shadowOpacity = shadowOpacity
    layer.shadowRadius = shadowRadius
  }
}

//
//  UICollectionView+Identifiable.swift
//  
//
//  Created by Manuel Martinez Gomez on 17/9/22.
//

import UIKit

public protocol Identifiable: AnyObject {
  static var cellIdentifier: String { get }
}

public extension Identifiable {
  public static var cellIdentifier: String {
    return String(describing: Self.self)
  }
}

extension UICollectionViewCell: Identifiable {}

extension UICollectionView {
  public func register<T: UICollectionViewCell>(_ cell: T.Type) {
    self.register(T.self, forCellWithReuseIdentifier: T.cellIdentifier)
  }
}

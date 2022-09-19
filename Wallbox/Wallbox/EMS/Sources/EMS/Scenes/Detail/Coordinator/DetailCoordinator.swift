//
//  DetailCoordinator.swift
//  
//
//  Created by Manuel Martinez Gomez on 19/9/22.
//

import WallboxCommon
import UIKit
import SwiftUI

public final class DetailCoordinator: Coordinator {
  private let navigationController: UINavigationController
  
  public init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  public func start() {
    let swiftUIController = UIHostingController(rootView: DetailView())
    navigationController.show(swiftUIController, sender: nil)
  }
}


//
//  DashboardCoordinator.swift
//  
//
//  Created by Manuel Martinez Gomez on 16/9/22.
//

import WallboxCommon
import UIKit

public final class DashboardCoordinator: Coordinator {
  private let navigationController: UINavigationController
  
  public init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  public func start() {
    let controller = DashboardViewcontroller()
    navigationController.show(controller, sender: nil)
  }
}

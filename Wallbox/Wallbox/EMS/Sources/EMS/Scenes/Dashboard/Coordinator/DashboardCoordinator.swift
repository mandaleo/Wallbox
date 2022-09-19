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
    let presenter = DashboardPresenter()
    presenter.delegate = self
    let dashboardView = DashboardView()
    let controller = DashboardViewController(presenter: presenter,
                                             dashboardView: dashboardView)
    navigationController.show(controller, sender: nil)
  }
}

// MARK: - DashboardSceneDelegate
extension DashboardCoordinator: DashboardSceneDelegate {
  func show(historicalData: [HistoricalData]) {
    let detailCoordinator = DetailCoordinator(navigationController: navigationController,
                                              historicalData: historicalData)
    detailCoordinator.start()
  }
}

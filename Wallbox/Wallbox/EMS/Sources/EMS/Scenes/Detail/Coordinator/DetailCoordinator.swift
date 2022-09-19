//
//  DetailCoordinator.swift
//  
//
//  Created by Manuel Martinez Gomez on 19/9/22.
//

import WallboxCommon
import UIKit
import SwiftUI

final class DetailCoordinator: Coordinator {
  private let navigationController: UINavigationController
  private let historicalData: [HistoricalData]
  
  init(navigationController: UINavigationController,
              historicalData: [HistoricalData]) {
    self.navigationController = navigationController
    self.historicalData = historicalData
  }
  
  func start() {
    let viewModel: DetailViewModel = .init(historicalData: historicalData)
    let detailView: DetailView = .init(viewModel: viewModel)
    let swiftUIController = UIHostingController(rootView: detailView)
    navigationController.show(swiftUIController, sender: nil)
  }
}


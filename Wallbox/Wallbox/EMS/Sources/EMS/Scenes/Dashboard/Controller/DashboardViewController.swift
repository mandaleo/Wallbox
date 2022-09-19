//
//  DashboardViewcontroller.swift
//  
//
//  Created by Manuel Martinez Gomez on 16/9/22.
//

import UIKit

final class DashboardViewController: UIViewController {
  private let presenter: DashboardPresenting
  private let dashboardView: DashboardView
  
  init(presenter: DashboardPresenting,
       dashboardView: DashboardView) {
    self.presenter = presenter
    self.dashboardView = dashboardView
    super.init(nibName: nil, bundle: nil)
    presenter.ui = self
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    super.loadView()
    view = dashboardView
    dashboardView.delegate = self
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    Task {
      await presenter.onViewDidLoad()
    }
  }
}

// MARK: - DasboardUI
extension DashboardViewController: DashboardUI {
  func display(_ viewModel: DashboardViewModel) {
    dashboardView.apply(state: viewModel)
  }
}

// MARK: - DashboardViewDelegate
extension DashboardViewController: DashboardViewDelegate {
  func didSelect(widget: DashboardWidgetViewModel.WidgetType) {
    presenter.didSelect(widget: widget)
  }
}


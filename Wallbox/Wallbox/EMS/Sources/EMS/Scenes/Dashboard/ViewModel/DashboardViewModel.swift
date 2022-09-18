//
//  DashboardViewModel.swift
//  
//
//  Created by Manuel Martinez Gomez on 17/9/22.
//

struct DashboardViewModel {
  enum Status {
    case loading
    case loaded(widgets: [DashboardWidgetViewModel])
    case empty(viewModel: String)
    case error(viewModel: String)
  }
  
  let status: Status
  let collectionViewIsHidden: Bool
  let loaderViewIsHidden: Bool
  let stateViewIsHidden: Bool
}

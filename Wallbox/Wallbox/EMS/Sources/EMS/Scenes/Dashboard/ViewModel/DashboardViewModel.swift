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
  
  init(state: DashboardPresenter.State) {
    self = Self.map(state)
  }
  
  init(status: Status,
       collectionViewIsHidden: Bool = true,
       loaderViewIsHidden: Bool = true,
       stateViewIsHidden: Bool = true) {
    self.status = status
    self.collectionViewIsHidden = collectionViewIsHidden
    self.loaderViewIsHidden = loaderViewIsHidden
    self.stateViewIsHidden = stateViewIsHidden
  }
}

extension DashboardViewModel {
  private static func map(_ state: DashboardPresenter.State) -> DashboardViewModel {
    switch state.status {
      case .loading:
        return .init(status: .loading,
                     loaderViewIsHidden: false)
      case .empty:
        let viewModel = "Data not found"
        return .init(status: .empty(viewModel: viewModel),
                     stateViewIsHidden: false)
      case .loaded:
        let viewModel = state.widgets

        return .init(status: .loaded(widgets: viewModel),
                     collectionViewIsHidden: false)
      case .error(error: let error):
        let viewModel = error.localizedDescription
        return .init(status: .error(viewModel: viewModel),
                     stateViewIsHidden: false)
    }
  }
}

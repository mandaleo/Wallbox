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
        let viewModel = widgets(from: state.historicalData,
                                and: state.liveData)

        return .init(status: .loaded(widgets: viewModel),
                     collectionViewIsHidden: false)
      case .error(error: let error):
        let viewModel = error.localizedDescription
        return .init(status: .error(viewModel: viewModel),
                     stateViewIsHidden: false)
    }
  }
  
  private static func widgets(from historicalData: [HistoricalData],
                              and liveData: LiveData?) -> [DashboardWidgetViewModel] {
    var widgets: [DashboardWidgetViewModel] = []
    
    let chargedWidget = chargedEnergyWidget(from: historicalData)
    widgets.append(chargedWidget)
    
    let dischargedWidget = disChargedEnergyWidget(from: historicalData)
    widgets.append(dischargedWidget)
    
    return widgets
  }
  
  private static func chargedEnergyWidget(from historicalData: [HistoricalData]) -> DashboardWidgetViewModel {
    let chargedEnergy = historicalData
      .map { $0.quasarsPower }
      .filter { $0 > 0 }
      .reduce(0, +)
    let viewModel: AmountEnergyWidgetViewModel = .init(amount: chargedEnergy)
    return .init(type: .chargedEnery(viewModel))
  }
  
  private static func disChargedEnergyWidget(from historicalData: [HistoricalData]) -> DashboardWidgetViewModel {
    let disChargedEnergy = historicalData
      .map { $0.quasarsPower }
      .filter { $0 < 0 }
      .reduce(0, +)
    let viewModel: AmountEnergyWidgetViewModel = .init(amount: disChargedEnergy)
    return .init(type: .disChargedEnery(viewModel))
  }

}

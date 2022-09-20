//
//  DashboardPresenter.swift
//  
//
//  Created by Manuel Martinez Gomez on 17/9/22.
//

protocol DashboardSceneDelegate: AnyObject {
  func show(historicalData: [HistoricalData])
}

protocol DashboardUI: AnyObject {
  func display(_ viewModel: DashboardViewModel)
}

protocol DashboardPresenting: AnyObject {
  var ui: DashboardUI? { get set }
  func onViewDidLoad() async
  func didSelect(widget: DashboardWidgetViewModel.WidgetType)
}

final class DashboardPresenter: DashboardPresenting {
  struct State {
    enum Status {
      case loading
      case empty
      case loaded
      case error(error: Error)
    }
    
    var status: Status
    var historicalData: [HistoricalData] = []
    var liveData: LiveData?
    var widgets: [DashboardWidgetViewModel] = []
  }
  
  weak var ui: DashboardUI?
  weak var delegate: DashboardSceneDelegate?
  private var state = State(status: .loading)
  private let fetchLiveDataUseCase: FetchLiveDataUseCasing
  private let fetchHistoricalDataUseCase: FetchHistoricalDataUseCasing
  private let mapper: DashboardMapper
  
  init(fetchLiveDataUseCase: FetchLiveDataUseCasing = FetchLiveDataUseCase(),
       fetchHistoricalDataUseCase: FetchHistoricalDataUseCasing = FetchHistoricalDataUseCase(),
       mapper: DashboardMapper = DashboardMapper()) {
    self.fetchLiveDataUseCase = fetchLiveDataUseCase
    self.fetchHistoricalDataUseCase = fetchHistoricalDataUseCase
    self.mapper = mapper
  }
  
  func onViewDidLoad() async {
    await mutateState(with: .init(status: .loading))
    await fetchData()
  }
  
  func didSelect(widget: DashboardWidgetViewModel.WidgetType) {
    switch widget {
      case .chargedEnery, .disChargedEnery, .liveData:
        break
      case .statistic:
        delegate?.show(historicalData: state.historicalData)
    }
  }
}

extension DashboardPresenter {
  private func fetchData() async {
    do {
      let (liveData, historicalData) = try await (fetchLiveDataUseCase.execute(),
                                                  fetchHistoricalDataUseCase.execute())
      let newState: State = historicalData.isEmpty ? .init(status: .empty) : .init(status: .loaded,
                                                                                   historicalData: historicalData,
                                                                                   liveData: liveData)
      await mutateState(with: newState)
    } catch  {
      await mutateState(with: .init(status: .error(error: error)))
    }
  }
  
  @MainActor
  private func mutateState(with newState: State) {
    state.status = newState.status
    switch state.status {
      case .loaded:
        state.liveData = newState.liveData
        state.historicalData = newState.historicalData
        state.widgets = mapper.widgets(from: state.historicalData,
                                       and: state.liveData)
      case .empty, .loading:
        state.liveData = nil
        state.historicalData.removeAll()
      case .error:
        break
    }
    displayState()
  }
  
  @MainActor
  private func displayState() {
    let viewModel = DashboardViewModel(state: state)
    ui?.display(viewModel)
  }
}

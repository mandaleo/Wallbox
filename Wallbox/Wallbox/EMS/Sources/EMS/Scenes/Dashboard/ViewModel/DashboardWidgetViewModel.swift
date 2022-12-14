//
//  DashboardWidgetViewModel.swift
//  
//
//  Created by Manuel Martinez Gomez on 17/9/22.
//

struct DashboardWidgetViewModel {
  enum WidgetType {
    case chargedEnery(_ viewModel: AmountEnergyWidgetViewModel)
    case disChargedEnery(_ viewModel: AmountEnergyWidgetViewModel)
    case liveData(_ viewModel: LiveDataWidgetViewModel)
    case statistic(_ viewModel: StatisicsWidgetViewModel)
    
    var uniqueId: String {
      switch self {
        case .chargedEnery: return "chargedEneryWidget"
        case .disChargedEnery: return "disChargedEneryWidget"
        case .liveData: return "liveDataWidget"
        case .statistic: return "statisticWidget"
      }
    }
  }
  
  let type: WidgetType
  let id: String
  
  init(type: WidgetType) {
    self.type = type
    self.id = type.uniqueId
  }
}

// MARK: - Equatable, Hashable
extension DashboardWidgetViewModel: Equatable, Hashable {
  static func == (lhs: DashboardWidgetViewModel,
                  rhs: DashboardWidgetViewModel) -> Bool {
    lhs.hashValue == rhs.hashValue
  }
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}

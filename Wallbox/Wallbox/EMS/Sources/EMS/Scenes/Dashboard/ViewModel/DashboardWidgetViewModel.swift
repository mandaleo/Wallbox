//
//  DashboardWidgetViewModel.swift
//  
//
//  Created by Manuel Martinez Gomez on 17/9/22.
//

struct DashboardWidgetViewModel {
  enum WidgetType {
    case amount(_ viewModel: AmountEnergyWidgetViewModel)
  }
  
  let type: WidgetType
  let id: String
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

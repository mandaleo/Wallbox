//
//  DashboardMapper.swift
//  
//
//  Created by Manuel Martinez Gomez on 20/9/22.
//

final class DashboardMapper {
  func widgets(from historicalData: [HistoricalData],
               and liveData: LiveData?) -> [DashboardWidgetViewModel] {
    var widgets: [DashboardWidgetViewModel] = []
    
    let chargedWidget = chargedEnergyWidget(from: historicalData)
    widgets.append(chargedWidget)
    
    let dischargedWidget = disChargedEnergyWidget(from: historicalData)
    widgets.append(dischargedWidget)
    
    if let liveData = liveData {
      let liveDataWidget = liveDataWidget(from: liveData)
      widgets.append(liveDataWidget)
    }
    
    let statisticsWidget = statisticsWidget(from: historicalData)
    widgets.append(statisticsWidget)
    
    return widgets
  }
  
  private func chargedEnergyWidget(from historicalData: [HistoricalData]) -> DashboardWidgetViewModel {
    let chargedEnergy = historicalData
      .map { $0.quasarsPower }
      .filter { $0 > 0 }
      .reduce(0, +)
    let viewModel: AmountEnergyWidgetViewModel = .init(amount: chargedEnergy)
    return .init(type: .chargedEnery(viewModel))
  }
  
  private func disChargedEnergyWidget(from historicalData: [HistoricalData]) -> DashboardWidgetViewModel {
    let disChargedEnergy = historicalData
      .map { $0.quasarsPower }
      .filter { $0 < 0 }
      .reduce(0, +)
    let viewModel: AmountEnergyWidgetViewModel = .init(amount: disChargedEnergy)
    return .init(type: .disChargedEnery(viewModel))
  }
  
  private func liveDataWidget(from liveData: LiveData) -> DashboardWidgetViewModel {
    let viewModel: LiveDataWidgetViewModel = .init(solarPower: liveData.solarPower,
                                                   quasarsPower: liveData.quasarsPower,
                                                   gridPower: liveData.gridPower,
                                                   buildingDemand: liveData.buildingDemand,
                                                   systemStateOfCharge: liveData.systemStateOfCharge,
                                                   totalEnergy: liveData.totalEnergy,
                                                   currentEnergy: liveData.currentEnergy)
    return .init(type: .liveData(viewModel))
  }
  
  private func statisticsWidget(from historicalData: [HistoricalData]) -> DashboardWidgetViewModel {
    let buildingConsumption = historicalData.map { $0.buildingDemand }.reduce(0, +)
    let grid = historicalData.map { $0.gridPower }.reduce(0, +) / buildingConsumption * 100
    let solar = historicalData.map { $0.solarPower }.reduce(0, +) / buildingConsumption * 100
    let quasar = historicalData.map { $0.quasarsPower }.reduce(0, +) / buildingConsumption * 100
    
    return .init(type: .statistic(.init(buildingDemand: buildingConsumption,
                                        gridPower: grid,
                                        solarPower: solar,
                                        quasarsPower: quasar)))
  }
}

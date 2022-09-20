//
//  DashboardWidgetViewModelMock.swift
//  
//
//  Created by Manuel Martinez Gomez on 20/9/22.
//

@testable import EMS

extension DashboardWidgetViewModel {
  static var mocks: [DashboardWidgetViewModel] {
    [chargedMock, disChargedMock, liveDataMock, statisticsMock]
  }
  
  static var chargedMock: DashboardWidgetViewModel {
    .init(type: .chargedEnery(.init(amount: 8765)))
  }
  
  static var disChargedMock: DashboardWidgetViewModel {
    .init(type: .disChargedEnery(.init(amount: -7552)))
  }
  
  static var liveDataMock: DashboardWidgetViewModel {
    .init(type: .liveData(.init(solarPower: 1234,
                                quasarsPower: -454,
                                gridPower: 124,
                                buildingDemand: 5245,
                                systemStateOfCharge: 75.98,
                                totalEnergy: 134566,
                                currentEnergy: 1356)))
  }
  
  static var statisticsMock: DashboardWidgetViewModel {
    .init(type: .statistic(.init(buildingDemand: 12345,
                                 gridPower: 52,
                                 solarPower: 38,
                                 quasarsPower: 10)))
  }
}

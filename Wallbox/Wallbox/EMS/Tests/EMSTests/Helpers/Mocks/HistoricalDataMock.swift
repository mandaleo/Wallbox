//
//  HistoricalDataMock.swift
//  
//
//  Created by Manuel Martinez Gomez on 20/9/22.
//

@testable import EMS
import WallboxCommon

extension HistoricalData {
  static var mocks: [HistoricalData] {
    [mock1, mock2, mock3, mock4, mock5]
  }
  
  static var mock1: HistoricalData {
    let timeStamp = "2021-09-25T11:01:00+00:00"
    let date = WallboxDateFormatter().date(from: timeStamp)!
                                           
    return .init(buildingDemand: 12345,
          gridPower: 134,
          solarPower: 13,
          quasarsPower: 67,
          date: date)
  }
  
  static var mock2: HistoricalData {
    let timeStamp = "2021-09-22T20:01:00+00:00"
    let date = WallboxDateFormatter().date(from: timeStamp)!
    
    return .init(buildingDemand: 785,
                 gridPower: 54,
                 solarPower: 0,
                 quasarsPower: -65,
                 date: date)
  }
  
  static var mock3: HistoricalData {
    let timeStamp = "2021-09-21T21:01:00+00:00"
    let date = WallboxDateFormatter().date(from: timeStamp)!
    
    return .init(buildingDemand: 896,
                 gridPower: 424,
                 solarPower: 244,
                 quasarsPower: 167,
                 date: date)
  }
  
  static var mock4: HistoricalData {
    let timeStamp = "2021-09-26T22:01:00+00:00"
    let date = WallboxDateFormatter().date(from: timeStamp)!
    
    return .init(buildingDemand: 987785,
                 gridPower: 54353,
                 solarPower: 453,
                 quasarsPower: 314,
                 date: date)
  }
  
  static var mock5: HistoricalData {
    let timeStamp = "2021-09-26T22:10:00+00:00"
    let date = WallboxDateFormatter().date(from: timeStamp)!
    
    return .init(buildingDemand: 357896,
                 gridPower: 24234,
                 solarPower: 0,
                 quasarsPower: -543545,
                 date: date)
  }
}

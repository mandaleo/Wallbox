//
//  LiveDataMock.swift
//  
//
//  Created by Manuel Martinez Gomez on 20/9/22.
//

@testable import EMS
import WallboxCommon

extension LiveData {
  static var mock: LiveData {
    .init(solarPower: 7.827,
          quasarsPower: -38.732,
          gridPower: 80.475,
          buildingDemand: 127.03399999999999,
          systemStateOfCharge: 48.333333333333336,
          totalEnergy: 960,
          currentEnergy: 464.0)
  }
}

//
//  HistoricalDataDataModel.swift
//  
//
//  Created by Manuel Martinez Gomez on 16/9/22.
//

struct HistoricalDataDataModel: Codable {
  let buildingDemand: Double
  let gridPower: Double
  let solarPower: Double
  let quasarsPower: Double
  let timeStamp: String
  
  enum CodingKeys: String, CodingKey {
    case buildingDemand = "building_active_power"
    case gridPower = "grid_active_power"
    case solarPower = "pv_active_power"
    case quasarsPower = "quasars_active_power"
    case timeStamp = "timestamp"
  }
  
  init(buildingDemand: Double,
       gridPower: Double,
       solarPower: Double,
       quasarsPower: Double,
       timeStamp: String) {
    self.buildingDemand = buildingDemand
    self.gridPower = gridPower
    self.solarPower = solarPower
    self.quasarsPower = quasarsPower
    self.timeStamp = timeStamp
  }
}

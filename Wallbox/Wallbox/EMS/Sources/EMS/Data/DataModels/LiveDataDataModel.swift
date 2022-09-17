//
//  LiveDataDataModel.swift
//  
//
//  Created by Manuel Martinez Gomez on 16/9/22.
//

struct LiveDataDataModel: Codable {
  let solarPower: Double
  let quasarsPower: Double
  let gridPower: Double
  let buildingDemand: Double
  let systemStateOfCharge: Double
  let totalEnergy: Double
  let currentEnergy: Double
  
  enum CodingKeys: String, CodingKey {
    case solarPower = "solar_power"
    case quasarsPower = "quasars_power"
    case gridPower = "grid_power"
    case buildingDemand = "building_demand"
    case systemStateOfCharge = "system_soc"
    case totalEnergy = "total_energy"
    case currentEnergy = "current_energy"
  }
  
  init(solarPower: Double,
       quasarsPower: Double,
       gridPower: Double,
       buildingDemand: Double,
       systemStateOfCharge: Double,
       totalEnergy: Double,
       currentEnergy: Double) {
    self.solarPower = solarPower
    self.quasarsPower = quasarsPower
    self.gridPower = gridPower
    self.buildingDemand = buildingDemand
    self.systemStateOfCharge = systemStateOfCharge
    self.totalEnergy = totalEnergy
    self.currentEnergy = currentEnergy
  }
}


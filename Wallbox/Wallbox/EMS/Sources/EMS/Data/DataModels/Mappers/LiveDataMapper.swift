//
//  LiveDataMapper.swift
//  
//
//  Created by Manuel Martinez Gomez on 16/9/22.
//

final class LiveDataMapper {
  
  func map(_  dataModel: LiveDataDataModel) -> LiveData {
    .init(solarPower: dataModel.solarPower,
          quasarsPower: dataModel.quasarsPower,
          gridPower: dataModel.gridPower,
          buildingDemand: dataModel.buildingDemand,
          systemStateOfCharge: dataModel.systemStateOfCharge,
          totalEnergy: dataModel.totalEnergy,
          currentEnergy: dataModel.currentEnergy)
  }
}

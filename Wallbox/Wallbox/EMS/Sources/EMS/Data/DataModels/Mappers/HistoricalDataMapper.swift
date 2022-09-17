//
//  HistoricalDataMapper.swift
//  
//
//  Created by Manuel Martinez Gomez on 16/9/22.
//

import Foundation
import WallboxCommon

final class HistoricalDataMapper {
  private let dateFormatter: WallboxDateFormatter
  
  init(dateFormatter: WallboxDateFormatter = WallboxDateFormatter()) {
    self.dateFormatter = dateFormatter
  }
  
  func map(_ dataModel: HistoricalDataDataModel) -> HistoricalData {
    .init(buildingDemand: dataModel.buildingDemand,
          gridPower: dataModel.gridPower,
          solarPower: dataModel.solarPower,
          quasarsPower: dataModel.quasarsPower,
          date: dateFormatter.date(from: dataModel.timeStamp) ?? Date())
  }
}

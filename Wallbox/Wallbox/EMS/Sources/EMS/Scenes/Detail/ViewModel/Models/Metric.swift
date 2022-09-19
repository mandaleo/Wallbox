//
//  Metric.swift
//  
//
//  Created by Manuel Martinez Gomez on 19/9/22.
//

import Foundation

struct Metric: Identifiable {
  enum Source: String {
    case gridPower = "Grid"
    case solarPower = "Solar"
    case quasarsPower = "Quasar"
  }
  
  let id: String = UUID().uuidString
  var source: Source
  var data: [Info]
}

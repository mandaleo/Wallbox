//
//  DetailViewModel.swift
//  
//
//  Created by Manuel Martinez Gomez on 19/9/22.
//

import Foundation

final class DetailViewModel: ObservableObject {
  private let historicalData: [HistoricalData]
  
  @Published var metrics: [Metric] = []
  
  init(historicalData: [HistoricalData]) {
    self.historicalData = historicalData
  }
  
  func loadData() {
    let gridInfo: [Info] = historicalData.map { .init(date: $0.date,
                                                      amount: $0.gridPower)}
    let gridMetric: Metric = .init(source: .gridPower,
                               data: gridInfo)
    
    let solarInfo: [Info] = historicalData.map { .init(date: $0.date,
                                                       amount: $0.solarPower)}
    let solarMetric: Metric = .init(source: .solarPower,
                                   data: solarInfo)
    
    let quasarInfo: [Info] = historicalData.map { .init(date: $0.date,
                                                        amount: $0.quasarsPower)}
    let quasarMetric: Metric = .init(source: .quasarsPower,
                                   data: quasarInfo)
    
    metrics.append(contentsOf: [gridMetric, solarMetric, quasarMetric])
  }
}

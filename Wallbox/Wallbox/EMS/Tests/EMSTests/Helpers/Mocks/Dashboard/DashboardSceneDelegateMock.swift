//
//  DashboardSceneDelegateMock.swift
//  
//
//  Created by Manuel Martinez Gomez on 20/9/22.
//

@testable import EMS

final class DashboardSceneDelegateMock: DashboardSceneDelegate {
  var isShowCalled = false
  
  func show(historicalData: [EMS.HistoricalData]) {
    isShowCalled = true
  }
}

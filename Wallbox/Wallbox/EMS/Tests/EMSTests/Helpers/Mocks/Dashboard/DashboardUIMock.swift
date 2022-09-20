//
//  DashboardUIMock.swift
//  
//
//  Created by Manuel Martinez Gomez on 20/9/22.
//

@testable import EMS

final class DashboardUIMock: DashboardUI {
  var isDisplayCalled = false
  var viewModel: DashboardViewModel?
  
  func display(_ viewModel: DashboardViewModel) {
    self.viewModel = viewModel
    isDisplayCalled = true
  }
}

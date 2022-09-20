//
//  FetchHistoricalDataUseCaseMock.swift
//  
//
//  Created by Manuel Martinez Gomez on 20/9/22.
//

import Foundation
@testable import EMS

final class FetchHistoricalDataUseCaseMock: FetchHistoricalDataUseCasing {
  var data: [HistoricalData] = HistoricalData.mocks
  var throwError = false
  var executeIsCalled = false
  
  func execute() async throws -> [HistoricalData] {
    executeIsCalled = true
    guard !throwError else {
      throw NSError(domain: "Historical fetch error", code: 400, userInfo: nil)
    }
    return data
  }
}

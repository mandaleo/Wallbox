//
//  FetchLiveDataUseCaseMock.swift
//  
//
//  Created by Manuel Martinez Gomez on 20/9/22.
//

import Foundation
@testable import EMS

final class FetchLiveDataUseCaseMock: FetchLiveDataUseCasing {
  var data: LiveData = .mock
  var throwError = false
  var executeIsCalled = false
  
  func execute() async throws -> LiveData {
    executeIsCalled = true
    guard !throwError else {
      throw NSError(domain: "LiveData fetch error", code: 400, userInfo: nil)
    }
    return data
  }
}

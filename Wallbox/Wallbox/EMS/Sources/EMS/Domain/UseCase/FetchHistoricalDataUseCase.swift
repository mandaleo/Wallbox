//
//  FetchHistoricalDataUseCase.swift
//  
//
//  Created by Manuel Martinez Gomez on 16/9/22.
//

protocol FetchHistoricalDataUseCasing {
  func execute() async throws -> [HistoricalData]
}

final class FetchHistoricalDataUseCase: FetchHistoricalDataUseCasing {
  private let repository: EMSRepositoring
  
  init(repository: EMSRepositoring = EMSRepository()) {
    self.repository = repository
  }
  
  func execute() async throws -> [HistoricalData] {
    try await repository.fetchHistoricalData()
  }
}

//
//  EMSRepository.swift
//  
//
//  Created by Manuel Martinez Gomez on 16/9/22.
//

protocol EMSRepositoring {
  func fetchHistoricalData() async throws -> [HistoricalData]
  func fetchLiveData() async throws -> LiveData
}

final class EMSRepository: EMSRepositoring {
  private let dataSource: EMSDataSource
  
  init(dataSource: EMSDataSource = EMSLocalDataSource()) {
    self.dataSource = dataSource
  }
  
  func fetchHistoricalData() async throws -> [HistoricalData] {
    try await dataSource.fetchHistoricalData()
  }
  
  func fetchLiveData() async throws -> LiveData {
    try await dataSource.fetchLiveData()
  }
}

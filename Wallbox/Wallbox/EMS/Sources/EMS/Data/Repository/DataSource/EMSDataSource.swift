//
//  EMSDataSource.swift
//  
//
//  Created by Manuel Martinez Gomez on 16/9/22.
//

protocol EMSDataSource {
  func fetchHistoricalData() async throws -> [HistoricalData]
  func fetchLiveData() async throws -> LiveData
}

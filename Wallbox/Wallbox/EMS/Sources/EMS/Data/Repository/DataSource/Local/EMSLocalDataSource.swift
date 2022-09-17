//
//  EMSLocalDataSource.swift
//  
//
//  Created by Manuel Martinez Gomez on 16/9/22.
//

import Foundation
import WallboxCommon

final class EMSLocalDataSource: EMSDataSource {
  private enum FileName {
    static let historical = "historic_data"
    static let live = "live_data"
  }
  
  private let jsonLoader: JSONLoading
  private let historicalMapper: HistoricalDataMapper
  private let liveDataMapper: LiveDataMapper
  
  init(jsonLoader: JSONLoading = JSONLoader(),
       historicalMapper: HistoricalDataMapper = HistoricalDataMapper(),
       liveDataMapper: LiveDataMapper = LiveDataMapper()) {
    self.jsonLoader = jsonLoader
    self.historicalMapper = historicalMapper
    self.liveDataMapper = liveDataMapper
  }
  
  func fetchHistoricalData() async throws -> [HistoricalData] {
    let dataModel: [HistoricalDataDataModel] = try await jsonLoader.data(from: FileName.historical,
                                                                         in: Bundle.module)
    return dataModel.map { historicalMapper.map($0) }
  }
  
  func fetchLiveData() async throws -> LiveData {
    let dataModel: LiveDataDataModel = try await jsonLoader.data(from: FileName.live,
                                                                 in: Bundle.module)
    return liveDataMapper.map(dataModel)
  }
}

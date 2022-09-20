//
//  File.swift
//  
//
//  Created by Manuel Martinez Gomez on 16/9/22.
//

import XCTest
@testable import EMS
import WallboxCommon

final class EnergySystemRepositorySpec: XCTestCase {
  private enum TestDouble {
    enum Historical {
      static let buildingDemand = 40.47342857142857
      static let gridPower = 44.234380952380945
      static let solarPower = 0.0
      static let quasarsPower = 3.7609523809523817
      static let timeStamp = "2021-09-26T22:01:00+00:00"
    }
    enum Live {
      static let solarPower = 7.827
      static let quasarsPower = -38.732
      static let gridPower = 80.475
      static let buildingDemand = 127.03399999999999
      static let systemStateOfCharge = 48.333333333333336
      static let totalEnergy: Double = 960
      static let currentEnergy =  464.0
    }
  }
  
  func test_fetch_history_data() async throws {
    let historicalDataUseCase = FetchHistoricalDataUseCase()
    let dataModel = try await historicalDataUseCase.execute()
    XCTAssertEqual(dataModel.count, 1125)
    let item = try XCTUnwrap(dataModel.first)
    XCTAssertEqual(item.buildingDemand, TestDouble.Historical.buildingDemand)
    XCTAssertEqual(item.gridPower, TestDouble.Historical.gridPower)
    XCTAssertEqual(item.solarPower, TestDouble.Historical.solarPower)
    XCTAssertEqual(item.quasarsPower, TestDouble.Historical.quasarsPower)
    let date = WallboxDateFormatter().date(from: TestDouble.Historical.timeStamp)
    XCTAssertEqual(item.date, date)
  }
  
  func test_fetch_live_data() async throws {
    let liveDataUseCase = FetchLiveDataUseCase()
    let dataModel = try await liveDataUseCase.execute()
    XCTAssertEqual(dataModel.solarPower, TestDouble.Live.solarPower)
    XCTAssertEqual(dataModel.quasarsPower, TestDouble.Live.quasarsPower)
    XCTAssertEqual(dataModel.gridPower, TestDouble.Live.gridPower)
    XCTAssertEqual(dataModel.buildingDemand, TestDouble.Live.buildingDemand)
    XCTAssertEqual(dataModel.systemStateOfCharge, TestDouble.Live.systemStateOfCharge)
    XCTAssertEqual(dataModel.totalEnergy, TestDouble.Live.totalEnergy)
    XCTAssertEqual(dataModel.currentEnergy, TestDouble.Live.currentEnergy)
  }
}

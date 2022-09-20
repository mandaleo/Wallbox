//
//  DashboardViewSpec.swift
//  
//
//  Created by Manuel Martinez Gomez on 20/9/22.
//

import XCTest
import SnapshotTesting
@testable import EMS

final class DashboardViewSpec: XCTestCase {
  private enum TestDouble {
    static let loadingState: DashboardViewModel = .init(state: .init(status: .loading))
    static let emptyState: DashboardViewModel = .init(state: .init(status: .empty))
    static let errorState: DashboardViewModel = .init(state: .init(status: .error(error: NSError(domain: "Jobs not found",
                                                                                                 code: 400,
                                                                                                 userInfo: nil))))
    static let loadedState: DashboardViewModel = .init(state: .init(status: .loaded,
                                                                    widgets: DashboardWidgetViewModel.mocks))
  }
  
  private var sut: DashboardView!
  
  override func setUp() {
    sut = .init()
    setupFrame()
  }
  
  override func tearDown() {
    sut = nil
  }
  
  func test_loading_view() {
    givenLoadingState()
    assertSnapshot(matching: sut, as: .image)
  }
  
  func test_empty_view() {
    givenEmptyState()
    assertSnapshot(matching: sut, as: .image)
  }
  
  func test_error_view() {
    givenErrorState()
    assertSnapshot(matching: sut, as: .image)
  }
  
  func test_loaded_view() {
    givenLoadedState()
    assertSnapshot(matching: sut, as: .image)
  }
}

extension DashboardViewSpec {
  private func setupFrame() {
    sut.frame = CGRect(origin: .zero, size: .init(width: 375,
                                                  height: 875))
  }
  
  private func givenLoadingState() {
    sut.apply(state: TestDouble.loadingState)
  }
  
  private func givenEmptyState() {
    sut.apply(state: TestDouble.emptyState)
  }
  
  private func givenErrorState() {
    sut.apply(state: TestDouble.errorState)
  }
  
  private func givenLoadedState() {
    sut.apply(state: TestDouble.loadedState)
  }
}

//
//  File.swift
//  
//
//  Created by Manuel Martinez Gomez on 20/9/22.
//

import XCTest
@testable import EMS

final class DashboardPresenterSpec: XCTestCase{
  private enum TestDouble {
    static let statisicsWidgetViewModel: StatisicsWidgetViewModel = .init(buildingDemand: 123,
                                                                          gridPower: 13,
                                                                          solarPower: 21,
                                                                          quasarsPower: 3)
  }
  
  private var sut: DashboardPresenter!
  private var uiMock: DashboardUIMock!
  private var delegateMock: DashboardSceneDelegateMock!
  private var fetchLiveDataUseCase: FetchLiveDataUseCaseMock!
  private var fetchHistoricalDataUseCase: FetchHistoricalDataUseCaseMock!
  
  override func setUp()  {
    super.setUp()
    uiMock = DashboardUIMock()
    delegateMock = DashboardSceneDelegateMock()
    fetchLiveDataUseCase = FetchLiveDataUseCaseMock()
    fetchHistoricalDataUseCase = FetchHistoricalDataUseCaseMock()
    sut = .init(fetchLiveDataUseCase: fetchLiveDataUseCase,
                fetchHistoricalDataUseCase: fetchHistoricalDataUseCase)
    sut.ui = uiMock
    sut.delegate = delegateMock
  }
  
  override func tearDown() {
    super.tearDown()
    uiMock = nil
    delegateMock = nil
    fetchLiveDataUseCase = nil
    fetchHistoricalDataUseCase = nil
    sut = nil
  }
  
  func test_load_success() async throws {
    await whenViewDidLoad()
    try thenLoadData()
  }
  
  func test_load_empty() async throws {
    await whenViewDidLoadEmptyResults()
    try thenLoadEmptyData()
  }
  
  func test_load_throw_error() async throws {
    await whenViewDidLoadThrowError()
    try thenLoadErrorData()
  }
  
  func test_show_detail() async {
    await whenViewDidLoad()
    whenSelectDetailWidget()
    thenShowDetail()
  }
}

extension DashboardPresenterSpec {
  private func whenViewDidLoad() async {
    await sut.onViewDidLoad()
  }
  
  private func whenViewDidLoadEmptyResults() async {
    fetchHistoricalDataUseCase.data = []
    await sut.onViewDidLoad()
  }
  
  private func whenViewDidLoadThrowError() async {
    fetchHistoricalDataUseCase.throwError = true
    await sut.onViewDidLoad()
  }
  
  private func whenSelectDetailWidget() {
    sut.didSelect(widget: .statistic(TestDouble.statisicsWidgetViewModel))
  }
  
  private func thenLoadData() throws {
    XCTAssertTrue(fetchLiveDataUseCase.executeIsCalled)
    XCTAssertTrue(fetchHistoricalDataUseCase.executeIsCalled)
    XCTAssertTrue(uiMock.isDisplayCalled)
    let viewModel: DashboardViewModel = try XCTUnwrap(uiMock.viewModel)
    XCTAssertFalse(viewModel.collectionViewIsHidden)
    XCTAssertTrue(viewModel.loaderViewIsHidden)
    XCTAssertTrue(viewModel.stateViewIsHidden)
    switch viewModel.status {
      case .loaded(widgets: let widgets):
        XCTAssertEqual(widgets.count, 4)
      case .loading, .empty, .error:
        break
    }
  }
  
  private func thenLoadEmptyData() throws {
    XCTAssertTrue(fetchLiveDataUseCase.executeIsCalled)
    XCTAssertTrue(fetchHistoricalDataUseCase.executeIsCalled)
    XCTAssertTrue(uiMock.isDisplayCalled)
    let viewModel: DashboardViewModel = try XCTUnwrap(uiMock.viewModel)
    XCTAssertTrue(viewModel.collectionViewIsHidden)
    XCTAssertTrue(viewModel.loaderViewIsHidden)
    XCTAssertFalse(viewModel.stateViewIsHidden)
    switch viewModel.status {
      case .empty(viewModel: let viewModel):
        XCTAssertEqual("Data not found", viewModel)
      case .loading, .loaded, .error:
        break
    }
  }
  
  private func thenLoadErrorData() throws {
    XCTAssertTrue(fetchLiveDataUseCase.executeIsCalled)
    XCTAssertTrue(fetchHistoricalDataUseCase.executeIsCalled)
    XCTAssertTrue(uiMock.isDisplayCalled)
    let viewModel: DashboardViewModel = try XCTUnwrap(uiMock.viewModel)
    XCTAssertTrue(viewModel.collectionViewIsHidden)
    XCTAssertTrue(viewModel.loaderViewIsHidden)
    XCTAssertFalse(viewModel.stateViewIsHidden)
    switch viewModel.status {
      case .error(viewModel: let viewModel):
        XCTAssertFalse(viewModel.isEmpty)
      case .loading, .loaded, .empty:
        break
    }
  }
  
  private func thenShowDetail() {
    XCTAssertTrue(delegateMock.isShowCalled)
  }
}

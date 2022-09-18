//
//  DashboardDataSource.swift
//  
//
//  Created by Manuel Martinez Gomez on 17/9/22.
//

import UIKit

protocol DashboardDataSourceDelegate: AnyObject {
  func didSelect()
}

final class DashboardDataSource: NSObject, UICollectionViewDelegate {
  typealias CollectionDataSource = UICollectionViewDiffableDataSource<Int, DashboardWidgetViewModel>
  private var diffableDataSource: UICollectionViewDiffableDataSource<Int, DashboardWidgetViewModel>?
  weak var delegate: DashboardDataSourceDelegate?
  private var widgets: [DashboardWidgetViewModel]
  private let widgetFactory: DashboardWidgetFactory
  
  init(widgets: [DashboardWidgetViewModel] = [],
       widgetFactory: DashboardWidgetFactory = .init()) {
    self.widgets = widgets
    self.widgetFactory = widgetFactory
  }
  
  func setup(collectionView: UICollectionView) {
    widgetFactory.registerCells(in: collectionView)
    diffableDataSource = CollectionDataSource(collectionView: collectionView, cellProvider: { [weak self] collectionView, indexPath, viewModel in
      self?.widgetFactory.dequeueReusableCell(for: collectionView,
                                              with: viewModel,
                                              at: indexPath)
    })
  }
  
  func set(widgets: [DashboardWidgetViewModel]) {
    guard var snapshot = diffableDataSource?.snapshot() else { return }
    snapshot.deleteAllItems()
    snapshot.appendSections([0])
    snapshot.appendItems(widgets, toSection: 0)
    diffableDataSource?.apply(snapshot, animatingDifferences: false)
    self.widgets = widgets
  }
}

//
//  DashboardDataSource.swift
//  
//
//  Created by Manuel Martinez Gomez on 17/9/22.
//

import UIKit

protocol DashboardDataSourceDelegate: AnyObject {
  func didSelect(widget: DashboardWidgetViewModel.WidgetType)
}

final class DashboardDataSource: NSObject {
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
    collectionView.delegate = self
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

// MARK: - UICollectionViewDelegate
extension DashboardDataSource: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView,
                      didSelectItemAt indexPath: IndexPath) {
    let widget = getWidget(by: indexPath)
    delegate?.didSelect(widget: widget.type)
  }
  
  private func getWidget(by indexPath: IndexPath) -> DashboardWidgetViewModel {
    return widgets[indexPath.row]
  }
}

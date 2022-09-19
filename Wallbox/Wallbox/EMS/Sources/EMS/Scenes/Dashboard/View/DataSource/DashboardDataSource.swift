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
  
  func configureLayout(collectionView: UICollectionView) {
    collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(sectionProvider: { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
      let isPhone = layoutEnvironment.traitCollection.userInterfaceIdiom == UIUserInterfaceIdiom.phone
      let size = NSCollectionLayoutSize(
        widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
        heightDimension: NSCollectionLayoutDimension.estimated(80)
      )
      let itemCount = 2
      let item = NSCollectionLayoutItem(layoutSize: size)
      let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: itemCount)
      let section = NSCollectionLayoutSection(group: group)
      section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
      section.interGroupSpacing = 10
//      // Supplementary header view setup
//      let headerFooterSize = NSCollectionLayoutSize(
//        widthDimension: .fractionalWidth(1.0),
//        heightDimension: .estimated(20)
//      )
//      let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
//        layoutSize: headerFooterSize,
//        elementKind: UICollectionView.elementKindSectionHeader,
//        alignment: .top
//      )
//      section.boundarySupplementaryItems = [sectionHeader]
      return section
    })
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

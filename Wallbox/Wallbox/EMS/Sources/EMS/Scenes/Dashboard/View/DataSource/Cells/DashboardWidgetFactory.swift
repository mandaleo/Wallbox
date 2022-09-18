//
//  DashboardWidgetFactory.swift
//  
//
//  Created by Manuel Martinez Gomez on 17/9/22.
//

import UIKit
import WallboxCommon

final class DashboardWidgetFactory {
  
  func registerCells(in colletionView: UICollectionView) {
    colletionView.register(AmountEnergyWidget.self)
  }
  
  func dequeueReusableCell(for colletionView: UICollectionView,
                           with model: DashboardWidgetViewModel,
                           at indexPath: IndexPath) -> UICollectionViewCell? {
    switch model.type {
      case .amount(let viewModel):
        return dequeAmountEnergyWidget(for: colletionView,
                                       with: viewModel,
                                       at: indexPath)
    }
  }
}

extension DashboardWidgetFactory {
  private func dequeAmountEnergyWidget(for colletionView: UICollectionView,
                                       with model: AmountEnergyWidgetViewModel,
                                       at indexPath: IndexPath) -> UICollectionViewCell? {
    let cell = colletionView.dequeueReusableCell(withReuseIdentifier: AmountEnergyWidget.cellIdentifier,
                                                 for: indexPath) as? AmountEnergyWidget
    cell?.setup(with: model)
    return cell
  }
}

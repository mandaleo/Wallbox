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
    colletionView.register(LiveDataWidget.self)
    colletionView.register(StatisticsWidget.self)
  }
  
  func dequeueReusableCell(for colletionView: UICollectionView,
                           with model: DashboardWidgetViewModel,
                           at indexPath: IndexPath) -> UICollectionViewCell? {
    switch model.type {
      case .chargedEnery(let viewModel):
        return dequeAmountEnergyWidget(for: colletionView,
                                       with: viewModel,
                                       at: indexPath)
      case .disChargedEnery(let viewModel):
        return dequeAmountEnergyWidget(for: colletionView,
                                       with: viewModel,
                                       at: indexPath)
      case .liveData(let viewModel):
        return dequeLiveDataWidget(for: colletionView,
                                   with: viewModel,
                                   at: indexPath)
      case .statistic(let viewModel):
        return dequeStatisticWidget(for: colletionView,
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
  
  private func dequeLiveDataWidget(for colletionView: UICollectionView,
                                   with model: LiveDataWidgetViewModel,
                                   at indexPath: IndexPath) -> UICollectionViewCell? {
    let cell = colletionView.dequeueReusableCell(withReuseIdentifier: LiveDataWidget.cellIdentifier,
                                                 for: indexPath) as? LiveDataWidget
    cell?.setup(with: model)
    return cell
  }
  
  private func dequeStatisticWidget(for colletionView: UICollectionView,
                                    with model: StatisicsWidgetViewModel,
                                    at indexPath: IndexPath) -> UICollectionViewCell? {
    let cell = colletionView.dequeueReusableCell(withReuseIdentifier: StatisticsWidget.cellIdentifier,
                                                 for: indexPath) as? StatisticsWidget
    cell?.setup(with: model)
    return cell
  }
}

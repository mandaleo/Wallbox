//
//  AmountEnergyWidget.swift
//  
//
//  Created by Manuel Martinez Gomez on 17/9/22.
//

import UIKit

final class AmountEnergyWidget: UICollectionViewCell {
  private lazy var cellView: AmountEnergyWidgetView = {
    let view = AmountEnergyWidgetView()
    return view
  }()
  
  init() {
    super.init(frame: .zero)
    setupView()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    contentView.addSubview(cellView)
  }
  
  private func setupConstraints() {
    let constraints = [
      cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
      cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
    ]
    
    NSLayoutConstraint.activate(constraints)
  }
  
  func setup(with model: AmountEnergyWidgetViewModel) {
    cellView.setup(with: model)
  }
}

//
//  StatisticsWidget.swift
//  
//
//  Created by Manuel Martinez Gomez on 19/9/22.
//

import UIKit

final class StatisticsWidget: UICollectionViewCell {
  private enum Constant {
    static let margin: CGFloat = 4
  }
  private lazy var cellView: StatisicsWidgetView = {
    let view = StatisicsWidgetView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .red
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
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
      cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: Constant.margin),
      cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -Constant.margin),
      cellView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: Constant.margin),
      cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -Constant.margin),
    ]
    
    NSLayoutConstraint.activate(constraints)
  }
  
  func setup(with model: StatisicsWidgetViewModel) {
    cellView.setup(with: model)
  }
}

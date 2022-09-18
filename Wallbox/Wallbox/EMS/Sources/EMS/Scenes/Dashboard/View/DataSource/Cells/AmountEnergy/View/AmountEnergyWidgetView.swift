//
//  AmountEnergyWidgetView.swift
//  
//
//  Created by Manuel Martinez Gomez on 17/9/22.
//

import UIKit

final class AmountEnergyWidgetView: UIView {
  private enum Constant {
    static let fontSize = UIFont.boldSystemFont(ofSize: 30)
    static let margin: CGFloat = 8
    static let chargedColor: UIColor = .systemGreen
    static let dischargedColor: UIColor = .systemRed
  }
  
  private lazy var amountLabel: UILabel = {
    let view = UILabel()
    view.textAlignment = .center
    view.font = Constant.fontSize
    view.numberOfLines = 0
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
    addSubview(amountLabel)
  }
  
  private func setupConstraints() {
    let constraints =  [
      amountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.margin),
      amountLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constant.margin),
      amountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constant.margin),
      amountLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constant.margin)
    ]
    
    NSLayoutConstraint.activate(constraints)
  }
  
  func setup(with model: AmountEnergyWidgetViewModel) {
    amountLabel.text = model.amountDescription
    amountLabel.textColor = model.isCharged ? Constant.chargedColor : Constant.dischargedColor
  }
}

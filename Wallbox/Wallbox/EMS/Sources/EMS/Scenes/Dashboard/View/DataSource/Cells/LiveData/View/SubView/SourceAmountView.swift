//
//  SourceAmountView.swift
//  
//
//  Created by Manuel Martinez Gomez on 19/9/22.
//

import UIKit

final class SourceAmountView: UIView {
  private enum Constant {
    static let fontSize = UIFont.boldSystemFont(ofSize: 12)
    static let horizontalMargin = CGFloat(8)
  }
  
  private lazy var sourceLabel: UILabel = {
    let view = UILabel()
    view.textAlignment = .left
    view.font = Constant.fontSize
    view.numberOfLines = 0
    return view
  }()
  
  private lazy var amountLabel: UILabel = {
    let view = UILabel()
    view.textAlignment = .right
    view.font = Constant.fontSize
    view.numberOfLines = 0
    return view
  }()
  
  private lazy var horizontalStack: UIStackView = {
    let view = UIStackView(arrangedSubviews: [sourceLabel, amountLabel])
    view.axis = .horizontal
    view.spacing = Constant.horizontalMargin
    view.translatesAutoresizingMaskIntoConstraints = false
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
    addSubview(horizontalStack)
  }
  
  private func setupConstraints() {
    let constraints =  [
      horizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
      horizontalStack.topAnchor.constraint(equalTo: topAnchor),
      horizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
      horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor)
    ]
    
    NSLayoutConstraint.activate(constraints)
  }
  
  func setup(with model: SourceAmountViewModel) {
    sourceLabel.text = model.source
    amountLabel.text = model.amount
  }
}

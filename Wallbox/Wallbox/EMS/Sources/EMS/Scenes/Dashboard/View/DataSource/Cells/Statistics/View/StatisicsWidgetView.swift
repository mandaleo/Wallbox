//
//  StatisicsWidgetView.swift
//  
//
//  Created by Manuel Martinez Gomez on 19/9/22.
//

import UIKit
import WallboxUI

final class StatisicsWidgetView: UIView {
  private enum Constant {
    static let fontSize = UIFont.boldSystemFont(ofSize: 12)
    static let margin: CGFloat = 8
    static let verticalMargin = CGFloat(8)
  }
  
  private lazy var buildingDemandView: TitleAmountView = {
    let view = TitleAmountView()
    return view
  }()
  
  private lazy var gridPowerView: TitleAmountView = {
    let view = TitleAmountView()
    return view
  }()
  
  
  private lazy var solarPowerView: TitleAmountView = {
    let view = TitleAmountView()
    return view
  }()
  
  private lazy var quasarPowerView: TitleAmountView = {
    let view = TitleAmountView()
    return view
  }()
  
  
  private lazy var verticalStack: UIStackView = {
    let view = UIStackView(arrangedSubviews: [buildingDemandView, gridPowerView, solarPowerView, quasarPowerView])
    view.axis = .vertical
    view.spacing = Constant.verticalMargin
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
    addSubview(verticalStack)
  }
  
  private func setupConstraints() {
    let constraints =  [
      verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.margin),
      verticalStack.topAnchor.constraint(equalTo: topAnchor, constant: Constant.margin),
      verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constant.margin),
      verticalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constant.margin)
    ]
    
    NSLayoutConstraint.activate(constraints)
  }
  
  func setup(with model: StatisicsWidgetViewModel) {
    let building: TitleAmountViewModel = .init(title: "Building Demand:", amount: "\(model.buildingDemand)kW")
    buildingDemandView.setup(with: building)
    
    let grid: TitleAmountViewModel = .init(title: "Grid:", amount: "\(model.gridPower)%")
    gridPowerView.setup(with: grid)
    
    let solar: TitleAmountViewModel = .init(title: "Solar:", amount: "\(model.solarPower)%")
    solarPowerView.setup(with: solar)
    
    let quasar: TitleAmountViewModel = .init(title: "Quasar:", amount: "\(model.quasarsPower)%")
    quasarPowerView.setup(with: quasar)
  }
}

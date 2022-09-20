//
//  LiveDataWidgetView.swift
//  
//
//  Created by Manuel Martinez Gomez on 19/9/22.
//

import UIKit
import WallboxUI

final class LiveDataWidgetView: UIView {
  private enum Constant {
    static let fontSize = UIFont.boldSystemFont(ofSize: 12)
    static let margin: CGFloat = 8
    static let verticalMargin = CGFloat(8)
  }
  
  private lazy var solarPowerView: TitleAmountView = {
    let view = TitleAmountView()
    return view
  }()
  
  private lazy var quasarPowerView: TitleAmountView = {
    let view = TitleAmountView()
    return view
  }()
  
  private lazy var gridPowerView: TitleAmountView = {
    let view = TitleAmountView()
    return view
  }()
  
  private lazy var buildingDemandView: TitleAmountView = {
    let view = TitleAmountView()
    return view
  }()
  
  private lazy var systemStateOfChargeView: TitleAmountView = {
    let view = TitleAmountView()
    return view
  }()
  
  private lazy var totalEnergyView: TitleAmountView = {
    let view = TitleAmountView()
    return view
  }()
  
  private lazy var currentEnergyView: TitleAmountView = {
    let view = TitleAmountView()
    return view
  }()
  
  private lazy var verticalStack: UIStackView = {
    let view = UIStackView(arrangedSubviews: [solarPowerView, quasarPowerView, gridPowerView, buildingDemandView, systemStateOfChargeView, totalEnergyView, currentEnergyView])
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
    backgroundColor = .white
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
  
  func setup(with model: LiveDataWidgetViewModel) {
    let solar: TitleAmountViewModel = .init(title: "Solar:",
                                            amount: "\(model.solarPower)kW")
    solarPowerView.setup(with: solar)
    
    let quasar: TitleAmountViewModel = .init(title: "Quasar:",
                                             amount: "\(model.quasarsPower)kW")
    quasarPowerView.setup(with: quasar)
    
    let grid: TitleAmountViewModel = .init(title: "Grid:",
                                           amount: "\(model.gridPower)kW")
    gridPowerView.setup(with: grid)
    
    let building: TitleAmountViewModel = .init(title: "Building Demand:",
                                               amount: "\(model.buildingDemand)kW")
    buildingDemandView.setup(with: building)
    
    let systemStateOfCharge: TitleAmountViewModel = .init(title: "State of Charge:",
                                                          amount: "\(model.systemStateOfCharge)%")
    systemStateOfChargeView.setup(with: systemStateOfCharge)
    
    let totalEnergy: TitleAmountViewModel = .init(title: "Total Energy:",
                                                  amount: "\(model.totalEnergy)kW")
    totalEnergyView.setup(with: totalEnergy)
    
    let currentEnergy: TitleAmountViewModel = .init(title: "Current Energy:",
                                                    amount: "\(model.currentEnergy)kW")
    currentEnergyView.setup(with: currentEnergy)
  }
}

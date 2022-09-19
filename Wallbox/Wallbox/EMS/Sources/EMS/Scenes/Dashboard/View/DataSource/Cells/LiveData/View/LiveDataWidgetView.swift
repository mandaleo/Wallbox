//
//  LiveDataWidgetView.swift
//  
//
//  Created by Manuel Martinez Gomez on 19/9/22.
//

import UIKit

final class LiveDataWidgetView: UIView {
  private enum Constant {
    static let fontSize = UIFont.boldSystemFont(ofSize: 12)
    static let margin: CGFloat = 8
    static let verticalMargin = CGFloat(8)
  }
  
  private lazy var solarPowerView: SourceAmountView = {
    let view = SourceAmountView()
    return view
  }()
  
  private lazy var quasarPowerView: SourceAmountView = {
    let view = SourceAmountView()
    return view
  }()
  
  private lazy var gridPowerView: SourceAmountView = {
    let view = SourceAmountView()
    return view
  }()
  
  private lazy var buildingDemandView: SourceAmountView = {
    let view = SourceAmountView()
    return view
  }()
  
  private lazy var systemStateOfChargeView: SourceAmountView = {
    let view = SourceAmountView()
    return view
  }()
  
  private lazy var totalEnergyView: SourceAmountView = {
    let view = SourceAmountView()
    return view
  }()
  
  private lazy var currentEnergyView: SourceAmountView = {
    let view = SourceAmountView()
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
    let solar: SourceAmountViewModel = .init(source: "Solar:", amount: "\(model.solarPower)")
    solarPowerView.setup(with: solar)
    
    let quasar: SourceAmountViewModel = .init(source: "Quasar:", amount: "\(model.quasarsPower)")
    quasarPowerView.setup(with: quasar)
    
    let grid: SourceAmountViewModel = .init(source: "Grid:", amount: "\(model.gridPower)")
    gridPowerView.setup(with: grid)
    
    let building: SourceAmountViewModel = .init(source: "Building Demand:", amount: "\(model.buildingDemand)")
    buildingDemandView.setup(with: building)
    
    let systemStateOfCharge: SourceAmountViewModel = .init(source: "State of Charge:", amount: "\(model.systemStateOfCharge)")
    systemStateOfChargeView.setup(with: systemStateOfCharge)
    
    let totalEnergy: SourceAmountViewModel = .init(source: "Total Energy:", amount: "\(model.totalEnergy)")
    totalEnergyView.setup(with: totalEnergy)
    
    let currentEnergy: SourceAmountViewModel = .init(source: "Current Energy:", amount: "\(model.currentEnergy)")
    currentEnergyView.setup(with: quasar)
  }
}

//
//  AmountEnergyWidgetViewModel.swift
//  
//
//  Created by Manuel Martinez Gomez on 17/9/22.
//

struct AmountEnergyWidgetViewModel {
  let amount: Double
  var isCharged: Bool {
    amount >= 0
  }
  var amountDescription: String {
    "\(amount)kWh"
  }
}

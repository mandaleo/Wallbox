//
//  Info.swift
//  
//
//  Created by Manuel Martinez Gomez on 19/9/22.
//

import Foundation

struct Info: Identifiable {
  let id: String = UUID().uuidString
  let date: Date
  let amount: Double
}

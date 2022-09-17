//
//  WallboxDateFormatter.swift
//  
//
//  Created by Manuel Martinez Gomez on 16/9/22.
//

import Foundation

public final class WallboxDateFormatter {
  private let dateFormatter: DateFormatter
  
  public init(dateFormat: String = "yyyy-MM-dd'T'HH:mm:ssZ") {
    dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormat
  }
  
  public func date(from timeStamp: String) -> Date? {
    dateFormatter.date(from: timeStamp)
  }
}

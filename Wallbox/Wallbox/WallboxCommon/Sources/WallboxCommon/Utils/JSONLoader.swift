//
//  JSONLoader.swift
//  
//
//  Created by Manuel Martinez Gomez on 16/9/22.
//

import Foundation

public protocol JSONLoading {
  func data<T: Codable>(from name: String, in bundle: Bundle) async throws -> T
}

public final class JSONLoader: JSONLoading {
  private let decoder = JSONDecoder()
  
  public init() {}
  
  public func data<T: Codable>(from name: String,
                        in bundle: Bundle) async throws -> T {
    guard let url = bundle.url(forResource: name, withExtension: "json") else { throw URLError(.fileDoesNotExist) }
    let (data, _) = try await URLSession.shared.data(from: url)
    return try decoder.decode(T.self, from: data)
  }
}

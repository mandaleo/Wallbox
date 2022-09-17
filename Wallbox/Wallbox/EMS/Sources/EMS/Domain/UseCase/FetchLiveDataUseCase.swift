//
//  FetchLiveDataUseCase.swift
//  
//
//  Created by Manuel Martinez Gomez on 16/9/22.
//

protocol FetchLiveDataUseCasing {
  func execute() async throws -> LiveData
}

final class FetchLiveDataUseCase: FetchLiveDataUseCasing {
  private let repository: EMSRepositoring
  
  init(repository: EMSRepositoring = EMSRepository()) {
    self.repository = repository
  }
  
  func execute() async throws -> LiveData {
    try await repository.fetchLiveData()
  }
}

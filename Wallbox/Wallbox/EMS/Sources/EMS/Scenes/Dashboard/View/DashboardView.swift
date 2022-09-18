//
//  DashboardView.swift
//  
//
//  Created by Manuel Martinez Gomez on 17/9/22.
//

import UIKit

protocol DashboardViewDelegate: AnyObject {
  func didSelect()
}

final class DashboardView: UIView {
  private enum Constant {
    static let loaderSize: CGSize = .init(width: 60, height: 60)
    static let mainFont = UIFont.boldSystemFont(ofSize: 26)
    static let margin = CGFloat(20)
  }
  
  weak var delegate: DashboardViewDelegate?
  private let dataSource: DashboardDataSource
  
  private lazy var collectionView: UICollectionView = {
    let view = UICollectionView()
    view.isHidden = true
    return view
  }()
  
  private lazy var loaderView: UIActivityIndicatorView = {
    let view = UIActivityIndicatorView(style: .large)
    view.isHidden = true
    return view
  }()
  
  private lazy var stateView: UILabel = {
    let view = UILabel()
    view.textAlignment = .center
    view.font = Constant.mainFont
    view.numberOfLines = 0
    view.isHidden = true
    return view
  }()
  
  init(dataSource: DashboardDataSource = DashboardDataSource()) {
    self.dataSource = dataSource
    super.init(frame: .zero)
    setupView()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    [stateView, collectionView, loaderView].forEach(addSubview)
    dataSource.setup(collectionView: collectionView)
  }
  
  private func setupConstraints() {
    let constaints = [
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
      collectionView.topAnchor.constraint(equalTo: topAnchor),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
      stateView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.margin),
      stateView.topAnchor.constraint(equalTo: topAnchor, constant: Constant.margin),
      stateView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constant.margin),
      stateView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constant.margin),
      loaderView.centerXAnchor.constraint(equalTo: centerXAnchor),
      loaderView.centerYAnchor.constraint(equalTo: centerYAnchor),
      loaderView.widthAnchor.constraint(equalToConstant: Constant.loaderSize.width),
      loaderView.heightAnchor.constraint(equalToConstant: Constant.loaderSize.height)
    ]
    
    NSLayoutConstraint.activate(constaints)
  }
  
  func apply(state: DashboardViewModel) {
    stateView.isHidden = state.stateViewIsHidden
    collectionView.isHidden = state.collectionViewIsHidden
    apply(loaderViewIsHidden: state.loaderViewIsHidden)
    handle(state)
  }
  
  private func apply(loaderViewIsHidden: Bool) {
    loaderView.isHidden = loaderViewIsHidden
    loaderViewIsHidden ? loaderView.stopAnimating() : loaderView.startAnimating()
  }
  
  private func handle(_ state: DashboardViewModel) {
    switch state.status {
      case .loading:
        dataSource.set(widgets: [])
      case .loaded(widgets: let widgets):
        dataSource.set(widgets: widgets)
      case .empty(viewModel: let viewModel):
        dataSource.set(widgets: [])
        stateView.text = viewModel
      case .error(viewModel: let viewModel):
        stateView.text = viewModel
    }
  }
}

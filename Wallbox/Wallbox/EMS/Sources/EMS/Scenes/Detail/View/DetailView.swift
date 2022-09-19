//
//  DetailView.swift
//  
//
//  Created by Manuel Martinez Gomez on 19/9/22.
//

import SwiftUI
import Charts

struct DetailView: View {
  @ObservedObject var viewModel: DetailViewModel
  
  var body: some View {
    Chart {
      ForEach(viewModel.metrics) { metric in
        ForEach(metric.data) { data in
          BarMark(x: .value("Date", data.date, unit: .hour),
                   y: .value("Energy", data.amount))
        }
        .foregroundStyle(by: .value("Axis", metric.source.rawValue))
        .symbol(by: .value("Value", metric.source.rawValue))
      }
    }
    .foregroundColor(.red)
    .frame(height: 200)
    .padding()
    .task {
      viewModel.loadData()
    }
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(viewModel: .init(historicalData: []))
  }
}

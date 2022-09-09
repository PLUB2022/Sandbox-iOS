//
//  SearchResultsViewModel.swift
//  WeatherApp
//
//  Created by 홍승현 on 2022/09/09.
//

import Foundation

struct SearchResultsViewModel {
  var cities = [Document]()

  var numberOfRowsInSection: Int {
    return cities.count
  }
}

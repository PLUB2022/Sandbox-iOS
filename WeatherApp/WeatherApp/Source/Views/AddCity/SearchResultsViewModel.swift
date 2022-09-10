//
//  SearchResultsViewModel.swift
//  WeatherApp
//
//  Created by 홍승현 on 2022/09/09.
//

import Foundation

import RxCocoa

struct SearchResultsViewModel {
  var cities = BehaviorRelay(value: [CityDocument]())
}

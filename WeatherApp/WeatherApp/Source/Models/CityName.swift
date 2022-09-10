//
//  CityName.swift
//  WeatherApp
//
//  Created by 홍승현 on 2022/09/01.
//

import Foundation

struct CityName: Codable {
  let documents: [CityDocument]
}

struct CityDocument: Codable, Equatable {
  let addressName: String
  let longitude: String
  let latitude: String

  enum CodingKeys: String, CodingKey {
    case addressName = "address_name"
    case longitude = "x"
    case latitude = "y"
  }
}

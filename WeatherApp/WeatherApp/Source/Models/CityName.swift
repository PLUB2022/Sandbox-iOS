//
//  CityName.swift
//  WeatherApp
//
//  Created by 홍승현 on 2022/09/01.
//

import Foundation

struct CityName: Codable {
  let documents: [Document]
  let meta: Meta
}

// MARK: - Document
struct Document: Codable {
  let addressName: String
  let longitude: String
  let latitude: String

  enum CodingKeys: String, CodingKey {
    case addressName = "address_name"
    case longitude = "x"
    case latitude = "y"
  }
}

// MARK: - Meta
struct Meta: Codable {
  let isEnd: Bool
  let pageableCount: Int
  let totalCount: Int

  enum CodingKeys: String, CodingKey {
    case isEnd = "is_end"
    case pageableCount = "pageable_count"
    case totalCount = "total_count"
  }
}

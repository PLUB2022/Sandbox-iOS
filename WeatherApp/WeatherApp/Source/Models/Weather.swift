//
//  Weather.swift
//  WeatherApp
//
//  Created by 홍승현 on 2022/09/10.
//

import Foundation

struct Weather: Codable {
    let weather: [WeatherInfo]
    let main: TempInfo
}

struct TempInfo: Codable {
    let temperature: Double

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
    }
}

struct WeatherInfo: Codable {
    let weatherDescription: String

    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
    }
}

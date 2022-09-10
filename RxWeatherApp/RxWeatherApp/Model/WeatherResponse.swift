//
//  WeatherResponse.swift
//  RxWeatherApp
//
//  Created by 양유진 on 2022/09/10.
//

import Foundation

struct WeatherResponse: Decodable{
  let resultWeather: Weather
}

struct Weather: Decodable{
  let temp: Double
}

extension WeatherResponse{
  static var empty: WeatherResponse {
    return WeatherResponse(resultWeather: Weather(temp: 0.0))
  }
}

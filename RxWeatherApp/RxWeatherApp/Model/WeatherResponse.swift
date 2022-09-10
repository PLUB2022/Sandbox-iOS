//
//  WeatherResponse.swift
//  RxWeatherApp
//
//  Created by 양유진 on 2022/09/10.
//

import Foundation

struct WeatherResponse: Decodable{
  let main: TempInfo
  let weather: [WeatherInfo]
}

struct TempInfo: Decodable{
  let temp: Double
  
  var FahrenheitToCelsius: Double{
    return round (temp - 273.15)
  }
}


struct WeatherInfo: Decodable{
  let id: Int
  let main: String
  let description: String
}


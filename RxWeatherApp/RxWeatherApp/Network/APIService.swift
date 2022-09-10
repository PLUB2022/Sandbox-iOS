//
//  APIService.swift
//  RxWeatherApp
//
//  Created by 양유진 on 2022/09/10.
//

import Foundation

struct APIService {
  static func getURL(city: String) -> URL? {
   return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=c04d15e4969cf934c6ee2beb42ddf39a")
  }
}

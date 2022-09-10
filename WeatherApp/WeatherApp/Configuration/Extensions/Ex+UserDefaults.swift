//
//  Ex+UserDefaults.swift
//  WeatherApp
//
//  Created by 홍승현 on 2022/09/10.
//

import Foundation

extension UserDefaults {

  var currentCityWeatherInfo: CityWeatherInfo {
    get {
        return (
          try? JSONDecoder().decode(CityWeatherInfo.self, from: UserDefaults.standard.data(forKey: #function)!)
        ) ?? CityWeatherInfo(cityName: "", temperature: 0, weather: "")
    }
    set {
      if let data = try? JSONEncoder().encode(newValue) {
        UserDefaults.standard.set(data, forKey: #function)
      }
    }
  }

  var cities: [CityDocument] {
    get {
      var modelArray: [CityDocument]?
      if let data = UserDefaults.standard.data(forKey: #function) {
        modelArray = try? PropertyListDecoder().decode([CityDocument].self, from: data)
      }
      return modelArray ?? []
    }
    set {
      UserDefaults.standard.set(try? PropertyListEncoder().encode(newValue), forKey: #function)
    }
  }

}

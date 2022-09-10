//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by 홍승현 on 2022/09/10.
//

import Foundation
import Alamofire

enum WeatherManager: URLRequestConvertible {

  case weatherData(document: CityDocument)

  var baseURL: URL {
    switch self {
    case let .weatherData(document: document):

      var url = URLComponents(string: APIConstants.Weather.url)!
      url.queryItems = [
        URLQueryItem(name: "lat", value: document.latitude),
        URLQueryItem(name: "lon", value: document.longitude),
        URLQueryItem(name: "appid", value: APIConstants.Weather.accessToken)
      ]
      return url.url!
    }
  }

  var httpMethod: HTTPMethod {
    return .get
  }

  func asURLRequest() throws -> URLRequest {
    var request = URLRequest(url: baseURL)
    request.method = httpMethod
    return request
  }
}

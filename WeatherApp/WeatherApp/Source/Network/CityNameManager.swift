//
//  CityNameManager.swift
//  WeatherApp
//
//  Created by 홍승현 on 2022/09/01.
//

import Foundation
import Alamofire

enum CityNameManager: URLRequestConvertible {

  case findCity(name: String)

  var baseURL: URL {
    switch self {
    case let .findCity(name: name):
      var url = URLComponents(string: APIConstants.CityName.url)!
      url.queryItems = [URLQueryItem(name: "query", value: name)]
      return url.url!
    }
  }

  var httpHeaders: HTTPHeaders {
    var headers = HTTPHeaders()
    headers["Authorization"] = "KakaoAK \(APIConstants.CityName.accessToken)"
    return headers
  }

  var httpMethod: HTTPMethod {
    return .get
  }

  var parameters: Parameters {
    var params = Parameters()

    switch self {
    case let .findCity(name: name):
      params["query"] = name
    }

    return params
  }

  func asURLRequest() throws -> URLRequest {
    var request = URLRequest(url: baseURL)
    request.method = httpMethod
    request.headers = httpHeaders
    return request
  }
}

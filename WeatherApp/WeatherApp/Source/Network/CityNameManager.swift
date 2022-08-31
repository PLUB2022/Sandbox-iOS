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
    return URL(string: APIConstants.CityName.url)!
  }

  var httpHeaders: HTTPHeaders {
    var headers = HTTPHeaders()
    headers["Authorization"] = "KakaoAK \(APIConstants.CityName.accessToken)"
    return headers
  }

  var httpMethod: HTTPMethod {
    return .get
  }

  var path: String {
    return "get"
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
    let url = baseURL.appendingPathExtension(path)
    var request = URLRequest(url: url)
    request.method = httpMethod
    request.headers = httpHeaders
    request.httpBody = try JSONEncoding.default.encode(request, with: parameters).httpBody
    return request
  }
}

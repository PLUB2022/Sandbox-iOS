//
//  URLRequest.swift
//  RxWeatherApp
//
//  Created by 양유진 on 2022/09/10.
//

import Foundation
import RxSwift
import RxCocoa

struct Resource<T: Decodable> {
  let url: URL
}

extension URLRequest {
  static func load<T>(resource: Resource<T>) -> Observable<T> {
    return Observable
      .from(optional: resource.url)
      .flatMap { url -> Observable<Data> in
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return URLSession.shared.rx.data(request: request)
      }.map { data -> T in
        return try JSONDecoder().decode(T.self, from: data)
      }.asObservable()
  }
}

//
//  AddCityViewModel.swift
//  WeatherApp
//
//  Created by 홍승현 on 2022/09/09.
//

import Foundation

import RxSwift
import RxCocoa

class AddCityViewModel {

  let disposeBag = DisposeBag()

  var items = BehaviorRelay(value: [Document]())

  private var cities: [Document] {
    get {
      var modelArray: [Document]?
      if let data = UserDefaults.standard.data(forKey: "Cities") {
        modelArray = try? PropertyListDecoder().decode([Document].self, from: data)
      }
      return modelArray ?? []
    }
    set {
      UserDefaults.standard.set(try? PropertyListEncoder().encode(newValue), forKey: "Cities")
    }
  }

  init() {
    items.accept(self.cities)

    items.subscribe(onNext: { [weak self] in
      self?.cities = $0
    })
    .disposed(by: disposeBag)
  }
}

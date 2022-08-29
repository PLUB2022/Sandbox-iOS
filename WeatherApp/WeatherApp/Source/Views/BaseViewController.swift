//
//  BaseViewController.swift
//  WeatherApp
//
//  Created by 홍승현 on 2022/08/29.
//

import UIKit

class BaseViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayouts()
    setupConstraints()
    setupStyles()
  }

  func setupLayouts() { }
  func setupConstraints() { }
  func setupStyles() {
    view.backgroundColor = .white
  }
}

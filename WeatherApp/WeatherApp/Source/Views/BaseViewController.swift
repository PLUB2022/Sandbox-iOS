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

    // background layer
    let layer = CALayer.gradientBackground.then {
      $0.frame = view.bounds
    }

    view.layer.addSublayer(layer)

    setupLayouts()
    setupConstraints()
    setupStyles()
  }

  func setupLayouts() { }
  func setupConstraints() { }
  func setupStyles() { }
}

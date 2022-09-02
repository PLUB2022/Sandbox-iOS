//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by 홍승현 on 2022/08/26.
//

import UIKit

import ReactorKit
import RxCocoa
import SnapKit
import Then

class HomeViewController: BaseViewController {

  // MARK: - Properties

  let disposeBag = DisposeBag()

  private let cityLabel = UILabel().then {
    $0.text = "Montreal"
    $0.textColor = .white
    $0.font = .systemFont(ofSize: 34, weight: .regular)
  }

  private let temperatureLabel = UILabel().then {
    $0.text = "28°"
    $0.textColor = .white
    $0.font = .systemFont(ofSize: 96, weight: .thin)
  }

  private let descriptionLabel = UILabel().then {
    $0.text = "Mostly Clear"
    $0.textColor = .init(rgb: 0xEBEBF5)
    $0.font = .systemFont(ofSize: 20, weight: .semibold)
  }

  private let backgroundImageView = UIImageView().then {
    $0.image = UIImage(named: "AppBackground")
    $0.contentMode = .scaleAspectFill
  }

  private let weeklyView = UIView()

  private lazy var stackView = UIStackView().then {
    $0.alignment = .center
    $0.spacing = 12
    $0.axis = .vertical
  }

  // MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  // MARK: - Layout Configuration

  override func setupLayouts() {
    super.setupLayouts()

    [backgroundImageView, stackView, weeklyView].forEach {
      view.addSubview($0)
    }

    [cityLabel, temperatureLabel, descriptionLabel].forEach {
      stackView.addArrangedSubview($0)
    }

    navigationItem.rightBarButtonItem = UIBarButtonItem(
      image: UIImage(systemName: "plus.circle"),
      style: .plain,
      target: nil,
      action: nil
    )
  }

  override func setupConstraints() {
    super.setupConstraints()

    backgroundImageView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    stackView.snp.makeConstraints { make in
      make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
      make.top.equalTo(view.safeAreaLayoutGuide).inset(28)
    }

    weeklyView.snp.makeConstraints { make in
      make.height.equalTo(314)
      make.bottom.leading.trailing.equalToSuperview()
    }
  }
}

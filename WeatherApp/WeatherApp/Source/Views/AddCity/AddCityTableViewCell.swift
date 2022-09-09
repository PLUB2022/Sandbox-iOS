//
//  AddCityTableViewCell.swift
//  WeatherApp
//
//  Created by 홍승현 on 2022/09/09.
//

import UIKit

import SnapKit
import Then

final class AddCityTableViewCell: UITableViewCell {

  static let id = "AddCityTableViewCell"

  // MARK: - Properties

  private let cityLabel = UILabel().then {
    $0.textAlignment = .center
    $0.textColor = .white
    $0.font = .systemFont(ofSize: 30)
  }

  // MARK: - Initialization

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Configuration

  private func configureUI() {
    contentView.addSubview(cityLabel)

    cityLabel.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(10)
    }

    // clear background color
    backgroundColor = .clear

    // border & corner radius
    contentView.layer.cornerRadius = 15
    contentView.layer.borderWidth = 2
    contentView.layer.borderColor = UIColor.white.cgColor
  }

  func configure(city: String) {
    cityLabel.text = city
  }
}

//
//  SearchResultsViewController.swift
//  WeatherApp
//
//  Created by 홍승현 on 2022/09/07.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit
import Then

final class SearchResultsViewController: BaseViewController {

  // MARK: - Properties

  private let disposeBag = DisposeBag()
  var viewModel = SearchResultsViewModel()

  lazy var tableView = UITableView().then {
    $0.register(AddCityTableViewCell.self, forCellReuseIdentifier: AddCityTableViewCell.id)
    $0.backgroundColor = .clear
  }

  // MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    // TODO: 나중에 ReactorKit의 bind로 빼야합니다.
    viewModel.cities
      .bind(
      to: tableView.rx.items(cellIdentifier: AddCityTableViewCell.id, cellType: AddCityTableViewCell.self)
      ) { _, element, cell in
        cell.configure(city: element.addressName)
      }
      .disposed(by: disposeBag)

    tableView.rx.itemSelected
      .subscribe(onNext: { [weak self] _ in
        self?.dismiss(animated: true)
      })
      .disposed(by: disposeBag)
  }

  // MARK: - Layout Configuration

  override func setupLayouts() {
    super.setupLayouts()
    view.addSubview(tableView)
  }

  override func setupConstraints() {
    super.setupConstraints()
    tableView.snp.makeConstraints { make in
      make.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }
}

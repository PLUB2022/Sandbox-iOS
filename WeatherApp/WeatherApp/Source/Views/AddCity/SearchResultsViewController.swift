//
//  SearchResultsViewController.swift
//  WeatherApp
//
//  Created by 홍승현 on 2022/09/07.
//

import UIKit

import SnapKit
import Then

final class SearchResultsViewController: BaseViewController {

  // MARK: - Properties

  var viewModel = SearchResultsViewModel()

  lazy var tableView = UITableView().then {
    $0.dataSource = self
    $0.delegate = self
    $0.register(AddCityTableViewCell.self, forCellReuseIdentifier: AddCityTableViewCell.id)
    $0.backgroundColor = .clear
  }

  // MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
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

// MARK: - UITableViewDataSource

extension SearchResultsViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsInSection
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: AddCityTableViewCell.id,
      for: indexPath
    ) as? AddCityTableViewCell
    else {
      fatalError("SearchResultsViewController -> UITableViewDataSource.tableView(_:cellForRowAt:)")
    }

    cell.configure(city: viewModel.cities[indexPath.row].addressName)
    return cell
  }
}

// MARK: - UITableViewDelegate

extension SearchResultsViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath)
    dismiss(animated: true)
  }
}

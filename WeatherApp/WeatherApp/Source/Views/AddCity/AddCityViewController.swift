//
//  AddCityViewController.swift
//  WeatherApp
//
//  Created by 홍승현 on 2022/09/02.
//

import UIKit

import SnapKit
import Then

final class AddCityViewController: BaseViewController {

  private let searchController = UISearchController(searchResultsController: SearchResultsViewController()).then {
    $0.searchBar.searchBarStyle = .minimal
    $0.searchBar.placeholder = "도시 검색"
  }

  private lazy var tableView = UITableView().then {
    $0.dataSource = self
    $0.delegate = self
    $0.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }

  // MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  // MARK: - Layout Configuration

  override func setupLayouts() {
    super.setupLayouts()

    view.addSubview(tableView)
    navigationItem.searchController = searchController
  }

  override func setupConstraints() {
    super.setupConstraints()
    tableView.snp.makeConstraints { make in
      make.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }

  override func setupStyles() {
    super.setupStyles()

    // MARK: NavigationController
    navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.largeTitleDisplayMode = .always
    navigationItem.title = "Cities"
  }
}

// MARK: - UITableViewDataSource

extension AddCityViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
  }
}

// MARK: - UITableViewDelegate

extension AddCityViewController: UITableViewDelegate {

}

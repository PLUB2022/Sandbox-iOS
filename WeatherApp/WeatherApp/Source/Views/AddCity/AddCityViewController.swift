//
//  AddCityViewController.swift
//  WeatherApp
//
//  Created by 홍승현 on 2022/09/02.
//

import UIKit

import Alamofire
import SnapKit
import Then

final class AddCityViewController: BaseViewController {

  private var viewModel = AddCityViewModel()

  private lazy var searchResultsController = SearchResultsViewController()

  private lazy var searchController = UISearchController(searchResultsController: searchResultsController).then {
    $0.searchBar.searchBarStyle = .minimal
    $0.searchBar.placeholder = "도시 검색"
    $0.searchResultsUpdater = self
  }

  private lazy var tableView = UITableView().then {
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
    return viewModel.items.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: AddCityTableViewCell.id,
      for: indexPath
    ) as? AddCityTableViewCell
    else {
      fatalError("AddCityViewController -> UITableViewDataSource.tableView(_:cellForRowAt:)")
    }
    cell.configure(city: viewModel.items[indexPath.row].addressName)
    return cell
  }
}

// MARK: - UITableViewDelegate

extension AddCityViewController: UITableViewDelegate {

}

// MARK: - UISearchResultsUpdating

extension AddCityViewController: UISearchResultsUpdating {

  func updateSearchResults(for searchController: UISearchController) {
    guard let resultsController = searchController.searchResultsController as? SearchResultsViewController,
          let query = searchController.searchBar.text,
          !query.trimmingCharacters(in: .whitespaces).isEmpty,
          query.trimmingCharacters(in: .whitespaces).count >= 2
    else { return }

    AF
      .request(CityNameManager.findCity(name: query))
      .responseDecodable(of: CityName.self) { response in
        switch response.result {
        case .success(let cities):
          DispatchQueue.main.async {
            resultsController.viewModel.cities = cities.documents
            resultsController.tableView.reloadData()
          }
        case .failure(let error):
          print(error)
        }
      }
      .resume()
  }
}

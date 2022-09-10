//
//  AddCityViewController.swift
//  WeatherApp
//
//  Created by 홍승현 on 2022/09/02.
//

import UIKit

import Alamofire
import RxCocoa
import RxSwift
import SnapKit
import Then

protocol AddCityViewControllerDelegate {

  func pop()
}
final class AddCityViewController: BaseViewController {

  // MARK: - Properties

  private let disposeBag = DisposeBag()
  private var viewModel = AddCityViewModel()
  var delegate: AddCityViewControllerDelegate?

  private let searchController = UISearchController(searchResultsController: SearchResultsViewController()).then {
    $0.searchBar.searchBarStyle = .minimal
    $0.searchBar.placeholder = "도시 검색"
  }

  private lazy var tableView = UITableView().then {
    $0.register(AddCityTableViewCell.self, forCellReuseIdentifier: AddCityTableViewCell.id)
    $0.backgroundColor = .clear
  }

  // MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    guard let searchResultsController = self.searchController.searchResultsController as? SearchResultsViewController
    else {
      return
    }

    // TODO: 나중에 ReactorKit의 bind로 빼야합니다.
    viewModel.items
      .bind(
        to: tableView.rx.items(cellIdentifier: AddCityTableViewCell.id, cellType: AddCityTableViewCell.self)
      ) { _, element, cell in
        cell.configure(city: element.addressName)
      }
      .disposed(by: disposeBag)

    searchController.searchBar.searchTextField.rx.text
      .orEmpty
      .distinctUntilChanged()
      .subscribe {
        guard !$0.trimmingCharacters(in: .whitespaces).isEmpty,
              $0.trimmingCharacters(in: .whitespaces).count >= 2
        else { return }

        AF
          .request(CityNameManager.findCity(name: $0))
          .responseDecodable(of: CityName.self) { response in
            switch response.result {
            case .success(let cities):
              DispatchQueue.main.async {
                searchResultsController.viewModel.cities.accept(cities.documents)
              }
            case .failure(let error):
              print(error)
            }
          }
          .resume()
      }
      .disposed(by: disposeBag)

    tableView.rx.itemSelected
      .subscribe(onNext: { [weak self] in
        guard let cityDocument = self?.viewModel.items.value[$0.row] else { return }

        AF
          .request(WeatherManager.weatherData(document: cityDocument))
          .responseDecodable(of: Weather.self) { response in
            switch response.result {
            case .success(let weather):
              let model = CityWeatherInfo(
                cityName: cityDocument.addressName,
                temperature: weather.main.temperature,
                weather: weather.weather[0].weatherDescription
              )
              UserDefaults.standard.currentCityWeatherInfo = model
              self?.delegate?.pop()
            case .failure(let error):
              print(error)
            }
          }
      })
      .disposed(by: disposeBag)

    searchResultsController.selectedCitySubject
      .debug()
      .compactMap { $0 }
      .filter { [weak self] in
        !(self?.viewModel.items.value.contains($0) ?? true)
      }
      .subscribe { [weak self] in
        guard let array = self?.viewModel.items.value else { return }
        self?.viewModel.items.accept(array + [$0])
      }
      .disposed(by: disposeBag)
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

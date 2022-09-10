//
//  ViewController.swift
//  RxWeatherApp
//
//  Created by 양유진 on 2022/09/10.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  
  let disposeBag = DisposeBag()
  
  private let searchBar: UITextField = {
    let searchBar = UITextField()
    searchBar.borderStyle = .roundedRect
    searchBar.becomeFirstResponder()
    searchBar.placeholder = "도시를 검색하세요."
    
    return searchBar
  }()
  
  private let tempLabel: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 40)
    label.textAlignment = .center
    label.textColor = .black
    label.numberOfLines = 0
    label.text = "온도"
    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = UIColor.lightGray
    
    configure()
    addSubView()
    makeConstraints()
    searchEditingEnded()
  }
  
  private func configure(){
    
  }
  
  private func addSubView(){
    view.addSubview(searchBar)
    view.addSubview(tempLabel)
  }
  
  private func makeConstraints(){
    searchBar.snp.makeConstraints{
      $0.centerX.equalTo(view.snp.centerX)
      $0.top.equalTo(80)
      $0.height.equalTo(50)
      $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
    }
    
    tempLabel.snp.makeConstraints{
      $0.centerX.equalTo(view.snp.centerX)
      $0.top.equalTo(searchBar.snp.bottom).offset(100)
    }

  }
  
  private func searchEditingEnded(){
    self.searchBar
      .rx
      .controlEvent(.editingDidEndOnExit)
      .asObservable()
      .map { self.searchBar.text }
      .subscribe(onNext: { city in
        if let city = city {
          if city.isEmpty {
            self.displayWeather(nil)
          }else{
            self.fetchWeather(by: city)
          }
        }
      }).disposed(by: disposeBag)

  }
  
  private func fetchWeather(by city: String){
    guard let cityEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlUserAllowed),
          let url = APIService.getURL(city: cityEncoded) else { return }
    let resource = Resource<WeatherResponse>(url: url)
    
    //USING DRIVER AND CONTROLPROPERTY
    let search = URLRequest
        .load(resource: resource)
        .observeOn(MainScheduler.instance)
    
    search
      .map { "\($0.resultWeather.temp) 𝗙" }
        .asDriver(onErrorJustReturn: "ERROR")
        .drive(self.tempLabel.rx.text)
        .disposed(by: disposeBag)

  }
  
  private func displayWeather(_ weather: Weather?){
    if let weather = weather {
      self.tempLabel.text = "\(weather.temp)"
    }else{
      self.tempLabel.text = "온도가 표시됩니다."
    }
  }
  
}



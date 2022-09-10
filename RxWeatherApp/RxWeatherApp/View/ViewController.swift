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
  
  private let searchBar: UITextField = {
    let searchBar = UITextField()
    searchBar.borderStyle = .roundedRect
    searchBar.becomeFirstResponder()
    searchBar.placeholder = "도시를 검색하세요."
    
    return searchBar
  }()

  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = UIColor.lightGray
    
    configure()
    addSubView()
    makeConstraints()
  }
  
  private func configure(){

  }
  
  private func addSubView(){
    view.addSubview(searchBar)
  }
  
  private func makeConstraints(){
    searchBar.snp.makeConstraints{
      $0.centerX.equalTo(view.snp.centerX)
      $0.top.equalTo(80)
      $0.height.equalTo(50)
      $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
    }

  }
  
  
  
}



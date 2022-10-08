//
//  ViewController.swift
//  expandedTableView
//
//  Created by 양유진 on 2022/10/08.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.view.backgroundColor = .orange
  }
  
  
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct VCPreView:PreviewProvider {
  static var previews: some View {
    ViewController().toPreview()
  }
}
#endif


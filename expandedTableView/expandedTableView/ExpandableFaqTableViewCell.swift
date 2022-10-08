//
//  ExpandableFaqTableViewCell.swift
//  expandedTableView
//
//  Created by 양유진 on 2022/10/09.
//

import UIKit
import SnapKit
import Then

class ExpandableFaqTableViewCell: UITableViewCell {
  
  static let identifier = "ExpandableFaqTableViewCell"
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func addContentView() {
//    contentView.addSubview()
  }
  
  private func autoLayout(){
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct CellPreview: PreviewProvider {
  static var previews: some View {
    UIViewPreview {
      let cell = ExpandableFaqTableViewCell(frame: .zero)
      
      return cell
    }.previewLayout(.sizeThatFits)
  }
}
#endif

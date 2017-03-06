//
//  ColapsibleTableHeaderFooterView.swift
//  Swift-CollapsibleTableSection
//
//  Created by 骆驼鱼 on 17/3/6.
//  Copyright © 2017年 Rookie.YXiang. All rights reserved.
//

import UIKit

protocol ColapsibleTableHeaderFooterViewDelegate {
  func toggleSection(header:ColapsibleTableHeaderFooterView, section: Int)
}

class ColapsibleTableHeaderFooterView: UITableViewHeaderFooterView {
  
  var delegate: ColapsibleTableHeaderFooterViewDelegate?
  var section: Int = -1
  
  let titleLabel = UILabel()
  let arrowLabel = UILabel()
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    
    arrowLabel.widthAnchor.constraint(equalToConstant: 12).isActive = true
    arrowLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    arrowLabel.translatesAutoresizingMaskIntoConstraints = false
    
    contentView.backgroundColor = UIColor.lightGray
    contentView.addSubview(titleLabel)
    contentView.addSubview(arrowLabel)

    addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ColapsibleTableHeaderFooterView.tapHeader(gestureRecognizer:))))
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    titleLabel.textColor = UIColor.white
    arrowLabel.textColor = UIColor.white
    
    let views = [
      "titleLabel" : titleLabel,
      "arrowLabel" : arrowLabel
    ]
    
    contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[titleLabel]-[arrowLabel]-20-|", options: [], metrics: nil, views: views))
    
    contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[titleLabel]-|", options: [], metrics: nil, views: views))
    
    contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[arrowLabel]-|", options: [], metrics: nil, views: views))
  }
  
  func tapHeader(gestureRecognizer: UITapGestureRecognizer) {
    guard let cell = gestureRecognizer.view as? ColapsibleTableHeaderFooterView else {
      return
    }
    
    delegate?.toggleSection(header: self, section: cell.section)
  }

  func setCollapsed(collapsed: Bool) {
    arrowLabel.rotate(toValue: collapsed ? 0.0 : CGFloat(M_PI_2), duration: 0.2)
  }
}

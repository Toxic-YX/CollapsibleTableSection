//
//  Extensions.swift
//  Swift-CollapsibleTableSection
//
//  Created by 骆驼鱼 on 17/3/6.
//  Copyright © 2017年 Rookie.YXiang. All rights reserved.
//

import UIKit

extension UIView {
  // 旋转动画
  func rotate(toValue: CGFloat, duration: CFTimeInterval) {
    let animation = CABasicAnimation(keyPath: "transform.rotation")
    
    animation.toValue = toValue
    animation.duration = duration
    animation.isRemovedOnCompletion = false
    animation.fillMode = kCAFillModeForwards
    
    self.layer.add(animation, forKey: nil)
  }
  
}

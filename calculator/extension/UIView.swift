//
//  UIView.swift
//  calculator
//
//  Created by Anicall Share Account on 2018/04/06.
//  Copyright © 2018年 algha. All rights reserved.
//

import UIKit


extension UIView {
    
    func Width() -> CGFloat {
        return self.frame.width
    }
    
    func PointX() -> CGFloat {
        return self.frame.origin.x
    }
    
    func WX() -> CGFloat {
        return self.Width()+self.PointX()
    }
    
    func Height() -> CGFloat {
        return self.frame.height
    }
    
    func PointY() -> CGFloat {
        return self.frame.origin.y
    }
    
    func HY() -> CGFloat {
        return self.Height()+self.PointY()
    }
    
  
}

//
//  FormTextFeild.swift
//  calculator
//
//  Created by Anicall Share Account on 2018/04/06.
//  Copyright © 2018年 algha. All rights reserved.
//

import UIKit


class FormTextFeild : UITextField{
    
    
    func initParams(){
        self.keyboardType    = .numberPad
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
        
        self.leftViewMode = .always
        self.rightViewMode = .always
        
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
    }
    
}

//
//  Int.swift
//  calculator
//
//  Created by Anicall Share Account on 2018/04/07.
//  Copyright © 2018年 algha. All rights reserved.
//

import Foundation

extension Int {
    var decimalStr: String {
        let decimalFormatter = NumberFormatter()
        decimalFormatter.numberStyle = NumberFormatter.Style.decimal
        decimalFormatter.groupingSeparator = ","
        decimalFormatter.groupingSize = 3
        
        return decimalFormatter.string(from: self as NSNumber)!
    }
}

//
//  Alert.swift
//  calculator
//
//  Created by Anicall Share Account on 2018/04/06.
//  Copyright © 2018年 algha. All rights reserved.
//

import UIKit

class Alert{
    
    var controller: UIViewController!
    var alert: UIAlertController!
    
    init(in controller: UIViewController) {
        self.controller = controller
    }
    
    func show(with content: String, title: String? = "アラート", handler: ((UIAlertAction)->Void?)? = nil) {
        alert = UIAlertController(title: title, message: content, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "はい", style: .default, handler: { action in
            if(handler != nil){
                handler!(action)
            }
        }))
        controller.present(alert, animated: true, completion: nil)
    }
    
    func show(with content: String, title: String? = "アラート") {
        alert = UIAlertController(title: title, message: content, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "はい", style: .default, handler:nil))
        controller.present(alert, animated: true, completion: nil)
    }
    
    
    func showIndicator(with title: String, handler: @escaping ((UIAlertAction)->Void?)){
        alert = UIAlertController(title: title, message: "\n\n\n", preferredStyle: .alert)
        
        let customView = UIView()
        customView.frame = CGRect(x: 0, y: 50, width: alert.view.Width()-(21 * 5), height: 60)
        customView.backgroundColor = UIColor.clear
        alert.view.addSubview(customView)
        
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: customView.Width()/2 - 20, y: customView.Height()/2 - 20, width: 40, height: 40)) as UIActivityIndicatorView
        loadingIndicator.transform = CGAffineTransform(scaleX: 1.7, y: 1.7)
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        loadingIndicator.startAnimating()
        customView.addSubview(loadingIndicator)
        
        alert.addAction(UIAlertAction(title: "キャンセル", style: .default, handler: { action in
            handler(action)
        }))
        controller.present(alert, animated: true, completion: nil)
    }
    
}

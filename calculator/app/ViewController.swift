//
//  ViewController.swift
//  calculator
//
//  Created by Anicall Share Account on 2018/04/06.
//  Copyright © 2018年 algha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var FormView: UIView!
    
    var MoneyTextField : FormTextFeild!
    var PeopleTextField: FormTextFeild!
    
    var resultLabel: UILabel!
    
    var resultBtn: UIButton!
    var resetBtn : UIButton!
    
    var statusBarHeight: CGFloat = 64
    
    var halfScreen: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.title = "割り勘"
        
        
        CreateForm()
        
    }

    func CreateForm(){
        
        FormView = UIView()
        FormView.frame = CGRect(x: 0, y: statusBarHeight, width: self.view.Width(), height: self.view.Height() - statusBarHeight)
        self.view.addSubview(FormView)
        
        MoneyTextField = FormTextFeild()
        MoneyTextField.frame = CGRect(x: 10, y: 20, width: self.view.Width()-20, height: 50)
        MoneyTextField.placeholder = "合計金額を入力してください"
        MoneyTextField.initParams()
        FormView.addSubview(MoneyTextField)
        
        
        PeopleTextField = FormTextFeild()
        PeopleTextField.frame = CGRect(x: 10, y: MoneyTextField.HY() + 20, width: self.view.Width()-20, height: 50)
        PeopleTextField.placeholder = "人数を入力してください"
        PeopleTextField.initParams()
        FormView.addSubview(PeopleTextField)
        
        
        /*result label*/
        resultLabel = UILabel()
        resultLabel.isHidden = true
        resultLabel.frame = CGRect(x: 15, y: PeopleTextField.HY() + 15, width: self.view.Width() - 20, height: 50)
        resultLabel.textAlignment = .left
        resultLabel.textColor = UIColor.black
        FormView.addSubview(resultLabel)
        
        /*result btn*/
        resultBtn = UIButton()
        resultBtn.frame = CGRect(x: 10, y: PeopleTextField.HY() + 15, width: self.view.Width() - 20, height: 50)
        resultBtn.backgroundColor = UIColor.gray
        resultBtn.setTitle("割り勘", for: .normal)
        resultBtn.addTarget(self, action: #selector(self.split(btn:)), for: .touchUpInside)
        FormView.addSubview(resultBtn)
        
        
        
        /*reset btn*/
        self.halfScreen = (self.view.Width() - 30) / 2
        
        resetBtn = UIButton()
        resetBtn.frame = CGRect(x: self.view.Width(), y: PeopleTextField.HY() + 15, width: halfScreen, height: 50)
        resetBtn.backgroundColor = UIColor.red
        resetBtn.setTitleColor(UIColor.white, for: .normal)
        resetBtn.setTitle("レセット", for: .normal)
        resetBtn.addTarget(self, action: #selector(self.reset(btn:)), for: .touchUpInside)
        FormView.addSubview(resetBtn)
        
    }
    
    @objc func split(btn: UIButton){
        if self.MoneyTextField.text?.count == 0 ||
             self.PeopleTextField.text?.count == 0{
            Alert(in: self).show(with: "合計金額又は、人数が未入力です。")
            return
        }
        
        let Money : Int = Int(self.MoneyTextField.text!)!
        let People: Int = Int(self.PeopleTextField.text!)!
        
        if Money < 100{
            Alert(in: self).show(with: "合計金額１００円以上入力してください。")
            return
        }
        
        if People < 2{
            Alert(in: self).show(with: "人数は２名以上入力してください。")
            return
        }
        
        var forOnePerson = Money / People
        
        if forOnePerson % 100 != 0 {
            forOnePerson = Int((Float(forOnePerson / 100) + 1) * 100)
        }
        
    
        
        resultLabel.isHidden = false
        resultLabel.text = "一人当たり\(forOnePerson.decimalStr)円です。"
        
        resultBtn.frame = CGRect(x: 10, y: resultLabel.HY() + 15, width: halfScreen, height: 50)
        
        resetBtn.frame = CGRect(x: resultBtn.WX() + 10, y: resultLabel.HY() + 15, width: halfScreen, height: 50)
        
    }
    
    @objc func reset(btn: UIButton){
        
        MoneyTextField.text  = ""
        PeopleTextField.text = ""
        
        resultLabel.isHidden = true
        resultLabel.text = ""
        
        resultBtn.frame = CGRect(x: 10, y: PeopleTextField.HY() + 15, width: self.view.Width() - 20, height: 50)
        
        resetBtn.frame = CGRect(x: self.view.Width(), y: PeopleTextField.HY() + 15, width: halfScreen, height: 50)
        
        MoneyTextField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


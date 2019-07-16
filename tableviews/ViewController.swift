//
//  ViewController.swift
//  tableviews
//
//  Created by EndoTakashi on 2019/07/16.
//  Copyright © 2019 tak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate {

    @IBOutlet weak var textImput: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var totalCountLabel: UILabel!
    @IBOutlet weak var clearButton: UIBarButtonItem!
    
    var totalTax: Int = 0
    var totalCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textImput.delegate = self
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        if (self.textImput.isFirstResponder) {
            self.textImput.resignFirstResponder()
        }
    }
    
    @IBAction func clearButtonAction(_ sender: Any) {
        totalLabel.text = "0"
        textView.text = nil
        totalCountLabel.text = nil
        textImput.text = nil
        totalTax = 0
        totalCount = 0
    }
    
    @IBAction func plusAction(_ sender: Any) {
        if textImput.text != "" {
            calculation(plmui: "+")
        }
    }
    @IBAction func minusAction(_ sender: Any) {
        if textImput.text != "" {
            calculation(plmui: "-")
        }
    }
    
    func calculation(plmui: String) {
        textImput.resignFirstResponder()
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        //トータルカウント
        if plmui == "+" {
            totalCount = totalCount + 1
        } else {
            if totalCount > 1 {
                totalCount = totalCount - 1
            }
        }
        totalCountLabel.text = String(totalCount) + "点"
        if plmui == "+" {
            totalTax = totalTax + Int(textImput.text!)!
        } else {
            totalTax = totalTax - Int(textImput.text!)!
        }
        totalLabel.text = formatter.string(from: totalTax as NSNumber)
        // 一覧
        let imputText = Int(textImput.text!)!
        if plmui == "+" {
            textView.text = textView.text + "+" + formatter.string(from: imputText as NSNumber)! + "\r\n"
        } else {
            textView.text = textView.text + "-" + formatter.string(from: imputText as NSNumber)! + "\r\n"
        }
        // 入力エリアのクリア
        textImput.text = nil
    }
}


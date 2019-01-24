//
//  BaseViewController.swift
//  Project-Swift
//
//  Created by swp-song on 2019/1/24.
//  Copyright © 2019 swp-song. All rights reserved.
//

import UIKit

import SwpTextView

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension BaseViewController {
    
    func set_swpTextView(_ textView : SwpTextView, text : String, placeholder : String, delegate : SwpTextViewDelegate?) {
        textView
            .swp_borderWidth(1)
            .swp_cornerRadius(4)
            .swp_borderColor(color(0x522C79))
            .swp_text(text)
            .swp_placeholder(placeholder)
            .swp_textColor(color(0x508FF2))
            .swp_delegate(delegate)
            .swp_keyboardType(.default)
    }
    
    func color(_ hexValue : Int) -> UIColor {
        return UIColor(displayP3Red: CGFloat((hexValue & 0xFF0000) >> 16) / 255, green: CGFloat((hexValue & 0xFF00) >> 8) / 255, blue: CGFloat((hexValue & 0xFF) / 255), alpha: 1.0)
    }
}


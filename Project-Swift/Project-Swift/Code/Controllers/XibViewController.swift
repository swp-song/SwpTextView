//
//  ViewController1.swift
//  Project-Swift
//
//  Created by Dream on 2019/1/21.
//  Copyright © 2019 swp-song. All rights reserved.
//

import UIKit
import SwpTextView

class XibViewController: UIViewController, SwpTextViewDelegate {

    @IBOutlet private weak var textView: SwpTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.set_swpTextView(self.textView, text: "This is a xib.🤠🤠 ", placeholder: "Please enter 😄😆")
        self.textView.swp_textViewDidChangeEvent { (textView, text) in
            print("textViewDidChangeEvent, text = \(text)")
        }
    }
    
    deinit {
        print("Class = \(XibViewController.self), \(#function)")
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

extension XibViewController {
    
    func swp_textViewDidChange(_ textView: SwpTextView, text: String) {
        print("swpTextView, text = \(text)")
    }
}

extension XibViewController {
    
    private func set_swpTextView(_ textView : SwpTextView, text : String, placeholder : String) {
        textView
        .swp_borderWidth(1)
        .swp_cornerRadius(4)
        .swp_borderColor(color(0x522C79))
        .swp_text(text)
        .swp_placeholder(placeholder)
        .swp_textColor(color(0x508FF2))
        .swp_delegate(self)
        .swp_keyboardType(.default)
    }
    
    private func color(_ hexValue : Int) -> UIColor {
        return UIColor(displayP3Red: CGFloat((hexValue & 0xFF0000) >> 16) / 255, green: CGFloat((hexValue & 0xFF00) >> 8) / 255, blue: CGFloat((hexValue & 0xFF) / 255), alpha: 1.0)
    }
}

//
//  ViewController1.swift
//  Project-Swift
//
//  Created by swp-song on 2019/1/21.
//  Copyright © 2019 swp-song. All rights reserved.
//

import UIKit
import SwpTextView

class XibViewController: BaseViewController, SwpTextViewDelegate {

    @IBOutlet private weak var textView : SwpTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.set_swpTextView(self.textView, text: "This is a xib.🤠🤠 ", placeholder: "Please enter 😄😆", delegate: self)
        self.textView.swp_textViewDidChangeEvent { (textView, text) in
            print("swp_textViewDidChangeEvent, text = \(text)")
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
        print("swp_textViewDidChange, text = \(text)")
    }
}

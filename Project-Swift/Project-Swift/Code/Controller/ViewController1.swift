//
//  ViewController1.swift
//  Project-Swift
//
//  Created by Dream on 2019/1/21.
//  Copyright © 2019 swp-song. All rights reserved.
//

import UIKit
import SwpTextView

class ViewController1: UIViewController, SwpTextViewDelegate {

    @IBOutlet private weak var textView: SwpTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.textView.sDelegate = self

        self.textView.textViewDidChangeEvent { (textView, text) in
            print("textViewDidChangeEvent, text = \(text)")
        }
        
    }
    
    deinit {
        print(self.textView.sText)
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

extension ViewController1 {
    
    func swpTextView(_ textView: SwpTextView, text: String) {
        print("swpTextView, text = \(text)")
    }
}

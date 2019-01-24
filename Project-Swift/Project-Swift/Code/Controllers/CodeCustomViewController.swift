//
//  CodeCustomViewController.swift
//  Project-Swift
//
//  Created by swp-song on 2019/1/24.
//  Copyright © 2019 swp-song. All rights reserved.
//

import UIKit

import SnapKit
import SwpTextView

class CodeCustomViewController: BaseViewController, SwpTextViewDelegate {
    
    private lazy var textView : CustomTextView = {
        let textView : CustomTextView = CustomTextView()
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setUI()
        
        self.set_swpTextView(self.textView, text: "🤡🤡  O(∩_∩)O", placeholder: "Please enter 😄😆", delegate: self)
        
        self.textView.swp_textViewDidChangeEvent { (textView, text) in
            print("textViewDidChangeEvent, text = \(text)")
        }
        
    }
    
    deinit {
        print("Class = \(CodeCustomViewController.self), \(#function)")
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

extension CodeCustomViewController {
    func swp_textViewDidChange(_ textView: SwpTextView, text: String) {
        print("swp_textViewDidChange, text = \(text)")
    }
}

extension CodeCustomViewController {
    
    private func setUI() -> Void {
        self.view.addSubview(self.textView)
        
        self.textView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.left.right.equalTo(self.view).inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
            make.width.equalTo(self.textView.snp.height).multipliedBy(2.0)
        }
    }
}

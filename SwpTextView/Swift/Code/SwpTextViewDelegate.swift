//
//  SwpTextViewDelegate.swift
//  swp_song
//
//  Created by swp-song on 2019/1/21.
//  Copyright © 2019 swp-song. All rights reserved.
//

public protocol SwpTextViewDelegate: UITextViewDelegate {
    func swpTextView(_ textView : SwpTextView, text : String) -> Void
}

extension SwpTextViewDelegate {
    public func swpTextView(_ textView : SwpTextView, text : String) -> Void { }
}


//
//  SwpTextView.swift
//  swp_song
//
//  Created by swp-song on 2019/1/20.
//  Copyright © 2019 swp-song. All rights reserved.
//

import UIKit

open class SwpTextView: UITextView {
    
    // MARK: - Public Property
    public typealias SwpTextViewDidChangeEvent = (_ textView : SwpTextView, _ text : String) -> Void
    
    public var sText : String {
        return super.text
    }
    
    public weak var sDelegate : SwpTextViewDelegate? = nil;
    public var textViewDidChangeEvent : SwpTextViewDidChangeEvent? = nil
    
    // MARK: - Private Property
    private let aHiddenAnimationTime : TimeInterval   = 0.5
    private let kPlaceholderDefaultFontSize : CGFloat = 15.0
    
    private lazy var placeholderView : UILabel = {
        let label : UILabel = UILabel()
        label.text      = "placeholder"
        label.font      = UIFont.systemFont(ofSize: kPlaceholderDefaultFontSize)
        label.textColor = .lightGray
        return label;
    }()
    
    // MARK: - Override Function
    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.config()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.config()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.setUIFrame()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UITextView.textDidChangeNotification, object: self)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

// MARK: - Public Function
public extension SwpTextView {
    
    @discardableResult public func sDelegate(_ delete : SwpTextViewDelegate?) -> Self {
        sDelegate = delete
        return self
    }
    
    @discardableResult public func textViewDidChangeEvent(_ didChange : @escaping SwpTextViewDidChangeEvent) -> Self {
        self.textViewDidChangeEvent = didChange
        return self
    }
}


// MARK: - Private Set UI
private extension SwpTextView {
    
    private func config() -> Void {
        self.setUpUI()
        self.propertyConfig()
    }
    
    private func setUpUI() -> Void {
        self.addSubview(self.placeholderView)
    }
    
    private func setUIFrame() -> Void {
        let placeholderX : CGFloat = 8.0
        self.placeholderView.frame = CGRect(x: placeholderX, y: 3.0, width: self.frame.size.width - placeholderX * 2.0, height: 25.0)
    }
    
    private func propertyConfig() -> Void {
        self.font = UIFont.systemFont(ofSize: kPlaceholderDefaultFontSize)
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: UITextView.textDidChangeNotification, object: self)
    }
    
    @objc private func textDidChange(_ n : Notification) -> Void {
        let text : String = super.text
        self.textViewDidChangeEvent?(self, text)
        self.sDelegate?.swpTextView(self, text: text)
        self.showPlaceholder(text, animate: self.aHiddenAnimationTime)
    }
}


// MARK: - Placeholder Hidden & Dispaly Fuction
private extension SwpTextView {

    private func showPlaceholder(_ string : String, animate: TimeInterval) -> Void {
        if self.text.count == 0 {
            if string == "" {
                self.isPlaceholderHidden(true, animate: animate)
            } else {
                self.isPlaceholderHidden(false, animate: animate)
            }
            
        } else {
            
            if self.text.count == 1 {
                
                if text == "" {
                    self.isPlaceholderHidden(true, animate: animate)
                } else {
                    self.isPlaceholderHidden(false, animate: animate)
                }
                
            } else {
                self.isPlaceholderHidden(false, animate: animate)
            }
        }
    }
    
    private func isPlaceholderHidden(_ isHidden : Bool, animate: TimeInterval) {
        UIView.animate(withDuration: animate) { //[weak self] in
            self.placeholderView.alpha = !isHidden ? 0 : 1
        };
    }
}


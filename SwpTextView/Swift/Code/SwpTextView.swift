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
    
    public var swp_text : String {
        return super.text
    }
    
    public weak var swp_delegate : SwpTextViewDelegate? = nil;
    public var swp_textViewDidChangeEvent : SwpTextViewDidChangeEvent? = nil
    
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
        #if DEBUG
        print("Class = \(SwpTextView.self), \(#function)")
        #else
        #endif
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

// MARK: - Public SwpTextView Function
public extension SwpTextView {
    
    ///
    /// # set placeholder hidden
    ///
    /// - Parameters:
    ///   - isHidden:    isHidden
    ///   - animateTime: animateTime
    /// - Returns: SwpTextView
    @discardableResult public func swp_placeholderHidden(_ isHidden : Bool, animateTime : TimeInterval = 0.5) -> Self {
        self.isPlaceholderHidden(isHidden, animate: animateTime)
        return self
    }
    
    ///
    /// # set text
    ///
    /// - Parameter text: text
    /// - Returns: SwpTextView
    @discardableResult public func swp_text(_ text : String) -> Self {
        self.swp_placeholderHidden(true, animateTime: 0)
        self.text = text
        return self
    }
    
    
    ///
    /// set delegate
    ///
    /// - Parameter delete: delete
    /// - Returns: SwpTextView
    @discardableResult public func swp_delegate(_ delete : SwpTextViewDelegate?) -> Self {
        self.swp_delegate = delete
        return self
    }
    
    ///
    /// # did change block
    ///
    /// - Parameter didChangeEvent: didChangeEvent
    /// - Returns: SwpTextView
    @discardableResult public func swp_textViewDidChangeEvent(_ didChangeEvent : @escaping SwpTextViewDidChangeEvent) -> Self {
        self.swp_textViewDidChangeEvent = didChangeEvent
        return self
    }
}

// MARK: - Public Placeholder Function
extension SwpTextView {
    
    
    ///
    /// # set placeholder text
    ///
    /// - Parameter placeholder: placeholder
    /// - Returns: SwpTextView
    @discardableResult public func swp_placeholder(_ placeholder : String?) -> Self {
        self.placeholderView.text = placeholder
        return self
    }
    
    ///
    /// # set placeholder text font
    ///
    /// - Parameter font: font
    /// - Returns: SwpTextView
    @discardableResult public func swp_placeholderFont(_ font : UIFont) -> Self {
        self.placeholderView.font = font
        return self
    }
    
    ///
    /// # set placeholder text color
    ///
    /// - Parameter color: color
    /// - Returns: SwpTextView
    @discardableResult public func swp_placeholderColor(_ color : UIColor) -> Self {
        self.placeholderView.textColor = color
        return self
    }
}

// MARK: - Public UITextView Function
extension SwpTextView {
    
    ///
    /// # set backgroundColor
    ///
    /// - Parameter backgroundColor: backgroundColor
    /// - Returns: SwpTextView
    @discardableResult public func swp_backgroundColor(_ backgroundColor : UIColor?) -> Self {
        self.backgroundColor = backgroundColor;
        return self
    }
    
    ///
    /// # set text syestem font size
    ///
    /// - Parameter size: size
    /// - Returns: SwpTextView
    @discardableResult public func swp_systemFontSize(_ size : CGFloat = 15) -> Self {
        self.font = UIFont.systemFont(ofSize: size)
        return self
    }
    
    ///
    /// # set text font
    ///
    /// - Parameter font: font
    /// - Returns: SwpTextView
    @discardableResult public func swp_font(_ font : UIFont?) -> Self {
        self.font = font
        return self
    }
    
    ///
    /// # set text color
    ///
    /// - Parameter color: color
    /// - Returns: SwpTextView
    @discardableResult public func swp_textColor(_ color : UIColor?) -> Self {
        self.textColor = color
        return self
    }
    
    ///
    /// # set text keyboard type
    ///
    /// - Parameter keyboardType: keyboardType
    /// - Returns: SwpTextView
    @discardableResult public func swp_keyboardType(_ keyboardType : UIKeyboardType) -> Self {
        self.keyboardType = keyboardType
        return self
    }
}

// MARK: - Public Layer Function
extension SwpTextView {
    
    
    ///
    /// # set borderWidth
    ///
    /// - Parameter borderWidth: borderWidth
    /// - Returns: SwpTextView
    @discardableResult public func swp_borderWidth(_ borderWidth : CGFloat) -> Self {
        self.layer.borderWidth = borderWidth
        return self
    }
    
    ///
    /// # set cornerRadius
    ///
    /// - Parameter cornerRadius: cornerRadius
    /// - Returns: SwpTextView
    @discardableResult public func swp_cornerRadius(_ cornerRadius : CGFloat) -> Self {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        return self
    }
    
    ///
    /// # set borderColor
    ///
    /// - Parameter borderColor: borderColor
    /// - Returns: SwpTextView
    @discardableResult public func swp_borderColor(_ borderColor : UIColor) -> Self {
        self.layer.borderColor = borderColor.cgColor
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
    
    @objc private func textDidChange(_ notification : Notification) -> Void {
        let text : String = super.text
        self.swp_textViewDidChangeEvent?(self, text)
        self.swp_delegate?.swp_textViewDidChange(self, text: text)
        self.aPlaceholderHidden(text, animate: self.aHiddenAnimationTime)
    }
}


// MARK: - Placeholder Hidden & Dispaly Fuction
private extension SwpTextView {

    private func aPlaceholderHidden(_ string : String, animate: TimeInterval) -> Void {
        if self.text.count == 0 {
            if string == "" {
                self.isPlaceholderHidden(false, animate: animate)
            } else {
                self.isPlaceholderHidden(true, animate: animate)
            }
        } else {
            
            if self.text.count == 1 {
                if self.text == "" {
                    self.isPlaceholderHidden(false, animate: animate)
                } else {
                    self.isPlaceholderHidden(true, animate: animate)
                }
            } else {
                self.isPlaceholderHidden(true, animate: animate)
            }
        }
    }
    
    private func isPlaceholderHidden(_ isHidden : Bool, animate: TimeInterval) {
        UIView.animate(withDuration: animate) { //[weak self] in
            self.placeholderView.alpha = isHidden ? 0 : 1
        };
    }
}


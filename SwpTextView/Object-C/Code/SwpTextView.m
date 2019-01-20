//
//  SwpTextView.m
//  swp_song
//
//  Created by swp_song on 2018/1/18.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpTextView.h"

/* ---------------------- Tool       ---------------------- */
#import "SwpTextViewUtils.h"
/* ---------------------- Tool       ---------------------- */

static CGFloat const kSwpTextViewAcquiesceFontSize = 15.0f;

@interface SwpTextView ()

#pragma mark - UI   Propertys
/* ---------------------- UI   Property ---------------------- */
/* 显示 placeholder View */
@property (nonatomic, strong) UILabel *placeholderView;
/* ---------------------- UI   Property ---------------------- */
#pragma mark - Data Propertys
/* ---------------------- Data Property ---------------------- */
/* 动画时长 */
@property (nonatomic, assign) NSTimeInterval aHiddenAnimationTime;
/* Delegate */
@property (nonatomic, weak) id<SwpTextViewDelegate>aDelegate;
/* SwpTextView 回调方法，用户输入文字变化调用 */
@property (nonatomic, copy, setter = swpTextViewChange:) SwpTextViewTextChangeBlock swpTextViewChange;
/* ---------------------- Data Property ---------------------- */

@end

@implementation SwpTextView

/**
 *  @author swp_song
 *
 *  @brief  initWithFrame:textContainer:    ( Override Init )
 *
 *  @param  frame           frame
 *
 *  @param  textContainer   textContainer
 *
 *  @return UITextView
 */
- (instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer {
    if (self = [super initWithFrame:frame textContainer:textContainer]) {
        [self config];
    }
    return self;
}

/**
 *  @author swp_song
 *
 *  @brief  initWithCoder:  ( Override Init )
 *
 *  @param  aDecoder    aDecoder
 *
 *  @return UITextView
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self config];
    }
    return self;
}

/**
 *  @author swp_song
 *
 *  @brief  config  ( config )
 */
- (void)config {
    [self setProperty];
    [self setUpUI];
}

/**
 *  @author swp_song
 *
 *  @brief  layoutSubviews  ( Override layoutSubviews )
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    [self setUIFrame];
}

/**
 *  @author swp_song
 *
 *  @brief  dealloc (  )
 */
- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
    // 移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/*!
 *  @author swp_song
 *
 *  @brief  setupUI ( 添加控件 )
 */
- (void)setUpUI {
    [self addSubview:self.placeholderView];
}

/**
 *  @author swp_song
 *
 *  @brief  setProperty ( 设置属性 )
 */
- (void)setProperty {
    self.aHiddenAnimationTime = 0.5;
    self.font = [UIFont systemFontOfSize:kSwpTextViewAcquiesceFontSize];
    [self showPlaceholder:self.swpTextViewText == nil ? @"" : self.swpTextViewText animateDuration:self.aHiddenAnimationTime];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:self];
}


/**
 *  @author swp_song
 *
 *  @brief  setUIFrame  ( 设置 UI 控件的 frame )
 */
- (void)setUIFrame {
    CGFloat placeholderX = 8.0;
    self.placeholderView.frame = CGRectMake(placeholderX, 3, self.frame.size.width - placeholderX * 2.0, 25);
}


/**
 *  @author swp_song
 *
 *  @brief  textDidChange   ( 通知绑定方法 )
 *
 *  @param  notification    notification
 */
- (void)textDidChange:(NSNotification *)notification {
    _swpTextViewText = super.text;

    if (self.swpTextViewChange) self.swpTextViewChange(self, super.text);

    if ([self.aDelegate  respondsToSelector:@selector(swpTextView:changeText:)]) {
        [self.aDelegate swpTextView:self changeText:super.text];
    }

    [self showPlaceholder:super.text animateDuration:self.aHiddenAnimationTime];
}

/**
 *  @author swp_song
 *
 *  @brief  showPlaceholder:animateDuration:    ( 判断 Placeholder 显示，隐藏 )
 *
 *  @param  text    text
 */
- (void)showPlaceholder:(NSString *)text animateDuration:(NSTimeInterval)duration {
    //  Textview 长度为0
    if (self.text.length == 0) {
        
        //  判断是否为删除键
        if ([text isEqualToString:@""]) {
            
            [self swpTextViewPlaceholderDisplay:YES animateDuration:duration];
        } else {
            
            [self swpTextViewPlaceholderDisplay:NO animateDuration:duration];
            
        }
        
    } else {
        // Textview 长度不为 0
        if (self.text.length == 1) {
            //  Textview 长度为1时候
            if ([text isEqualToString:@""]) {
                
                //  判断是否为删除键
                [self swpTextViewPlaceholderDisplay:YES animateDuration:duration];
                
            } else {
                //  不是删除
                [self swpTextViewPlaceholderDisplay:NO animateDuration:duration];
            }
        } else {
            //  长度不为1时候
            [self swpTextViewPlaceholderDisplay:NO animateDuration:duration];
            
        }
    }
}


#pragma mark - Public Methods

/**
 *  @author swp_song
 *
 *  @brief  swpTextViewInfo ( SwpTextView 信息 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpTextViewInfo {
    return [SwpTextViewUtils swpTextViewUtilsGetInformation];
}

/**
 *  @author swp_song
 *
 *  @brief  swpTextViewVersion ( SwpTextView 版本信息 )
 *
 *  @return NSString
 */
+ (NSString *)swpTextViewVersion {
    return self.class.swpTextViewInfo[@"Version"];
}

/**
 *  @author swp_song
 *
 *  @brief  swpTextView ( 快速初始化 )
 *
 *  @return SwpTextView
 */
+ (instancetype)swpTextView {
    return [self.class new];
}

/**
 *  @author swp_song
 *
 *  @brief  swpTextViewInit ( 快速初始化 )
 */
+ (__kindof SwpTextView * (^)(void))swpTextViewInit {
    return ^(void) {
        return [self.class swpTextView];
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpText ( 设置显示文本 )
 */
- (__kindof SwpTextView * _Nonnull (^)(NSString * _Nonnull))swpText {
    return ^(NSString *text) {
        [self swpTextViewPlaceholderDisplay:NO animateDuration:0];
        self.text = text;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpTextViewPlaceholderDisplay:animateDuration:  ( 隐藏，显示 Placeholder  )
 *
 *  @param  isDisplay   isDisplay
 *
 *  @param  duration    duration
 */
- (void)swpTextViewPlaceholderDisplay:(BOOL)isDisplay animateDuration:(NSTimeInterval)duration {
    
    [UIView animateWithDuration:duration animations:^{
        self.placeholderView.alpha = isDisplay;
    }];
}


/**
 *  @author swp_song
 *
 *  @brief  swpTextViewDelegate ( 设置代理 )
 */
- (__kindof SwpTextView * _Nonnull (^)(id<SwpTextViewDelegate> _Nonnull))swpTextViewDelegate {
    
    return ^(id<SwpTextViewDelegate>delegate) {
        if (!delegate) return self;
        self.aDelegate = delegate;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  textSystemFontSize  ( 设置，输入文本字体大小，系统字体 )
 */
- (__kindof SwpTextView * _Nonnull (^)(CGFloat))textSystemFontSize {
    
    return ^(CGFloat size) {
        self.font = [UIFont systemFontOfSize:size];
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  textFontColor  ( 设置，输入文本字体颜色 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIColor * _Nonnull))textFontColor {
    
    return ^(UIColor *color) {
        self.textColor = color;
        return self;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  placeholder ( 设置 Placeholder )
 */
- (__kindof SwpTextView * _Nonnull (^)(NSString * _Nonnull))swpTextViewPlaceholder {
    return ^(NSString *placeholder) {
        self.placeholderView.text = placeholder;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  placeholderSystemFontSize   ( 设置，Placeholder 字体大小，系统字体 )
 */
- (__kindof SwpTextView * _Nonnull (^)(CGFloat))placeholderSystemFontSize {
    return ^(CGFloat size) {
        self.placeholderView.font = [UIFont systemFontOfSize:size];
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  placeholderFontColor  ( 设置，placeholder 字体颜色 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIColor * _Nonnull))placeholderFontColor {
 
    return ^(UIColor *color) {
        self.placeholderView.textColor = color;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  placeholderFont ( 设置，placeholder 字体 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIFont * _Nonnull))placeholderFont {
    return ^(UIFont *font) {
        self.placeholderView.font = font;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpViewKeyboardType ( 设置，键盘样式 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIKeyboardType))swpViewKeyboardType {
    
    return ^(UIKeyboardType keyboardType) {
        self.keyboardType = keyboardType;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  placeholderHiddenAnimationTime  ( 设置，placeholder 隐藏动画时长 )
 */
- (__kindof SwpTextView * _Nonnull (^)(NSTimeInterval))placeholderHiddenAnimationTime {
    return ^(NSTimeInterval time) {
        self.aHiddenAnimationTime = time;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  borderWidth ( 设置，显示边框宽度 )
 */
- (__kindof SwpTextView * _Nonnull (^)(CGFloat))borderWidth {
    
    return ^(CGFloat borderWidth) {
        if (!borderWidth) return self;
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  borderWidth ( 设置，显示边框圆角弧度 )
 */
- (__kindof SwpTextView * _Nonnull (^)(CGFloat))cornerRadius {
    return ^(CGFloat cornerRadius) {
        if (!cornerRadius) return self;
        self.layer.cornerRadius     = cornerRadius;
        self.layer.masksToBounds    = YES;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  borderColor ( 设置，显示边框颜色 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIColor * _Nonnull))borderColor {
    return ^(UIColor *borderColor) {
        if (!borderColor) return self;
        self.layer.borderColor = borderColor.CGColor;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpTextViewBackgroundColor  ( 设置，显示背景颜色 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIColor * _Nonnull))swpTextViewBackgroundColor {
    
    return ^(UIColor *backgroundColor) {
        if (!backgroundColor) return self;
        self.backgroundColor = backgroundColor;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpTextViewChange:  ( SwpTextView 回调方法，用户输入文字变化调用 )
 *
 *  @param  swpTextViewChange   swpTextViewChange
 */
- (void)swpTextViewChange:(SwpTextViewTextChangeBlock)swpTextViewChange {
    _swpTextViewChange = swpTextViewChange;
}


/**
 *  @author swp_song
 *
 *  @brief  swpTextViewChangeChain: ( SwpTextView 回调方法，用户输入文字变化调用 )
 */
- (__kindof SwpTextView * _Nonnull (^)(SwpTextViewTextChangeBlock _Nonnull))swpTextViewChangeChain {
    
    return ^(SwpTextViewTextChangeBlock swpTextViewChange) {
        [self swpTextViewChange:swpTextViewChange];
        return self;
    };
}


#pragma mark - Init UI Methods
- (UILabel *)placeholderView {
    
    return !_placeholderView ? _placeholderView = ({
        UILabel *label = [UILabel new];
        label.text      = @"placeholder";
        label.font      = [UIFont systemFontOfSize:kSwpTextViewAcquiesceFontSize];
        label.textColor = [UIColor lightGrayColor];
        label;
    }) : _placeholderView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

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

/* SwpTextView 回调方法，用户输入文字变化调用 */
@property (nonatomic, copy, setter = swp_textViewChangeEvent:) SwpTextViewTextChangeBlock swp_textViewChangeEvent;
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
    
   
    
#if DEBUG
    NSLog(@"%@ - %s - dealloc", self.class, __FUNCTION__);
#else
    
#endif
    
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
    [self aPlaceholder:self.swp_Text == nil ? @"" : self.swp_Text animate:self.aHiddenAnimationTime];
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
    _swp_Text = super.text;

    if (self.swp_textViewChangeEvent) self.swp_textViewChangeEvent(self, super.text);

    if ([self.swp_Delegate  respondsToSelector:@selector(swp_textView:changeText:)]) {
        [self.swp_Delegate swp_textView:self changeText:super.text];
    }

    [self aPlaceholder:super.text animate:self.aHiddenAnimationTime];
}

/**
 *  @author swp_song
 *
 *  @brief  showPlaceholder:animateDuration:    ( 判断 Placeholder 显示，隐藏 )
 *
 *  @param  text    text
 */
- (void)aPlaceholder:(NSString *)text animate:(NSTimeInterval)animate {
    //  Textview 长度为0
    if (self.text.length == 0) {
        
        //  判断是否为删除键
        if ([text isEqualToString:@""]) {
            [self swp_placeholderHidden:NO duration:animate];
        } else {
            [self swp_placeholderHidden:YES duration:animate];
        }
        
    } else {
        // Textview 长度不为 0
        if (self.text.length == 1) {
            //  Textview 长度为1时候
            if ([text isEqualToString:@""]) {
                //  判断是否为删除键
                [self swp_placeholderHidden:NO duration:animate];
                
            } else {
                //  不是删除
               [self swp_placeholderHidden:YES duration:animate];
            }
        } else {
            //  长度不为1时候
            [self swp_placeholderHidden:YES duration:animate];
            
        }
    }
}

#pragma mark - Public Methods

/**
 *  @author swp_song
 *
 *  @brief  swp_info ( SwpTextView 信息 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swp_info {
    return [SwpTextViewUtils swpTextViewUtilsGetInformation];
}

/**
 *  @author swp_song
 *
 *  @brief  swp_version ( SwpTextView 版本信息 )
 *
 *  @return NSString
 */
+ (NSString *)swp_version {
    return self.class.swp_info[@"Version"];
}

/**
 *  @author swp_song
 *
 *  @brief  swp_init ( 快速初始化 )
 *
 *  @return SwpTextView
 */
+ (instancetype)swp_textView {
    return [self.class new];
}

/**
 *  @author swp_song
 *
 *  @brief  swp_init ( 快速初始化 )
 */
+ (__kindof SwpTextView * (^)(void))swp_init {
    return ^(void) {
        return [self.class swp_textView];
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpText ( 设置显示文本 )
 */
- (__kindof SwpTextView * _Nonnull (^)(NSString * _Nonnull))swp_text {
    return ^(NSString *text) {
        [self swp_placeholderHidden:YES duration:0];
        self.text = text;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swp_placeholderHidden:duration: ( 隐藏，显示 Placeholder  )
 *
 *  @param  isDisplay   isDisplay
 *
 *  @param  duration    duration
 */
- (void)swp_placeholderHidden:(BOOL)isHidden duration:(NSTimeInterval)duration {
    [UIView animateWithDuration:duration animations:^{
        self.placeholderView.alpha = !isHidden;
    }];
}

/**
 *  @author swp_song
 *
 *  @brief  swp_delegate ( 设置代理 )
 */
- (__kindof SwpTextView * _Nonnull (^)(id<SwpTextViewDelegate> _Nonnull))swp_delegate {
    
    return ^(id<SwpTextViewDelegate>delegate) {
        if (!delegate) return self;
        self.swp_Delegate = delegate;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swp_systemFontSize  ( 设置，输入文本字体大小，系统字体 )
 */
- (__kindof SwpTextView * _Nonnull (^)(CGFloat))swp_systemFontSize {
    
    return ^(CGFloat size) {
        self.font = [UIFont systemFontOfSize:size];
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swp_textColor  ( 设置，输入文本字体颜色 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIColor * _Nonnull))swp_textColor {
    
    return ^(UIColor *color) {
        self.textColor = color;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swp_font  ( 设置，输入文本字体 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIFont * _Nonnull))swp_font {
    
    return ^(UIFont *font) {
        self.font = font;
        return self;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swp_placeholder ( 设置 Placeholder )
 */
- (__kindof SwpTextView * _Nonnull (^)(NSString * _Nonnull))swp_placeholder {
    return ^(NSString *placeholder) {
        self.placeholderView.text = placeholder;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swp_placeholderColor  ( 设置，placeholder 字体颜色 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIColor * _Nonnull))swp_placeholderColor {
 
    return ^(UIColor *color) {
        self.placeholderView.textColor = color;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swp_placeholderFont ( 设置，placeholder 字体 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIFont * _Nonnull))swp_placeholderFont {
    return ^(UIFont *font) {
        self.placeholderView.font = font;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swp_keyboardType    ( 设置，键盘样式 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIKeyboardType))swp_keyboardType {
    
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
- (__kindof SwpTextView * _Nonnull (^)(CGFloat))swp_borderWidth {
    
    return ^(CGFloat borderWidth) {
        if (!borderWidth) return self;
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  cornerRadius ( 设置，显示边框圆角弧度 )
 */
- (__kindof SwpTextView * _Nonnull (^)(CGFloat))swp_cornerRadius {
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
 *  @brief  swp_borderColor ( 设置，显示边框颜色 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIColor * _Nonnull))swp_borderColor {
    return ^(UIColor *borderColor) {
        if (!borderColor) return self;
        self.layer.borderColor = borderColor.CGColor;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swp_backgroundColor ( 设置，显示背景颜色 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIColor * _Nonnull))swp_backgroundColor {
    return ^(UIColor *backgroundColor) {
        if (!backgroundColor) return self;
        self.backgroundColor = backgroundColor;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swp_textViewChangeEvent:  ( SwpTextView 回调方法，用户输入文字变化调用 )
 *
 *  @param  changeEvent changeEvent
 */
- (void)swp_textViewChangeEvent:(SwpTextViewTextChangeBlock)changeEvent {
    _swp_textViewChangeEvent = changeEvent;
}

/**
 *  @author swp_song
 *
 *  @brief  swp_textViewChangeEventChain:   ( SwpTextView 回调方法，用户输入文字变化调用 )
 */
- (__kindof SwpTextView * _Nonnull (^)(SwpTextViewTextChangeBlock _Nonnull))swp_textViewChangeEventChain {
    
    return ^(SwpTextViewTextChangeBlock changeEvent) {
        [self swp_textViewChangeEvent:changeEvent];
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

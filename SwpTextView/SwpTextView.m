//
//  SwpTextView.m
//  swp_song
//
//  Created by swp_song on 16/1/31.
//  Copyright © 2016年 swp_song. All rights reserved.
//
//  @author --->    swp_song    ( SwpTextView 自带 Placeholder )

#import "SwpTextView.h"


static CGFloat const kSwpTextViewAcquiesceFontSize        = 15.0f;

@interface SwpTextView ()

#pragma mark - UI   Propertys
/*! ---------------------- UI   Property  ---------------------- !*/
/*! 显示 placeholder View !*/
@property (nonatomic, strong) UILabel *swpPlaceholderView;
/*! ---------------------- UI   Property  ---------------------- !*/
#pragma mark - Data Propertys
/*! ---------------------- Data Property  ---------------------- !*/
/*! 用户输入数据回调      !*/
@property (nonatomic, copy, setter = swpTextViewChangeText:) SwpTextViewTextChangeHeadle swpTextViewTextChangeHeadle;
/*! ---------------------- Data Property  ---------------------- !*/

@end

@implementation SwpTextView

/*!
 *  @author swp_song
 *
 *  @brief  initWithFrame:  (Override initWithFrame)
 *
 *  @param  frame
 *
 *  @return SwpTextView
 */
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self settingSwpTextViewProperty];
        [self setUpUI];
        
    }
    return self;
}

/*!
 *  @author swp_song
 *
 *  @brief  layoutSubviews ( Override layoutSubviews )
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    [self settingUIFrame];
}
/*!
 *  @author swp_song
 *
 *  @brief  当前 控制器 被销毁时 调用
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
    [self addSubview:self.swpPlaceholderView];
}

/*!
 *  @author swp_song
 *
 *  @brief  settingSwpTextViewProperty  ( 设置 swpTextView 属性 )
 */
- (void)settingSwpTextViewProperty {
    
    self.swpTextViewHiddenAnimationTime = 0.5;
    self.font = [UIFont systemFontOfSize:kSwpTextViewAcquiesceFontSize];
    [self showPlaceholderWithText:self.swpTextViewText == nil ? @"" : self.swpTextViewText animateDuration:self.swpTextViewHiddenAnimationTime];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:self];
}


/*!
 *  @author swp_song
 *
 *  @brief  settingUIFrame  ( 设置 UI 控件 的 frame )
 */
- (void)settingUIFrame {
    CGFloat placeholderX          = 8.0;
    self.swpPlaceholderView.frame = CGRectMake(placeholderX, 3, self.frame.size.width - placeholderX * 2.0, 25);
}


/*!
 *  @author swp_song
 *
 *  @brief  textDidChange   ( 通知 绑定方法 )
 *
 *  @param  notification
 */
- (void)textDidChange:(NSNotification *)notification {
    _swpTextViewText = super.text;
    
    if (self.swpTextViewTextChangeHeadle) self.swpTextViewTextChangeHeadle(self, super.text);
    
    if ([self.swpTextViewDelegate  respondsToSelector:@selector(swpTextView:changeText:)]) {
        [self.swpTextViewDelegate swpTextView:self changeText:super.text];
    }
    
    [self showPlaceholderWithText:super.text animateDuration:self.swpTextViewHiddenAnimationTime];
}

/*!
 *  @author swp_song
 *
 *  @brief  showPlaceholderWithText ( 判断 文字 显示 | 隐藏 )
 *
 *  @param  text
 */
- (void)showPlaceholderWithText:(NSString *)text animateDuration:(SwpTimeInterval)duration {
    //textview长度为0
    if (self.text.length == 0) {
        //判断是否为删除键
        if ([text isEqualToString:@""]) {
            [self swpPlaceholderViewDisplay:YES animateDuration:duration];
        } else {
            [self swpPlaceholderViewDisplay:NO animateDuration:duration];
        }
    } else {
        //textview长度不为0
        if (self.text.length == 1) {
            //textview长度为1时候
            if ([text isEqualToString:@""]) {
                //判断是否为删除键
                [self swpPlaceholderViewDisplay:YES animateDuration:duration];
            } else {
                //不是删除
                [self swpPlaceholderViewDisplay:NO animateDuration:duration];
            }
        } else {
            //长度不为1时候
            [self swpPlaceholderViewDisplay:NO animateDuration:duration];
        }
    }
}

/*!
 *  @author swp_song, 2016-02-01 11:19:02
 *
 *  @brief  swpPlaceholderViewDisplay   ( 是否显示 swpPlaceholderView )
 *
 *  @param  isDisplay
 *
 *  @param  duration
 */
- (void)swpPlaceholderViewDisplay:(BOOL)isDisplay animateDuration:(SwpTimeInterval)duration {
    [UIView animateWithDuration:duration animations:^{
        self.swpPlaceholderView.alpha = isDisplay;
    }];
}


#pragma mark - Setting Property Public Methods
/*!
 *  @author swp_song
 *
 *  @brief  swpTextViewSetText  ( 设置 swpTextView 显示文字 )
 *
 *  @param  swpTextViewText
 */
- (void)swpTextViewSetText:(NSString *)swpTextViewText {
    self.text = swpTextViewText;
}

/*!
 *  @author swp_song
 *
 *  @brief  setSwpTextViewPlaceholder   ( 设置 swpTextView 显示 placeholder )
 *
 *  @param  swpTextViewPlaceholder
 */
- (void)setSwpTextViewPlaceholder:(NSString *)swpTextViewPlaceholder {
    _swpTextViewPlaceholder      = swpTextViewPlaceholder;
    self.swpPlaceholderView.text = _swpTextViewPlaceholder;
}

/*!
 *  @author swp_song
 *
 *  @brief  setSwpTextViewTextFontSzie  ( 设置 swpTextView 字体大小 )
 *
 *  @param  swpTextViewTextFontSize
 */
- (void)setSwpTextViewTextFontSize:(CGFloat)swpTextViewTextFontSize {
    _swpTextViewTextFontSize = swpTextViewTextFontSize;
    self.font                = [UIFont systemFontOfSize:_swpTextViewTextFontSize];
}

/*!
 *  @author swp_song
 *
 *  @brief  setSwpTextViewPlaceholderFontSize   ( 设置 swpTextView placeholder 字体大小 )
 *
 *  @param  swpTextViewPlaceholderFontSize
 */
- (void)setSwpTextViewPlaceholderFontSize:(CGFloat)swpTextViewPlaceholderFontSize {
    _swpTextViewPlaceholderFontSize = swpTextViewPlaceholderFontSize;
    self.swpPlaceholderView.font    = [UIFont systemFontOfSize:_swpTextViewPlaceholderFontSize];
}

/*!
 *  @author swp_song
 *
 *  @brief  swpTextViewTextFontSize:swpTextViewPlaceholderFontSize: ( 设置 swpTextView 文字 and placeholder 字体大小 )
 *
 *  @param  textFontSize
 *
 *  @param  placeholderFontSize
 */
- (void)swpTextViewTextFontSize:(CGFloat)textFontSize swpTextViewPlaceholderFontSize:(CGFloat)placeholderFontSize {
    self.font                    = [UIFont systemFontOfSize:textFontSize];
    self.swpPlaceholderView.font = [UIFont systemFontOfSize:placeholderFontSize];
}

/*!
 *  @author swp_song
 *
 *  @brief  setSwpTextViewTextFontColor ( 设置 swpTextView 字体颜色 )
 *
 *  @param  swpTextViewTextFontColor
 */
- (void)setSwpTextViewTextFontColor:(UIColor *)swpTextViewTextFontColor {
    _swpTextViewTextFontColor = swpTextViewTextFontColor;
    self.textColor            = _swpTextViewTextFontColor;
}

/*!
 *  @author swp_song
 *
 *  @brief  setSwpTextViewPlaceholderFontColor  ( 设置 swpTextView placeholder 字体颜色 )
 *
 *  @param  swpTextViewPlaceholderFontColor
 */
- (void)setSwpTextViewPlaceholderFontColor:(UIColor *)swpTextViewPlaceholderFontColor {
    _swpTextViewPlaceholderFontColor  = swpTextViewPlaceholderFontColor;
    self.swpPlaceholderView.textColor = _swpTextViewPlaceholderFontColor;
}

/*!
 *  @author swp_song
 *
 *  @brief  swpTextViewTextFontColor:swpTextViewPlaceholderFontColor: ( 设置 swpTextView 文字 and placeholder 字体颜色 )
 *
 *  @param  textFontColor
 *
 *  @param  placeholderFontColor
 */
- (void)swpTextViewTextFontColor:(UIColor *)textFontColor swpTextViewPlaceholderFontColor:(UIColor *)placeholderFontColor {
    self.textColor                    = textFontColor;
    self.swpPlaceholderView.textColor = placeholderFontColor;
}

/*!
 *  @author swp_song
 *
 *  @brief  swpTextViewChangeText           ( 用户输入数据回调 )
 *
 *  @param  swpTextViewTextChangeHeadle
 */
- (void)swpTextViewChangeText:(SwpTextViewTextChangeHeadle)swpTextViewTextChangeHeadle {
    _swpTextViewTextChangeHeadle = swpTextViewTextChangeHeadle;
}

/*!
 *  @author swp_song
 *
 *  @brief  setSwpTextViewHiddenAnimationTime:  ( 设置 swpTextView placeholder 隐藏动画时间 )
 *
 *  @param  swpTextViewHiddenAnimationTime
 */
- (void)setSwpTextViewHiddenAnimationTime:(SwpTimeInterval)swpTextViewHiddenAnimationTime {
    _swpTextViewHiddenAnimationTime = swpTextViewHiddenAnimationTime;
}

/*!
 *  @author swp_song
 *
 *  @brief  swpTextSetText: ( 设置 swpText 文字 )
 *
 *  @param  swpText
 */
- (void)swpTextSetText:(NSString *)swpText  {
    [self showPlaceholderWithText:swpText animateDuration:0];
    self.text = swpText;
}

#pragma mark - Init UI Methods
- (UILabel *)swpPlaceholderView {
    if (!_swpPlaceholderView) {
        _swpPlaceholderView           = [[UILabel alloc] init];
        _swpPlaceholderView.text      = @"placeholder";
        _swpPlaceholderView.font      = [UIFont systemFontOfSize:kSwpTextViewAcquiesceFontSize];
        _swpPlaceholderView.textColor = [UIColor lightGrayColor];
    }
    return _swpPlaceholderView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

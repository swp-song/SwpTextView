//
//  SwpTextView.h
//  swp_song
//
//  Created by swp_song on 2018/1/18.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>


@class SwpTextView;

NS_ASSUME_NONNULL_BEGIN


/* SwpTextViewTextChange Block */
typedef void(^SwpTextViewTextChangeBlock)(SwpTextView * _Nonnull swpTextView, NSString * _Nonnull changeText);

@protocol SwpTextViewDelegate <NSObject>

@optional
/**
 *  @author swp_song
 *
 *  @brief  swpTextView:changeText: ( SwpTextView 代理方法，用户输入文字变化调用 )
 *
 *  @param  swpTextView swpTextView
 *
 *  @param  changeText  changeText
 */
- (void)swpTextView:(SwpTextView *)swpTextView changeText:(NSString *)changeText;

@end

@interface SwpTextView : UITextView


/* 设置 swpTextView  显示的数据, 取出显示的数据 */
@property (nonatomic, copy, readonly) NSString *swpTextViewText;

/**
 *  @author swp_song
 *
 *  @brief  swpTextView ( 快速初始化 )
 *
 *  @return SwpTextView
 */
+ (instancetype)swpTextView;

/**
 *  @author swp_song
 *
 *  @brief  swpTextViewInit ( 快速初始化 )
 */
+ (SwpTextView * (^)(void))swpTextViewInit;

/**
 *  @author swp_song
 *
 *  @brief  swpText ( 设置显示文本 )
 */
- (SwpTextView * _Nonnull (^)(NSString * _Nonnull))swpText;

/**
 *  @author swp_song
 *
 *  @brief  swpTextViewDelegate ( 设置代理 )
 */
- (SwpTextView * _Nonnull (^)(id<SwpTextViewDelegate> _Nonnull))swpTextViewDelegate;

/**
 *  @author swp_song
 *
 *  @brief  swpTextViewPlaceholderDisplay:animateDuration:  ( 隐藏，显示 Placeholder  )
 *
 *  @param  isDisplay   isDisplay
 *
 *  @param  duration    duration
 */
- (void)swpTextViewPlaceholderDisplay:(BOOL)isDisplay animateDuration:(NSTimeInterval)duration;

/**
 *  @author swp_song
 *
 *  @brief  textSystemFontSize  ( 设置，输入文本字体大小，系统字体 )
 */
- (SwpTextView * _Nonnull (^)(CGFloat))textSystemFontSize;

/**
 *  @author swp_song
 *
 *  @brief  textFontColor  ( 设置，输入文本字体颜色 )
 */
- (SwpTextView * _Nonnull (^)(UIColor * _Nonnull))textFontColor;

/**
 *  @author swp_song
 *
 *  @brief  placeholder ( 设置 Placeholder 显示文字 )
 */
- (SwpTextView * _Nonnull (^)(NSString * _Nonnull))swpTextViewPlaceholder;

/**
 *  @author swp_song
 *
 *  @brief  placeholderSystemFontSize   ( 设置，Placeholder 字体大小，系统字体 )
 */
- (SwpTextView * _Nonnull (^)(CGFloat))placeholderSystemFontSize;


/**
 *  @author swp_song
 *
 *  @brief  placeholderFontColor  ( 设置，placeholder 字体颜色 )
 */
- (SwpTextView * _Nonnull (^)(UIColor * _Nonnull))placeholderFontColor;

/**
 *  @author swp_song
 *
 *  @brief  placeholderFont ( 设置，placeholder 字体 )
 */
- (SwpTextView * _Nonnull (^)(UIFont * _Nonnull))placeholderFont;


/**
 *  @author swp_song
 *
 *  @brief  swpViewKeyboardType ( 设置，键盘样式 )
 */
- (SwpTextView * _Nonnull (^)(UIKeyboardType))swpViewKeyboardType;

/**
 *  @author swp_song
 *
 *  @brief  placeholderHiddenAnimationTime  ( 设置，placeholder 隐藏动画时长 )
 */
- (SwpTextView * _Nonnull (^)(NSTimeInterval))placeholderHiddenAnimationTime;


/**
 *  @author swp_song
 *
 *  @brief  borderWidth ( 设置，显示边框宽度 )
 */
- (SwpTextView * _Nonnull (^)(CGFloat))borderWidth;

/**
 *  @author swp_song
 *
 *  @brief  borderWidth ( 设置，显示边框圆角弧度 )
 */
- (SwpTextView * _Nonnull (^)(CGFloat))cornerRadius;

/**
 *  @author swp_song
 *
 *  @brief  borderColor ( 设置，显示边框颜色 )
 */
- (SwpTextView * _Nonnull (^)(UIColor *))borderColor;

/**
 *  @author swp_song
 *
 *  @brief  swpTextViewBackgroundColor  ( 设置，显示背景颜色 )
 */
- (SwpTextView * _Nonnull (^)(UIColor *))swpTextViewBackgroundColor;

/**
 *  @author swp_song
 *
 *  @brief  swpTextViewChange:  ( SwpTextView 回调方法，用户输入文字变化调用 )
 *
 *  @param  swpTextViewChange   swpTextViewChange
 */
- (void)swpTextViewChange:(SwpTextViewTextChangeBlock _Nullable)swpTextViewChange;

/**
 *  @author swp_song
 *
 *  @brief  swpTextViewChangeChain: ( SwpTextView 回调方法，用户输入文字变化调用 )
 */
- (SwpTextView * _Nonnull (^)(SwpTextViewTextChangeBlock _Nullable))swpTextViewChangeChain;


@end
NS_ASSUME_NONNULL_END

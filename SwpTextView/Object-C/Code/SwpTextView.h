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
typedef void(^SwpTextViewTextChangeBlock)(SwpTextView * _Nonnull textView, NSString * _Nonnull text);

@protocol SwpTextViewDelegate <NSObject>

@optional
/**
 *  @author swp_song
 *
 *  @brief  swp_textView:text: ( SwpTextView 代理方法，用户输入文字变化调用 )
 *
 *  @param  textView textView
 *
 *  @param  text     text
 */
- (void)swp_textView:(SwpTextView *)textView changeText:(NSString *)text;

@end

@interface SwpTextView : UITextView

/* Delegate */
@property (nonatomic, weak) id<SwpTextViewDelegate>swp_Delegate;

/* 设置 swpTextView  显示的数据, 取出显示的数据 */
@property (nonatomic, copy, readonly) NSString *swp_Text;


/**
 *  @author swp_song
 *
 *  @brief  swp_info ( SwpTextView 信息 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swp_info;

/**
 *  @author swp_song
 *
 *  @brief  swp_version ( SwpTextView 版本信息 )
 *
 *  @return NSString
 */
+ (NSString *)swp_version;


/**
 *  @author swp_song
 *
 *  @brief  swp_textView ( 快速初始化 )
 *
 *  @return SwpTextView
 */
+ (instancetype)swp_textView;

/**
 *  @author swp_song
 *
 *  @brief  swp_init ( 快速初始化 )
 */
+ (__kindof SwpTextView * (^)(void))swp_init;

/**
 *  @author swp_song
 *
 *  @brief  swp_text ( 设置显示文本 )
 */
- (__kindof SwpTextView * _Nonnull (^)(NSString * _Nonnull))swp_text;

/**
 *  @author swp_song
 *
 *  @brief  swp_delegate ( 设置代理 )
 */
- (__kindof SwpTextView * _Nonnull (^)(id<SwpTextViewDelegate> _Nonnull))swp_delegate;

/**
 *  @author swp_song
 *
 *  @brief  swp_placeholderHidden:duration: ( 隐藏，显示 Placeholder  )
 *
 *  @param  isHidden    isHidden
 *
 *  @param  duration    duration
 */
- (void)swp_placeholderHidden:(BOOL)isHidden duration:(NSTimeInterval)duration;

/**
 *  @author swp_song
 *
 *  @brief  swp_systemFontSize  ( 设置，输入文本字体大小，系统字体 )
 */
- (__kindof SwpTextView * _Nonnull (^)(CGFloat))swp_systemFontSize;

/**
 *  @author swp_song
 *
 *  @brief  swp_font  ( 设置，输入文本字体 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIFont * _Nonnull))swp_font;

/**
 *  @author swp_song
 *
 *  @brief  swp_textColor  ( 设置，输入文本字体颜色 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIColor * _Nonnull))swp_textColor;

/**
 *  @author swp_song
 *
 *  @brief  swp_placeholder ( 设置 Placeholder )
 */
- (__kindof SwpTextView * _Nonnull (^)(NSString * _Nonnull))swp_placeholder;

/**
 *  @author swp_song
 *
 *  @brief  swp_placeholderColor  ( 设置，placeholder 字体颜色 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIColor * _Nonnull))swp_placeholderColor;

/**
 *  @author swp_song
 *
 *  @brief  swp_placeholderFont ( 设置，placeholder 字体 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIFont * _Nonnull))swp_placeholderFont;

/**
 *  @author swp_song
 *
 *  @brief  swp_keyboardType    ( 设置，键盘样式 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIKeyboardType))swp_keyboardType;

/**
 *  @author swp_song
 *
 *  @brief  placeholderHiddenAnimationTime  ( 设置，placeholder 隐藏动画时长 )
 */
- (__kindof SwpTextView * _Nonnull (^)(NSTimeInterval))placeholderHiddenAnimationTime;

/**
 *  @author swp_song
 *
 *  @brief  borderWidth ( 设置，显示边框宽度 )
 */
- (__kindof SwpTextView * _Nonnull (^)(CGFloat))swp_borderWidth;

/**
 *  @author swp_song
 *
 *  @brief  swp_cornerRadius ( 设置，显示边框圆角弧度 )
 */
- (__kindof SwpTextView * _Nonnull (^)(CGFloat))swp_cornerRadius;

/**
 *  @author swp_song
 *
 *  @brief  swp_borderColor ( 设置，显示边框颜色 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIColor * _Nonnull))swp_borderColor;

/**
 *  @author swp_song
 *
 *  @brief  swp_backgroundColor ( 设置，显示背景颜色 )
 */
- (__kindof SwpTextView * _Nonnull (^)(UIColor * _Nonnull))swp_backgroundColor;

/**
 *  @author swp_song
 *
 *  @brief  swp_textViewChangeEvent:  ( SwpTextView 回调方法，用户输入文字变化调用 )
 *
 *  @param  changeEvent changeEvent
 */
- (void)swp_textViewChangeEvent:(SwpTextViewTextChangeBlock)changeEvent;

/**
 *  @author swp_song
 *
 *  @brief  swp_textViewChangeEventChain:   ( SwpTextView 回调方法，用户输入文字变化调用 )
 */
- (__kindof SwpTextView * _Nonnull (^)(SwpTextViewTextChangeBlock _Nonnull))swp_textViewChangeEventChain;

@end
NS_ASSUME_NONNULL_END

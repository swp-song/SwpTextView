//
//  SwpTextView.h
//  swp_song
//
//  Created by swp_song on 16/1/31.
//  Copyright © 2016年 swp_song. All rights reserved.
//
//  @author --->    swp_song    ( SwpTextView 自带 Placeholder )

#import <UIKit/UIKit.h>

@class SwpTextView;

NS_ASSUME_NONNULL_BEGIN

typedef double SwpTimeInterval;

/*! SwpTextViewTextChangeHeadle Block !*/
typedef void(^SwpTextViewTextChangeHeadle)(SwpTextView *swpTextView, NSString *changeText);

@protocol SwpTextViewDelegate <NSObject>

@optional
/*!
 *  @author swp_song
 *
 *  @brief  swpTextView:changeText:     ( swpTextView 代理方法 用户输入文字变化调用 )
 *
 *  @param  swpTextView
 *
 *  @param  changeText
 */
- (void)swpTextView:(SwpTextView *)swpTextView changeText:(NSString *)changeText;

@end

@interface SwpTextView : UITextView

/*! 设置 swpTextView  显示的数据, 取出显示的数据 !*/
@property (nonatomic, copy, readonly) NSString *swpTextViewText;
/*! 设置 swpTextView  placeholder  显示文字      !*/
@property (nonatomic, copy  ) NSString *swpTextViewPlaceholder;
/*! 设置 swpTextView 文字大小                    !*/
@property (nonatomic, assign) CGFloat  swpTextViewTextFontSize;
/*! 设置 swpTextView placeholder 文字的大小      !*/
@property (nonatomic, assign) CGFloat  swpTextViewPlaceholderFontSize;
/*! 设置 swpTextView 文字颜色                    !*/
@property (nonatomic, strong) UIColor  *swpTextViewTextFontColor;
/*! 设置 swpTextView placeholder 文字颜色        !*/
@property (nonatomic, strong) UIColor  *swpTextViewPlaceholderFontColor;
/*! 设置 swpTextView placeholder 隐藏动画时间    !*/
@property (nonatomic, assign) SwpTimeInterval swpTextViewHiddenAnimationTime;
/*! 设置 swpTextView Delegate                    !*/
@property (nonatomic, weak) id<SwpTextViewDelegate>swpTextViewDelegate;



/*!
 *  @author swp_song
 *
 *  @brief  swpTextViewSetText  ( 设置 swpTextView 显示文字 )
 *
 *  @param  swpTextViewText
 */
- (void)swpTextViewSetText:(NSString *)swpTextViewText;

/*!
 *  @author swp_song
 *
 *  @brief  swpPlaceholderViewDisplay   ( 是否显示 swpPlaceholderView )
 *
 *  @param  isDisplay
 *
 *  @param  duration
 */
- (void)swpPlaceholderViewDisplay:(BOOL)isDisplay animateDuration:(SwpTimeInterval)duration;

/*!
 *  @author swp_song
 *
 *  @brief  setSwpTextViewPlaceholder   ( 设置 swpTextView 显示 placeholder )
 *
 *  @param  swpTextViewPlaceholder
 */
- (void)setSwpTextViewPlaceholder:(NSString *)swpTextViewPlaceholder;

/*!
 *  @author swp_song
 *
 *  @brief  setSwpTextViewTextFontSzie  ( 设置 swpTextView 字体大小 )
 *
 *  @param  swpTextViewTextFontSize
 */
- (void)setSwpTextViewTextFontSize:(CGFloat)swpTextViewTextFontSize;

/*!
 *  @author swp_song
 *
 *  @brief  setSwpTextViewPlaceholderFontSize   ( 设置 swpTextView placeholder 字体大小 )
 *
 *  @param  swpTextViewPlaceholderFontSize
 */
- (void)setSwpTextViewPlaceholderFontSize:(CGFloat)swpTextViewPlaceholderFontSize;

/*!
 *  @author swp_song
 *
 *  @brief  swpTextViewTextFontSize:swpTextViewPlaceholderFontSize: ( 设置 swpTextView 文字 and placeholder 字体大小 )
 *
 *  @param  textFontSize
 *
 *  @param  placeholderFontSize
 */
- (void)swpTextViewTextFontSize:(CGFloat)textFontSize swpTextViewPlaceholderFontSize:(CGFloat)placeholderFontSize;

/*!
 *  @author swp_song
 *
 *  @brief  setSwpTextViewTextFontColor ( 设置 swpTextView 字体颜色 )
 *
 *  @param  swpTextViewTextFontColor
 */
- (void)setSwpTextViewTextFontColor:(UIColor *)swpTextViewTextFontColor;

/*!
 *  @author swp_song
 *
 *  @brief  setSwpTextViewPlaceholderFontColor  ( 设置 swpTextView placeholder 字体颜色 )
 *
 *  @param  swpTextViewPlaceholderFontColor
 */
- (void)setSwpTextViewPlaceholderFontColor:(UIColor *)swpTextViewPlaceholderFontColor;

/*!
 *  @author swp_song
 *
 *  @brief  swpTextViewTextFontColor:swpTextViewPlaceholderFontColor: ( 设置 swpTextView 文字 and placeholder 字体颜色 )
 *
 *  @param  textFontColor
 *
 *  @param  placeholderFontColor
 */
- (void)swpTextViewTextFontColor:(UIColor *)textFontColor swpTextViewPlaceholderFontColor:(UIColor *)placeholderFontColor;

/*!
 *  @author swp_song
 *
 *  @brief  swpTextViewChangeText           ( 用户输入数据回调 )
 *
 *  @param  swpTextViewTextChangeHeadle
 */
- (void)swpTextViewChangeText:(SwpTextViewTextChangeHeadle)swpTextViewTextChangeHeadle;

/*!
 *  @author swp_song
 *
 *  @brief  swpTextSetText: ( 设置 swpText 文字 )
 *
 *  @param  swpText
 */
- (void)swpTextSetText:(NSString *)swpText;

@end

NS_ASSUME_NONNULL_END

//
//  BaseViewController.h
//  Project-OC
//
//  Created by swp-song on 2019/1/24.
//  Copyright © 2019 swp-song. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Masonry/Masonry.h>
#import <SwpTextView/SwpTextView.h>

NS_ASSUME_NONNULL_BEGIN
@interface BaseViewController : UIViewController

- (void)setTextView:(SwpTextView *)textView text:(NSString *)text placeholder:(NSString *)placeholder delegate:(id<SwpTextViewDelegate>)delegate;

- (UIColor *)color:(NSInteger)hexValue;

@end
NS_ASSUME_NONNULL_END

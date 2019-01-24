//
//  BaseViewController.m
//  Project-OC
//
//  Created by swp-song on 2019/1/24.
//  Copyright © 2019 swp-song. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Object-C";
}

- (void)setTextView:(SwpTextView *)textView text:(NSString *)text placeholder:(NSString *)placeholder delegate:(id<SwpTextViewDelegate>)delegate {
    textView
    .swp_borderWidth(1)
    .swp_cornerRadius(4)
    .swp_borderColor([self color:0x522C79])
    .swp_placeholder(placeholder)
    .swp_text(text)
    .swp_placeholderColor([self color:0x1B5D8C])
    .swp_textColor([self color:0x508FF2])
    .swp_delegate(delegate)
    .swp_keyboardType(UIKeyboardTypeDefault);
}

- (UIColor *)color:(NSInteger)hexValue {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  SwpTextViewController.m
//  SwpTextViewDemo
//
//  Created by songweiping on 16/4/13.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpTextViewController.h"

#import "SwpTextView.h"

@interface SwpTextViewController ()

@property (nonatomic, strong) SwpTextView *swpTextView;

@end

@implementation SwpTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [self swpColorFromHEX:0xf4f4f4];
    
    // 更多属性 请详见 SwpTextView.h
    [self.view addSubview:self.swpTextView];
    
    // changeText 注意 block 循环引用
    [self.swpTextView swpTextViewChangeText:^(SwpTextView * _Nonnull swpTextView, NSString * _Nonnull changeText) {
        NSLog(@"%@", changeText);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor *)swpColorFromHEX:(NSInteger)hexValue {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0];
}

- (SwpTextView *)swpTextView {
    
    if (!_swpTextView) {
        _swpTextView                        = [[SwpTextView alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width - 20, 300)];
        _swpTextView.layer.borderWidth      = 1;
        _swpTextView.layer.cornerRadius     = 4;
        _swpTextView.layer.masksToBounds    = YES;
        _swpTextView.layer.borderColor      = [self swpColorFromHEX:0xe5e5e5].CGColor;
        _swpTextView.swpTextViewPlaceholder = @"请输入:";
    }
    return _swpTextView;
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

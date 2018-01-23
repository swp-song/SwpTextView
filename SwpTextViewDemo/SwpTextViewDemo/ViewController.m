//
//  ViewController.m
//  SwpTextViewDemo
//
//  Created by swp_song on 2018/1/18.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "ViewController.h"

#import <Masonry/Masonry.h>
#import <SwpTextView/SwpTextView.h>


@interface ViewController () <SwpTextViewDelegate>

@property (nonatomic, strong) SwpTextView *swpTextView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [self swpColorFromHEX:0xf4f4f4];
    
    // 更多属性 请详见 SwpTextView.h
    [self.view addSubview:self.swpTextView];
    
    
    
    [self.swpTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).mas_offset(UIEdgeInsetsMake(100, 10, 0, 10));
        make.width.equalTo(self.swpTextView.mas_height).multipliedBy(1.5);
    }];
    
    
    
    self.swpTextView
    .swpTextViewPlaceholder(@"请输入")
    .swpText(@"😀😀")
    .placeholderFontColor([self swpColorFromHEX:0x1B5D8C])
    .textFontColor([self swpColorFromHEX:0x508FF2])
    .swpTextViewDelegate(self)
    .swpViewKeyboardType(UIKeyboardTypeDefault)
    .swpTextViewChangeChain(^(SwpTextView *swpTextView, NSString *changeText){
        //  注意 block 循环引用
        NSLog(@"swpTextViewChangeChain Block Log : %@", changeText);
    });
//



//    [self.swpTextView swpTextViewChange:^(SwpTextView * _Nonnull swpTextView, NSString * _Nonnull changeText) {
//        //  注意 block 循环引用
//        NSLog(@"swpTextViewChangeText Block Log : %@", changeText);
//    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor *)swpColorFromHEX:(NSInteger)hexValue {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0];
}

/**
 *  @author swp_song
 *
 *  @brief  swpTextView:changeText: ( SwpTextView 代理方法，用户输入文字变化调用 )
 *
 *  @param  swpTextView swpTextView
 *
 *  @param  changeText  changeText
 */
- (void)swpTextView:(SwpTextView *)swpTextView changeText:(NSString *)changeText {
    NSLog(@"swpTextView:changeText: Delegate Log : %@", changeText);
}

- (SwpTextView *)swpTextView {
    
    return !_swpTextView ? _swpTextView = ({
        SwpTextView *swpTextView = [SwpTextView new];
        swpTextView.layer.borderWidth      = 1;
        swpTextView.layer.cornerRadius     = 4;
        swpTextView.layer.masksToBounds    = YES;
        swpTextView.layer.borderColor      = [self swpColorFromHEX:0xe5e5e5].CGColor;
        swpTextView;
    }) : _swpTextView;
}


@end

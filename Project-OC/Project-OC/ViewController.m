//
//  ViewController.m
//  Project-OC
//
//  Created by Dream on 2019/1/18.
//  Copyright © 2019 swp-song. All rights reserved.
//

#import "ViewController.h"

#import <Masonry/Masonry.h>
#import <SwpTextView/SwpTextView.h>

@interface ViewController ()  <SwpTextViewDelegate>

@property (nonatomic, weak) IBOutlet SwpTextView *textView1;
@property (nonatomic, strong) SwpTextView *textView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [self colorHEX:0xf4f4f4];
    

    NSLog(@"Info    : %@", SwpTextView.swpTextViewInfo);
    NSLog(@"Version : %@", SwpTextView.swpTextViewVersion);

    [self setTextView:self.textView1 text:@"This is a xib.🤠🤠 " placeholder:@"please enter 😄😆"];
    [self setTextView:self.textView2 text:@"🤡🤡  O(∩_∩)O" placeholder:@"please enter 😄😆"];
    
    [self setUI];
    
    self.textView1.swpTextViewChangeChain(^(SwpTextView *textView, NSString *text) {
        NSLog(@"textView1 Change Chain Block Log : %@", text);
    });

    self.textView2.swpTextViewChangeChain(^(SwpTextView *textView, NSString *text){
        //  注意 block 循环引用
        NSLog(@"textView2 Change Chain Block Log : %@", text);
    });
}


- (UIColor *)colorHEX:(NSInteger)hexValue {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0];
}

/**
 *  @author swp_song
 *
 *  @brief  swpTextView:changeText: ( SwpTextView 代理方法，用户输入文字变化调用 )
 *
 *  @param  textView textView
 *
 *  @param  text     text
 */
- (void)swpTextView:(SwpTextView *)textView changeText:(NSString *)text {
    NSLog(@"swpTextView:changeText: Delegate Log : textView=%p, text = %@", textView, text);
}

- (void)setUI {
    [self.view addSubview:self.textView2];
    [self.textView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).mas_offset(UIEdgeInsetsMake(0, 10, 0, 10));
        make.top.equalTo(self.textView1.mas_bottom).offset(30);
        make.size.equalTo(self.textView1);
    }];
}

- (void)setTextView:(SwpTextView *)textView text:(NSString *)text placeholder:(NSString *)placeholder  {
    textView
    .borderWidth(1)
    .cornerRadius(4)
    .borderColor([self colorHEX:0x522C79])
    .swpTextViewPlaceholder(placeholder)
    .swpText(text)
    .placeholderFontColor([self colorHEX:0x1B5D8C])
    .textFontColor([self colorHEX:0x508FF2])
    .swpTextViewDelegate(self)
    .swpViewKeyboardType(UIKeyboardTypeDefault);
}

- (SwpTextView *)textView2 {
    
    return !_textView2 ? _textView2 = ({
        SwpTextView.swpTextViewInit();
    }) : _textView2;
}

@end

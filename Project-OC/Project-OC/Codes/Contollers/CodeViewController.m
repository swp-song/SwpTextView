//
//  CodeViewController.m
//  Project-OC
//
//  Created by swp-song on 2019/1/24.
//  Copyright © 2019 swp-song. All rights reserved.
//

#import "CodeViewController.h"

@interface CodeViewController () <SwpTextViewDelegate>

@property (nonatomic, strong) SwpTextView *textView;

@end

@implementation CodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setUI];
    
    [self setTextView:self.textView text:@"🤡🤡  O(∩_∩)O" placeholder:@"Please enter 😄😆" delegate:self];
    
    self.textView.swp_textViewChangeEventChain(^(SwpTextView *textView, NSString *text) {
        NSLog(@"textView1 Change Chain Block Log : %@", text);
    });
}

- (void)dealloc {
    NSLog(@"%@ - %s - dealloc", self.class, __FUNCTION__);
}

/**
 *  @author swp_song
 *
 *  @brief  swp_textView:changeText: ( SwpTextView 代理方法，用户输入文字变化调用 )
 *
 *  @param  textView textView
 *
 *  @param  text     text
 */
- (void)swp_textView:(SwpTextView *)textView changeText:(NSString *)text {
    NSLog(@"swp_textView:changeText: Delegate Log : textView=%p, text = %@", textView, text);
}

- (void)setUI {
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.left.right.mas_equalTo(self.view).mas_offset(UIEdgeInsetsMake(0, 10, 0, 10));
        make.width.mas_equalTo(self.textView.mas_height).multipliedBy(1.0);
    }];
}

- (SwpTextView *)textView {
    return !_textView ? _textView = ({
        SwpTextView.swp_init();
    }) : _textView;
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

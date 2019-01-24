//
//  XibViewController.m
//  Project-OC
//
//  Created by swp-song on 2019/1/24.
//  Copyright © 2019 swp-song. All rights reserved.
//

#import "XibViewController.h"

@interface XibViewController () <SwpTextViewDelegate>

@property (nonatomic, weak) IBOutlet SwpTextView *textView;

@end

@implementation XibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTextView:self.textView text:@"This is a xib.🤠🤠 " placeholder:@"Please enter 😄😆" delegate:self];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

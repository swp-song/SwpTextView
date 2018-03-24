//
//  SwpTextViewUtils.m
//  swp_song
//
//  Created by swp_song on 2018/3/24.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpTextViewUtils.h"

@implementation SwpTextViewUtils

/**
 *  @author swp_song
 *
 *  @brief  swpTextViewUtilsGetInformation  ( 获取 SwpTextView 版本信息 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpTextViewUtilsGetInformation {
    NSString *path = [NSBundle.mainBundle pathForResource:@"SwpTextView.bundle/SwpTextView" ofType:@"plist"];
    return [NSDictionary dictionaryWithContentsOfFile:path];
}

@end

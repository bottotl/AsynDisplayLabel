//
//  JFTCTContainer.m
//  AsynDisplayLabel-objc
//
//  Created by jft0m on 2017/9/4.
//  Copyright © 2017年 jft0m. All rights reserved.
//

#import "JFTCTContainer.h"

@implementation JFTCTContainer

+ (instancetype)containerWithSize:(CGSize)size {
    return [self containerWithSize:size insets:UIEdgeInsetsZero];
}

+ (instancetype)containerWithSize:(CGSize)size insets:(UIEdgeInsets)insets {
    JFTCTContainer *one = [self new];
    one.size = size;
    one.insets = insets;
    return one;
}

@end

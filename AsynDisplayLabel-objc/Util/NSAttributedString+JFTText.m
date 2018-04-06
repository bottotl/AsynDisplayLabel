//
//  NSAttributedString+JFTText.m
//  AsynDisplayLabel-objc
//
//  Created by syfll on 2018/4/2.
//  Copyright © 2018年 jft0m. All rights reserved.
//

#import "NSAttributedString+JFTText.h"

@implementation NSMutableAttributedString (JFTText)
- (void)jft_setAttribute:(NSString *)name value:(id)value {
    [self jft_setAttribute:name value:value range:NSMakeRange(0, self.length)];
}

- (void)jft_setAttribute:(NSString *)name value:(id)value range:(NSRange)range {
    if (!name || [NSNull isEqual:name]) return;
    if (value && ![NSNull isEqual:value]) {
        [self addAttribute:name value:value range:range];
    } else {
        [self removeAttribute:name range:range];
    }
}

- (void)jft_setRunDelegate:(CTRunDelegateRef)runDelegate range:(NSRange)range {
    [self jft_setAttribute:(id)kCTRunDelegateAttributeName value:(__bridge id)runDelegate range:range];
}

@end

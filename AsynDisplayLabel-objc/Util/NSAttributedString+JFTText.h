//
//  NSAttributedString+JFTText.h
//  AsynDisplayLabel-objc
//
//  Created by syfll on 2018/4/2.
//  Copyright © 2018年 jft0m. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>

@interface NSMutableAttributedString (JFTText)
- (void)jft_setAttribute:(NSString *)name value:(id)value;
- (void)jft_setAttribute:(NSString *)name value:(id)value range:(NSRange)range;
- (void)jft_setRunDelegate:(CTRunDelegateRef)runDelegate range:(NSRange)range;
@end

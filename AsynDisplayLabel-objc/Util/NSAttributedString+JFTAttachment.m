//
//  NSAttributedString+JFTAttachment.m
//  AsynDisplayLabel-objc
//
//  Created by syfll on 2018/4/2.
//  Copyright © 2018年 jft0m. All rights reserved.
//

#import "NSAttributedString+JFTAttachment.h"
#import "NSAttributedString+JFTText.h"
#import "JFTTextRunDelegate.h"

NSString *const JFTTextAttachmentToken = @"\uFFFC";
NSString *const JFTTextAttachmentContextKey = @"jft.context";
NSString *const JFTTextAttachmentViewBlockKey = @"jft.creation.block";

@implementation NSMutableAttributedString (JFTAttachment)
+ (NSMutableAttributedString *)jft_attachment:(id)context
                                        width:(CGFloat)width
                                       ascent:(CGFloat)ascent
                                      descent:(CGFloat)descent
                                  creationBlock:(JFTTextLabelAttachmentViewCreateBlock)block {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:JFTTextAttachmentToken];
    
    [attr jft_setAttribute:JFTTextAttachmentContextKey value:context range:NSMakeRange(0, attr.length)];
    [attr jft_setAttribute:JFTTextAttachmentViewBlockKey value:block range:NSMakeRange(0, attr.length)];
    
    JFTTextRunDelegate *runDelegate = [JFTTextRunDelegate new];
    runDelegate.width = width;
    runDelegate.ascent = ascent;
    runDelegate.descent = descent;
    CTRunDelegateRef delegateRef = runDelegate.CTRunDelegate;
    [attr jft_setRunDelegate:delegateRef range:NSMakeRange(0, attr.length)];
    if (delegateRef) CFRelease(delegateRef);
    return attr;
}
@end

//
//  NSAttributedString+JFTAttachment.h
//  AsynDisplayLabel-objc
//
//  Created by syfll on 2018/4/2.
//  Copyright © 2018年 jft0m. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString *const JFTTextAttachmentToken;
extern NSString *const JFTTextAttachmentContextKey;
extern NSString *const JFTTextAttachmentViewBlockKey;

typedef UIView *(^JFTTextLabelAttachmentViewCreateBlock)(id context);

@interface NSMutableAttributedString (JFTAttachment)
+ (NSMutableAttributedString *)jft_attachment:(id)context
                                        width:(CGFloat)width
                                       ascent:(CGFloat)ascent
                                      descent:(CGFloat)descent
                                  creationBlock:(JFTTextLabelAttachmentViewCreateBlock)block;
@end

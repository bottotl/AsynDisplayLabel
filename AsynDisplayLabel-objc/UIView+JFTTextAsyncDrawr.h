//
//  UIView+JFTTextAsyncDrawr.h
//  AsynDisplayLabel-objc
//
//  Created by jft0m on 2017/9/4.
//  Copyright © 2017年 jft0m. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JFTTextLayout;
@interface UIView (JFTTextAsyncDrawr)

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx withLayout:(JFTTextLayout *)layout;

@end

//
//  UIView+JFTTextAsyncDrawr.m
//  AsynDisplayLabel-objc
//
//  Created by jft0m on 2017/9/4.
//  Copyright © 2017年 jft0m. All rights reserved.
//

#import "UIView+JFTTextAsyncDrawr.h"
#import "JFTTextLayout.h"

@implementation UIView (JFTTextAsyncDrawr)

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx withLayout:(JFTTextLayout *)layout {
    CGRect rect = CGContextGetClipBoundingBox(ctx);
    CGContextSaveGState(ctx);
    CGContextAddRect(ctx, rect);
    CGContextSetRGBFillColor(ctx, 1, 1, 1, 1);
    CGContextFillPath(ctx);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx , 0, -layer.bounds.size.height);
    
    NSLog(@"rect === %@", [NSValue valueWithCGRect:rect]);
    JFTCTStorage *storage = layout.storage;
    storage.jft_constraints = layout.container.size;
    [storage jft_updateIfNeeded];
    CTFrameDraw(storage.ctFrame, ctx);
    CGContextRestoreGState(ctx);
}
@end

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
    JFTCTStorage *storage = layout.storage;
    storage.jft_constraints = layout.container.size;
    [storage jft_updateIfNeeded];
    
    CGRect rect = CGContextGetClipBoundingBox(ctx);
    CGContextSaveGState(ctx);
    CGContextAddRect(ctx, rect);
    if (rect.origin.y < 200) {
        CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    } else {
        CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    }
    
    CGContextFillPath(ctx);
    CGContextRestoreGState(ctx);
    
    NSLog(@"rect === %@", [NSValue valueWithCGRect:CGContextGetClipBoundingBox(ctx)]);
    CGContextSaveGState(ctx);
    CGContextScaleCTM(ctx, 1, -1);
    CGRect frameRect = CGPathGetBoundingBox(CTFrameGetPath(storage.ctFrame));
    CGContextTranslateCTM(ctx , 0, -frameRect.size.height);
    CTFrameDraw(storage.ctFrame, ctx);
    
}
@end

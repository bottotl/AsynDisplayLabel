//
//  JFTTextLayerDelegate.m
//  AsynDisplayLabel-objc
//
//  Created by jft0m on 2017/9/5.
//  Copyright © 2017年 jft0m. All rights reserved.
//

#import "JFTTextLayerDelegate.h"
#import "JFTTextLayout.h"

@implementation JFTTextLayerDelegate

- (JFTTextLayout *)jft_layout {
    if (!_jft_layout) {
        _jft_layout = [JFTTextLayout new];
    }
    return _jft_layout;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    [self drawLayer:layer inContext:ctx withLayout:self.jft_layout];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx withLayout:(JFTTextLayout *)layout {
    JFTCTStorage *storage = layout.storage;
    storage.jft_constraints = layout.container.size;
    [storage jft_updateIfNeeded];
    
    CGContextSaveGState(ctx);
    NSLog(@"%@",[NSValue valueWithCGRect:CGContextGetClipBoundingBox(ctx)]);
    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextAddRect(ctx, CGContextGetClipBoundingBox(ctx));
    CGContextFillPath(ctx);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGRect frameRect = CGPathGetBoundingBox(CTFrameGetPath(storage.ctFrame));
    CGContextTranslateCTM(ctx , 0, -frameRect.size.height);
    CTFrameDraw(storage.ctFrame, ctx);
    if (!storage.ctFrame) { // for debug
        CGContextSaveGState(ctx);
        CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
        CGContextAddRect(ctx, CGContextGetClipBoundingBox(ctx));
        CGContextFillPath(ctx);
        CGContextRestoreGState(ctx);
    }
    CGContextRestoreGState(ctx);

}

@end

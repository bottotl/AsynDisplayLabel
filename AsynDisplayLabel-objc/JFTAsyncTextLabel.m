//
//  JFTAsyncTextLabel.m
//  AsynDisplayLabel-objc
//
//  Created by jft0m on 2017/8/24.
//  Copyright © 2017年 jft0m. All rights reserved.
//

#import "JFTAsyncTextLabel.h"
#import <CoreText/CoreText.h>
#import "JFTTextLayout.h"
#import "UIView+JFTTextAsyncDrawr.h"

@interface JFTAsyncTextLayer : CATiledLayer
@end

@implementation JFTAsyncTextLayer

+ (CFTimeInterval)fadeDuration {
    return 0.f;
}

- (CGSize)tileSize {
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    return size = CGSizeMake(size.width * scale, size.height * scale);
}

@end

@interface JFTAsyncTextLabel()
@property (nonatomic, strong) JFTTextLayout *jft_layout;
@end

@implementation JFTAsyncTextLabel
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (void)setAttributeString:(NSAttributedString *)attributeString {
    _attributeString = attributeString;
    self.jft_layout.storage = [[JFTCTStorage alloc] initWithAttributedString:attributeString];
    [self.jft_layout.storage jft_setNeedUpdate];
}

- (JFTTextLayout *)jft_layout {
    if (!_jft_layout) {
        _jft_layout = [JFTTextLayout new];
    }
    return _jft_layout;
}

+ (Class)layerClass {
    return [JFTAsyncTextLayer class];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.jft_layout.container.size = self.bounds.size;
    [self.jft_layout.storage jft_setNeedUpdate];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    [self drawLayer:layer inContext:ctx withLayout:self.jft_layout];
//    [self debug_drawLayer:layer inContext:ctx];
}

- (void)debug_drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGRect rect = CGContextGetClipBoundingBox(ctx);
    CGContextSaveGState(ctx);
    CGContextAddRect(ctx, rect);
    CGContextSetRGBFillColor(ctx, 1, 1, 1, 1);
    CGContextFillPath(ctx);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx , 0, -layer.bounds.size.height);
    
    NSLog(@"rect === %@", [NSValue valueWithCGRect:rect]);
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)self.attributeString);
    CGPathRef path = CGPathCreateWithRect(layer.bounds, nil);
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, nil);
    CTFrameDraw(frame, ctx);
    CFRelease(frameSetter);
    CFRelease(path);
    CFRelease(frame);
    CGContextRestoreGState(ctx);
}

@end

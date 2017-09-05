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
#import "JFTTextLayerDelegate.h"

@interface JFTAsyncTextLayer : CATiledLayer
@end

@implementation JFTAsyncTextLayer

+ (CFTimeInterval)fadeDuration {
    return 0.f;
}

- (CGColorRef)backgroundColor {
    return [UIColor whiteColor].CGColor;
}

- (CGSize)tileSize {
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    return size = CGSizeMake(size.width * scale, 100 * scale);
}

@end

@interface JFTAsyncTextLabel()

@property (nonatomic, strong) JFTTextLayerDelegate *layerDelegate;

@end

@implementation JFTAsyncTextLabel
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _layerDelegate = [JFTTextLayerDelegate new];
        self.layer.delegate = _layerDelegate;
    }
    return self;
}

- (void)setAttributeString:(NSAttributedString *)attributeString {
    _attributeString = attributeString;
    if (!_attributeString) {
        self.layerDelegate.jft_layout = nil;
    } else {
        self.layerDelegate.jft_layout.storage = [[JFTCTStorage alloc] initWithAttributedString:attributeString];
        [self.layerDelegate.jft_layout.storage jft_setNeedUpdate];
        [self.layer setNeedsDisplay];
    }
}

+ (Class)layerClass {
    return [JFTAsyncTextLayer class];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.layerDelegate.jft_layout.container.size = self.bounds.size;
    [self.layerDelegate.jft_layout.storage jft_setNeedUpdate];
}

//- (void)debug_drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
//    CGRect rect = CGContextGetClipBoundingBox(ctx);
//    CGContextSaveGState(ctx);
//    CGContextAddRect(ctx, rect);
//    CGContextSetRGBFillColor(ctx, 1, 1, 1, 1);
//    CGContextFillPath(ctx);
//    CGContextScaleCTM(ctx, 1, -1);
//    CGContextTranslateCTM(ctx , 0, -layer.bounds.size.height);
//
//    NSLog(@"rect === %@", [NSValue valueWithCGRect:rect]);
//
//    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)self.attributeString);
//    CGPathRef path = CGPathCreateWithRect(layer.bounds, nil);
//    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, nil);
//    CTFrameDraw(frame, ctx);
//    CFRelease(frameSetter);
//    CFRelease(path);
//    CFRelease(frame);
//    CGContextRestoreGState(ctx);
//}

@end

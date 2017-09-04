//
//  JFTCTStorage.m
//  AsynDisplayLabel-objc
//
//  Created by jft0m on 2017/9/4.
//  Copyright © 2017年 jft0m. All rights reserved.
//

#import "JFTCTStorage.h"

@interface JFTCTStorage ()

@property (nonatomic, strong) NSMutableAttributedString *jft_internalAttributedString;

@property (nonatomic, readwrite) CTFramesetterRef ctFrameSetter;
@property (nonatomic, readwrite) CGPathRef        cgPath;

@property (nonatomic, readwrite) CTFrameRef       ctFrame;
@property (nonatomic, readwrite) CFArrayRef       ctLines;

@property (nonatomic, assign)    BOOL             needUpdate;

@end

@implementation JFTCTStorage

- (instancetype)initWithAttributedString:(NSAttributedString *)attributedString {
    if (self = [super init]) {
        _attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
    }
    return self;
}

- (void)jft_setNeedUpdate {
    _needUpdate = YES;
}

- (void)jft_updateIfNeeded {
    if (_needUpdate) {
        [self jft_update];
    }
}

- (void)jft_update {
    _needUpdate = NO;
    _jft_internalAttributedString = self.attributedString;/// precess attributed string if need (attachment)
    [self createCoreTextData];
}

- (void)createCoreTextData {
    NSParameterAssert(_jft_internalAttributedString);
    
    _ctFrameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)_jft_internalAttributedString);
    
    CGSize suggestFrameSize = CTFramesetterSuggestFrameSizeWithConstraints(_ctFrameSetter, CFRangeMake(0,0), nil, _jft_constraints, nil);
    CGRect rect = {CGPointZero, suggestFrameSize};
    _cgPath = CGPathCreateWithRect(rect, nil);
    _ctFrame = CTFramesetterCreateFrame(_ctFrameSetter, CFRangeMake(0, 0), _cgPath, nil);
    _ctLines = CTFrameGetLines(_ctFrame);
}

- (void)dealloc {
    if (_ctFrameSetter) CFRelease(_ctFrameSetter);
    if (_cgPath) CFRelease(_cgPath);
    if (_ctFrame) CFRelease(_ctFrame);
}

@end

//
//  JFTCTStorage.h
//  AsynDisplayLabel-objc
//
//  Created by jft0m on 2017/9/4.
//  Copyright © 2017年 jft0m. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>

@interface JFTCTStorage : NSObject

- (instancetype)initWithAttributedString:(NSAttributedString *)attributedString;

@property (nonatomic, strong) NSMutableAttributedString *attributedString;

@property (nonatomic, assign)   CGSize           jft_constraints;

@property (nonatomic, readonly) CTFramesetterRef ctFrameSetter;
@property (nonatomic, readonly) CGPathRef        cgPath;

@property (nonatomic, readonly) CTFrameRef       ctFrame;
@property (nonatomic, readonly) CFArrayRef       ctLines;///< CTLines

- (void)jft_updateIfNeeded;
- (void)jft_setNeedUpdate;

@end

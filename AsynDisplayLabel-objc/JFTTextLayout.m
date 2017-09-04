//
//  JFTTextLayout.m
//  AsynDisplayLabel-objc
//
//  Created by jft0m on 2017/9/4.
//  Copyright © 2017年 jft0m. All rights reserved.
//

#import "JFTTextLayout.h"

@interface JFTTextLayout ()
@end

@implementation JFTTextLayout

- (instancetype)initWithStorage:(JFTCTStorage *)storage {
    if (self = [super init]) {
        _storage = storage;
    }
    return self;
}

- (CGFloat)getHeight {
    return 1.f;
}

- (JFTCTContainer *)container {
    if (!_container) {
        _container = [JFTCTContainer new];
    }
    return _container;
}

@end

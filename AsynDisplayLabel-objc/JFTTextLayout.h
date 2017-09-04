//
//  JFTTextLayout.h
//  AsynDisplayLabel-objc
//
//  Created by jft0m on 2017/9/4.
//  Copyright © 2017年 jft0m. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JFTCTContainer.h"
#import "JFTCTStorage.h"

@interface JFTTextLayout : NSObject

- (instancetype)initWithStorage:(JFTCTStorage *)storage;

@property (nonatomic, strong) JFTCTContainer *container;

@property (nonatomic, assign) NSInteger       numberOfLines;

@property (nonatomic, strong) JFTCTStorage   *storage;

- (CGFloat)getHeight;

@end

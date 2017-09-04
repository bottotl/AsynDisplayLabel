//
//  JFTCTContainer.h
//  AsynDisplayLabel-objc
//
//  Created by jft0m on 2017/9/4.
//  Copyright © 2017年 jft0m. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JFTCTContainer : NSObject

+ (instancetype)containerWithSize:(CGSize)size;

+ (instancetype)containerWithSize:(CGSize)size insets:(UIEdgeInsets)insets;

@property CGSize size;

@property UIEdgeInsets insets;

//@property (nullable, copy) NSArray<UIBezierPath *> *exclusionPaths;

@property NSUInteger maxNumberOfRows;


@end

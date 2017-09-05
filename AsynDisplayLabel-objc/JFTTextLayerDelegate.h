//
//  JFTTextLayerDelegate.h
//  AsynDisplayLabel-objc
//
//  Created by jft0m on 2017/9/5.
//  Copyright © 2017年 jft0m. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JFTTextLayout;
@protocol JFTTextLayerDelegate <CALayerDelegate>
@required
@property (nonatomic, strong) JFTTextLayout *jft_layout;
@end

@interface JFTTextLayerDelegate : NSObject <JFTTextLayerDelegate>

@property (nonatomic, strong) JFTTextLayout *jft_layout;

@end

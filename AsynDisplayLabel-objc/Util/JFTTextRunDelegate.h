//
//  JFTTextRunDelegate.h
//  AsynDisplayLabel-objc
//
//  Created by syfll on 2018/4/2.
//  Copyright © 2018年 jft0m. All rights reserved.
//

#import <CoreText/CoreText.h>
#import <Foundation/Foundation.h>

@interface JFTTextRunDelegate : NSObject <NSCopying, NSCoding>
/**
 Creates and returns the CTRunDelegate.
 
 @discussion You need call CFRelease() after used.
 The CTRunDelegateRef has a strong reference to this YYTextRunDelegate object.
 In CoreText, use CTRunDelegateGetRefCon() to get this YYTextRunDelegate object.
 
 @return The CTRunDelegate object.
 */
- (nullable CTRunDelegateRef)CTRunDelegate CF_RETURNS_RETAINED;

/**
 Additional information about the the run delegate.
 */
@property (nullable, nonatomic, strong) NSDictionary *userInfo;

/**
 The typographic ascent of glyphs in the run.
 */
@property (nonatomic) CGFloat ascent;

/**
 The typographic descent of glyphs in the run.
 */
@property (nonatomic) CGFloat descent;

/**
 The typographic width of glyphs in the run.
 */
@property (nonatomic) CGFloat width;
@end

//
//  NSObject+THRuntime.h
//  Westore
//
//  Created by WenQing on 2017/5/31.
//  Copyright © 2017年 Rainbow Department Store Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (THRuntime)

+ (void)exchangeImplementationsWithClass:(NSString *)className
                      fromMethodSelector:(SEL)fromSEL
                        toMethodSelector:(SEL)toSEL
                        isInstanceMethod:(BOOL)isInstanceMethod;

+ (void)exchangeInstanceMethodWithClass:(NSString *)className
                       originalSelector:(SEL)originalSelector
                       swizzledSelector:(SEL)swizzledSelector;

+ (void)exchangeClassMethodWithClass:(NSString *)className
                    originalSelector:(SEL)originalSelector
                    swizzledSelector:(SEL)swizzledSelector;

@end

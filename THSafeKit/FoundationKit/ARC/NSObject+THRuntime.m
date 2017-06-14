//
//  NSObject+THRuntime.m
//  Westore
//
//  Created by WenQing on 2017/5/31.
//  Copyright © 2017年 Rainbow Department Store Co., Ltd. All rights reserved.
//

#import "NSObject+THRuntime.h"
#import <objc/runtime.h>

@implementation NSObject (THRuntime)

- (void)thdealloc
{
    //统一处理部分事情
    [self thdealloc];
}

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self exchangeImplementationsWithClass:NSStringFromClass(self) fromMethodSelector:NSSelectorFromString(@"dealloc") toMethodSelector:@selector(thdealloc) isInstanceMethod:YES];
    });
}

+ (void)exchangeImplementationsWithClass:(NSString *)className
                      fromMethodSelector:(SEL)fromSEL
                        toMethodSelector:(SEL)toSEL
                        isInstanceMethod:(BOOL)isInstanceMethod
{
    Method fromMethod = nil;
    Method toMethod = nil;
    Class selfClass = NSClassFromString(className);
    if (isInstanceMethod) {
        fromMethod = class_getInstanceMethod(selfClass, fromSEL);
        toMethod = class_getInstanceMethod(selfClass, toSEL);
    }else {
        fromMethod = class_getClassMethod(selfClass, fromSEL);
        toMethod = class_getClassMethod(selfClass, toSEL);
    }
    
    // 判断 是否 可以添加 新方法
    BOOL didAddMethod =
    class_addMethod(selfClass,
                    fromSEL,
                    method_getImplementation(toMethod),
                    method_getTypeEncoding(toMethod));
    
    if (didAddMethod) {
        class_replaceMethod(selfClass,
                            toSEL,
                            method_getImplementation(fromMethod),
                            method_getTypeEncoding(fromMethod));
        
    } else {
        // 替换 原有 方法
        method_exchangeImplementations(fromMethod, toMethod);
    }
}

+ (void)exchangeInstanceMethodWithClass:(NSString *)className
                           originalSelector:(SEL)originalSelector
                           swizzledSelector:(SEL)swizzledSelector
{
    
    [self exchangeImplementationsWithClass:className fromMethodSelector:originalSelector toMethodSelector:swizzledSelector isInstanceMethod:YES];
}

+ (void)exchangeClassMethodWithClass:(NSString *)className
                       originalSelector:(SEL)originalSelector
                       swizzledSelector:(SEL)swizzledSelector
{
    
    [self exchangeImplementationsWithClass:className fromMethodSelector:originalSelector toMethodSelector:swizzledSelector isInstanceMethod:NO];
}

@end

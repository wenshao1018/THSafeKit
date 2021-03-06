//
//  NSObject+THSafeKit.m
//  THSafeKitDemo
//
//  Created by WenQing on 2017/6/9.
//  Copyright © 2017年 com.rainbow. All rights reserved.
//

#import "NSObject+THSafeKit.h"
#import "NSObject+THRuntime.h"
#import <objc/runtime.h>

//防止崩溃函数
void dynamicMethodIMP(id self,SEL _cmd)
{
    
}

@implementation NSObject (THSafeKit)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeImplementationsWithClass:NSStringFromClass(self) fromMethodSelector:@selector(methodSignatureForSelector:) toMethodSelector:@selector(safe_methodSignatureForSelector:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:NSStringFromClass(self) fromMethodSelector:@selector(forwardInvocation:) toMethodSelector:@selector(safe_forwardInvocation:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:NSStringFromClass(self) fromMethodSelector:@selector(setValue:forKey:) toMethodSelector:@selector(safe_setValue:forKey:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:NSStringFromClass(self) fromMethodSelector:@selector(setValue:forKeyPath:) toMethodSelector:@selector(safe_setValue:forKeyPath:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:NSStringFromClass(self) fromMethodSelector:@selector(setValue:forUndefinedKey:) toMethodSelector:@selector(safe_setValue:forUndefinedKey:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:NSStringFromClass(self) fromMethodSelector:@selector(setValuesForKeysWithDictionary:) toMethodSelector:@selector(safe_setValuesForKeysWithDictionary:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:NSStringFromClass(self) fromMethodSelector:@selector(removeObserver:forKeyPath:) toMethodSelector:@selector(safe_removeObserver:forKeyPath:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:NSStringFromClass(self) fromMethodSelector:@selector(removeObserver:forKeyPath:context:) toMethodSelector:@selector(safe_removeObserver:forKeyPath:context:) isInstanceMethod:YES];
    });
}

- (NSMethodSignature *)safe_methodSignatureForSelector:(SEL)aSelector
{
    if (![self respondsToSelector:aSelector]) {
        NSMethodSignature *methodSignature = [self safe_methodSignatureForSelector:aSelector];
        class_addMethod([self class], aSelector, (IMP)dynamicMethodIMP, "v@:");
        if (!methodSignature) {
            methodSignature = [self safe_methodSignatureForSelector:aSelector];
        }
        
        return methodSignature;
        
    }else{
        return [self safe_methodSignatureForSelector:aSelector];
    }
}

- (void)safe_forwardInvocation:(NSInvocation *)anInvocation
{
    SEL selector = [anInvocation selector];
    if ([self respondsToSelector:selector]) {
        [anInvocation invokeWithTarget:self];
    }else{
        [self safe_forwardInvocation:anInvocation];
    }
}

- (void)safe_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath
{
    @try {
        [self safe_removeObserver:observer forKeyPath:keyPath];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(nullable void *)context
{
    @try {
        [self safe_removeObserver:observer forKeyPath:keyPath context:context];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_setValue:(nullable id)value forKey:(NSString *)key
{
    @try {
        [self safe_setValue:value forKey:key];
    }
    @catch (NSException *exception) {
    }
    @finally {
        
    }
}

- (void)safe_setValue:(nullable id)value forKeyPath:(NSString *)keyPath
{
    @try {
        [self safe_setValue:value forKeyPath:keyPath];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}

- (void)safe_setValue:(nullable id)value forUndefinedKey:(NSString *)key
{
    @try {
        [self safe_setValue:value forUndefinedKey:key];
    }
    @catch (NSException *exception) {

    }
    @finally {
        
    }
}

- (void)safe_setValuesForKeysWithDictionary:(NSDictionary<NSString *, id> *)keyedValues
{
    @try {
        [self safe_setValuesForKeysWithDictionary:keyedValues];
    }
    @catch (NSException *exception) {

    }
    @finally {
        
    }
}

@end

//
//  NSAttributedString+THSafeKit.m
//  Westore
//
//  Created by WenQing on 2017/6/09.
//  Copyright © 2017年 Rainbow Department Store Co., Ltd. All rights reserved.
//

#import "NSAttributedString+THSafeKit.h"
#import "NSObject+THRuntime.h"

@implementation NSAttributedString (THSafeKit)

+ (void) load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeImplementationsWithClass:@"NSConcreteAttributedString" fromMethodSelector:@selector(initWithString:) toMethodSelector:@selector(safe_initWithString:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"NSConcreteAttributedString" fromMethodSelector:@selector(initWithAttributedString:) toMethodSelector:@selector(safe_initWithAttributedString:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"NSConcreteAttributedString" fromMethodSelector:@selector(initWithString:attributes:) toMethodSelector:@selector(safe_initWithString:attributes:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"NSConcreteAttributedString" fromMethodSelector:@selector(attributesAtIndex:effectiveRange:) toMethodSelector:@selector(safe_attributesAtIndex:effectiveRange:) isInstanceMethod:YES];
    });
}

- (instancetype)safe_initWithString:(NSString *)aString
{
    id object = nil;
    
    @try {
        object = [self safe_initWithString:aString];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        return object;
    }
}

- (instancetype)safe_initWithAttributedString:(NSAttributedString *)attrStr
{
    id object = nil;
    
    @try {
        object = [self safe_initWithAttributedString:attrStr];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        return object;
    }
}

- (instancetype)safe_initWithString:(NSString *)str attributes:(nullable NSDictionary<NSString *, id> *)attrs
{
    id object = nil;
    
    @try {
        object = [self safe_initWithString:str attributes:attrs];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        return object;
    }
}

- (NSDictionary<NSString *, id> *)safe_attributesAtIndex:(NSUInteger)location effectiveRange:(nullable NSRangePointer)range
{
    id object = nil;
    
    @try {
        object = [self safe_attributesAtIndex:location effectiveRange:range];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        return object;
    }
}

@end

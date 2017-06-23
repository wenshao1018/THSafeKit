//
//  NSMutableAttributedString+THSafeKit.m
//  Westore
//
//  Created by WenQing on 2017/6/09.
//  Copyright © 2017年 Rainbow Department Store Co., Ltd. All rights reserved.
//

#import "NSMutableAttributedString+THSafeKit.h"
#import "NSObject+THRuntime.h"

@implementation NSMutableAttributedString (THSafeKit)

+ (void) load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeImplementationsWithClass:@"NSConcreteMutableAttributedString" fromMethodSelector:@selector(initWithString:) toMethodSelector:@selector(safe_initWithString:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"NSConcreteMutableAttributedString" fromMethodSelector:@selector(initWithAttributedString:) toMethodSelector:@selector(safe_initWithAttributedString:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"NSConcreteMutableAttributedString" fromMethodSelector:@selector(initWithString:attributes:) toMethodSelector:@selector(safe_initWithString:attributes:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"NSConcreteMutableAttributedString" fromMethodSelector:@selector(addAttribute:value:range:) toMethodSelector:@selector(safe_addAttribute:value:range:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"NSConcreteMutableAttributedString" fromMethodSelector:@selector(addAttributes:range:) toMethodSelector:@selector(safe_addAttributes:range:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"NSConcreteMutableAttributedString" fromMethodSelector:@selector(replaceCharactersInRange:withString:) toMethodSelector:@selector(safe_replaceCharactersInRange:withString:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"NSConcreteMutableAttributedString" fromMethodSelector:@selector(setAttributes:range:) toMethodSelector:@selector(safe_setAttributes:range:) isInstanceMethod:YES];
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

- (void)safe_addAttribute:(NSString *)name value:(id)value range:(NSRange)range
{
    @try {
        [self safe_addAttribute:name value:value range:range];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}

- (void)safe_addAttributes:(NSDictionary<NSString *, id> *)attrs range:(NSRange)range
{
    @try {
        [self safe_addAttributes:attrs range:range];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_replaceCharactersInRange:(NSRange)range withString:(NSString *)aString
{
    @try {
        [self safe_replaceCharactersInRange:range withString:aString];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_setAttributes:(nullable NSDictionary<NSString *, id> *)attrs range:(NSRange)range
{
    @try {
        [self safe_setAttributes:attrs range:range];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

@end

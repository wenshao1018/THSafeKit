//
//  NSMutableString+THSafeKit.m
//  Westore
//
//  Created by WenQing on 2017/5/31.
//  Copyright © 2017年 Rainbow Department Store Co., Ltd. All rights reserved.
//

#import "NSMutableString+THSafeKit.h"
#import "NSObject+THRuntime.h"

@implementation NSMutableString (THSafeKit)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeImplementationsWithClass:@"__NSCFString" fromMethodSelector:@selector(appendString:) toMethodSelector:@selector(safe_appendString:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSCFString" fromMethodSelector:@selector(appendFormat:) toMethodSelector:@selector(safe_appendFormat:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSCFString" fromMethodSelector:@selector(setString:) toMethodSelector:@selector(safe_setString:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSCFString" fromMethodSelector:@selector(insertString:atIndex:) toMethodSelector:@selector(safe_insertString:atIndex:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSCFString" fromMethodSelector:@selector(deleteCharactersInRange:) toMethodSelector:@selector(safe_deleteCharactersInRange:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSCFString" fromMethodSelector:@selector(replaceCharactersInRange:withString:) toMethodSelector:@selector(safe_replaceCharactersInRange:withString:) isInstanceMethod:YES];
    });
}

- (void)safe_appendString:(NSString *)aString
{
    @try {
        [self safe_appendString:aString];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_appendFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2)
{
    if (!format) {
        return;
    }
    va_list arguments;
    va_start(arguments, format);
    NSString *formatStr = [[NSString alloc]initWithFormat:format arguments:arguments];
    [self safe_appendFormat:@"%@",formatStr];
    va_end(arguments);
}

- (void)safe_setString:(NSString *)aString
{
    @try {
        [self safe_setString:aString];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_insertString:(NSString *)aString atIndex:(NSUInteger)index
{
    @try {
        [self safe_insertString:aString atIndex:index];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_deleteCharactersInRange:(NSRange)range
{
    @try {
        [self safe_deleteCharactersInRange:range];
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

@end

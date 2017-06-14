//
//  NSString+THSafeKit.m
//  Westore
//
//  Created by WenQing on 2017/5/31.
//  Copyright © 2017年 Rainbow Department Store Co., Ltd. All rights reserved.
//

#import "NSString+THSafeKit.h"
#import "NSObject+THRuntime.h"

@implementation NSString (THSafeKit)

+ (void) load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeImplementationsWithClass:@"__NSCFConstantString" fromMethodSelector:@selector(characterAtIndex:) toMethodSelector:@selector(safe_characterAtIndex:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSCFConstantString" fromMethodSelector:@selector(substringWithRange:) toMethodSelector:@selector(safe_substringWithRange:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSCFConstantString" fromMethodSelector:@selector(substringToIndex:) toMethodSelector:@selector(safe_substringToIndex:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSCFConstantString" fromMethodSelector:@selector(substringFromIndex:) toMethodSelector:@selector(safe_substringFromIndex:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSCFConstantString" fromMethodSelector:@selector(stringByReplacingCharactersInRange:withString:) toMethodSelector:@selector(safe_stringByReplacingCharactersInRange:withString:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSCFConstantString" fromMethodSelector:@selector(stringByReplacingOccurrencesOfString:withString:options:range:) toMethodSelector:@selector(safe_stringByReplacingOccurrencesOfString:withString:options:range:) isInstanceMethod:YES];
    });
}

- (unichar)safe_characterAtIndex:(NSUInteger)index
{
    if (index >= self.length) {
        return 0;
    }
    return [self safe_characterAtIndex:index];
}

- (NSString *)safe_substringWithRange:(NSRange)range
{
    if (range.location + range.length > self.length) {
        return self;
    }
    return [self safe_substringWithRange:range];
}

- (NSString *)safe_substringToIndex:(NSUInteger)to
{
    if (to > self.length) {
        return self;
    }
    return [self safe_substringToIndex:to];
}

- (NSString *)safe_substringFromIndex:(NSUInteger)from
{
    if (from > self.length) {
        return self;
    }
    return [self safe_substringFromIndex:from];
}


- (NSString *)safe_stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement
{
    if (range.location + range.length > self.length) {
        return self;
    }
    return [self safe_stringByReplacingCharactersInRange:range withString:replacement];
}

- (NSString *)safe_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange
{
    NSString *newStr = self;
    @try {
        newStr = [self safe_stringByReplacingOccurrencesOfString:target withString:replacement options:options range:searchRange];
    }
    @catch (NSException *exception) {//程序出错，但是不会崩溃
        
    }
    @finally {
        return newStr;
    }
}

@end

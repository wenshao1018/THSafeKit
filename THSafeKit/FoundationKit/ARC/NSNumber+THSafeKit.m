//
//  NSNumber+THSafeKit.m
//  Westore
//
//  Created by WenQing on 2017/5/31.
//  Copyright © 2017年 Rainbow Department Store Co., Ltd. All rights reserved.
//

#import "NSNumber+THSafeKit.h"
#import "NSObject+THRuntime.h"

@implementation NSNumber (THSafeKit)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeImplementationsWithClass:@"__NSCFNumber" fromMethodSelector:@selector(isEqualToNumber:) toMethodSelector:@selector(safe_isEqualToNumber:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSCFNumber" fromMethodSelector:@selector(compare:) toMethodSelector:@selector(safe_compare:) isInstanceMethod:YES];
    });
}

- (BOOL)safe_isEqualToNumber:(NSNumber *)number
{
    if (!number) {
        return NO;
    }
    return [self safe_isEqualToNumber:number];
}

- (NSComparisonResult)safe_compare:(NSNumber *)number
{
    if (!number) {
        return NSOrderedAscending;
    }
    return [self safe_compare:number];
}

@end

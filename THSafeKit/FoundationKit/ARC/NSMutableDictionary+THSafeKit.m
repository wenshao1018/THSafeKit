//
//  NSMutableDictionary+THSafeKit.m
//  Westore
//
//  Created by WenQing on 2017/5/31.
//  Copyright © 2017年 Rainbow Department Store Co., Ltd. All rights reserved.
//

#import "NSMutableDictionary+THSafeKit.h"
#import "NSObject+THRuntime.h"

@implementation NSMutableDictionary (THSafeKit)

+ (void) load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self exchangeImplementationsWithClass:@"__NSDictionaryM" fromMethodSelector:@selector(removeObjectForKey:) toMethodSelector:@selector(safe_removeObjectForKey:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSDictionaryM" fromMethodSelector:@selector(setObject:forKey:) toMethodSelector:@selector(safe_setObject:forKey:) isInstanceMethod:YES];
    });
}

- (void)safe_removeObjectForKey:(id)key
{
    if (!key) {
        return;
    }
    [self safe_removeObjectForKey:key];
}

- (void)safe_setObject:(id)object forKey:(id <NSCopying>)key
{
    if (!object) {
        return;
    }
    if (!key) {
        return;
    }
    [self safe_setObject:object forKey:key];
}

@end

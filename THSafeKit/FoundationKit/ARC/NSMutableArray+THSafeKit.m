//
//  NSMutableArray+THSafeKit.m
//  Westore
//
//  Created by WenQing on 2017/5/31.
//  Copyright © 2017年 Rainbow Department Store Co., Ltd. All rights reserved.
//

#import "NSMutableArray+THSafeKit.h"
#import "NSObject+THRuntime.h"

@implementation NSMutableArray (THSafeKit)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self exchangeImplementationsWithClass:@"__NSArrayM" fromMethodSelector:@selector(addObject:) toMethodSelector:@selector(safe_addObject:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSArrayM" fromMethodSelector:@selector(insertObject:atIndex:) toMethodSelector:@selector(safe_insertObject:atIndex:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSArrayM" fromMethodSelector:@selector(removeObjectAtIndex:) toMethodSelector:@selector(safe_removeObjectAtIndex:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSArrayM" fromMethodSelector:@selector(replaceObjectAtIndex:withObject:) toMethodSelector:@selector(safe_replaceObjectAtIndex:withObject:) isInstanceMethod:YES];
    });
}

- (void)safe_addObject:(id)anObject
{
    @try {
        [self safe_addObject:anObject];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_insertObject:(id)object atIndex:(NSUInteger)index
{
    @try {
        [self safe_insertObject:object atIndex:index];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_removeObjectAtIndex:(NSUInteger)index
{
    @try {
        [self safe_removeObjectAtIndex:index];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    @try {
        [self safe_replaceObjectAtIndex:index withObject:anObject];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

@end

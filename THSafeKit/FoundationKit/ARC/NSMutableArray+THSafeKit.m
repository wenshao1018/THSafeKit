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
    if (!anObject) {
        return;
    }
    [self safe_addObject:anObject];
}

- (void)safe_insertObject:(id)object atIndex:(NSUInteger)index
{
    if (!object) {
        return;
    }
    if (index > self.count) {
        return;
    }
    [self safe_insertObject:object atIndex:index];
}

- (void)safe_removeObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return;
    }
    
    return [self safe_removeObjectAtIndex:index];
}

- (void)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (index >= self.count) {
        return;
    }
    if (!anObject) {
        return;
    }
    [self safe_replaceObjectAtIndex:index withObject:anObject];
}

@end

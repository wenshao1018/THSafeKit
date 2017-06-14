//
//  NSArray+THSafeKit.m
//  Westore
//
//  Created by WenQing on 2017/5/31.
//  Copyright © 2017年 Rainbow Department Store Co., Ltd. All rights reserved.
//

#import "NSArray+THSafeKit.h"
#import "NSObject+THRuntime.h"

@implementation NSArray (THSafeKit)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self exchangeImplementationsWithClass:@"__NSPlaceholderArray" fromMethodSelector:@selector(initWithObjects:count:) toMethodSelector:@selector(initWithObjects_safe:count:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSArrayI" fromMethodSelector:@selector(objectAtIndex:) toMethodSelector:@selector(safe_objectAtIndex:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSArrayI" fromMethodSelector:@selector(arrayByAddingObject:) toMethodSelector:@selector(safe_arrayByAddingObject:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSArray0" fromMethodSelector:@selector(objectAtIndex:) toMethodSelector:@selector(array0_objectAtIndex:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSSingleObjectArrayI" fromMethodSelector:@selector(objectAtIndex:) toMethodSelector:@selector(array1_objectAtIndex:) isInstanceMethod:YES];
    });
}

- (instancetype)initWithObjects_safe:(id *)objects count:(NSUInteger)cnt
{
    NSUInteger newCnt = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        if (!objects[i]) {
            break;
        }
        newCnt++;
    }
    self = [self initWithObjects_safe:objects count:newCnt];
    return self;
}

- (id)safe_objectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return nil;
    }
    return [self safe_objectAtIndex:index];
}

- (id)array0_objectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return nil;
    }
    return [self array0_objectAtIndex:index];
}

- (id)array1_objectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return nil;
    }
    return [self array1_objectAtIndex:index];
}

- (NSArray *)safe_arrayByAddingObject:(id)object
{
    if (!object) {
        return self;
    }
    return [self safe_arrayByAddingObject:object];
}

@end

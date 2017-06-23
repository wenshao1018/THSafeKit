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
        
        [self exchangeImplementationsWithClass:@"__NSArray0" fromMethodSelector:@selector(arrayByAddingObject:) toMethodSelector:@selector(safe_arrayByAddingObject:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSSingleObjectArrayI" fromMethodSelector:@selector(arrayByAddingObject:) toMethodSelector:@selector(safe_arrayByAddingObject:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSArrayI" fromMethodSelector:@selector(arrayByAddingObject:) toMethodSelector:@selector(safe_arrayByAddingObject:) isInstanceMethod:YES];
        
        [self exchangeImplementationsWithClass:@"__NSArrayI" fromMethodSelector:@selector(objectAtIndex:) toMethodSelector:@selector(safe_objectAtIndex:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSArray0" fromMethodSelector:@selector(objectAtIndex:) toMethodSelector:@selector(array0_objectAtIndex:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSSingleObjectArrayI" fromMethodSelector:@selector(objectAtIndex:) toMethodSelector:@selector(array1_objectAtIndex:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSSingleObjectArrayI" fromMethodSelector:@selector(removeObjectAtIndex:) toMethodSelector:@selector(safe_removeObjectAtIndex:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSArray0" fromMethodSelector:@selector(removeObjectAtIndex:) toMethodSelector:@selector(safe_removeObjectAtIndex:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSArrayI" fromMethodSelector:@selector(removeObjectAtIndex:) toMethodSelector:@selector(safe_removeObjectAtIndex:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSSingleObjectArrayI" fromMethodSelector:@selector(removeAllObjects) toMethodSelector:@selector(safe_removeAllObjects) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSArray0" fromMethodSelector:@selector(removeAllObjects) toMethodSelector:@selector(safe_removeAllObjects) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSArrayI" fromMethodSelector:@selector(removeAllObjects) toMethodSelector:@selector(safe_removeAllObjects) isInstanceMethod:YES];
        
        [self exchangeImplementationsWithClass:@"__NSArray0" fromMethodSelector:@selector(addObject:) toMethodSelector:@selector(safe_addObject:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSArray0" fromMethodSelector:@selector(insertObject:atIndex:) toMethodSelector:@selector(safe_insertObject:atIndex:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSArray0" fromMethodSelector:@selector(replaceObjectAtIndex:withObject:) toMethodSelector:@selector(safe_replaceObjectAtIndex:withObject:) isInstanceMethod:YES];
        
        [self exchangeImplementationsWithClass:@"__NSSingleObjectArrayI" fromMethodSelector:@selector(addObject:) toMethodSelector:@selector(safe_addObject:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSSingleObjectArrayI" fromMethodSelector:@selector(insertObject:atIndex:) toMethodSelector:@selector(safe_insertObject:atIndex:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSSingleObjectArrayI" fromMethodSelector:@selector(replaceObjectAtIndex:withObject:) toMethodSelector:@selector(safe_replaceObjectAtIndex:withObject:) isInstanceMethod:YES];
        
        [self exchangeImplementationsWithClass:@"__NSArrayI" fromMethodSelector:@selector(addObject:) toMethodSelector:@selector(safe_addObject:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSArrayI" fromMethodSelector:@selector(insertObject:atIndex:) toMethodSelector:@selector(safe_insertObject:atIndex:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSArrayI" fromMethodSelector:@selector(replaceObjectAtIndex:withObject:) toMethodSelector:@selector(safe_replaceObjectAtIndex:withObject:) isInstanceMethod:YES];
    });
}

//不做处理,防止崩溃
- (void)safe_addObject:(id)anObject
{
    
}

//不做处理,防止崩溃
- (void)safe_insertObject:(id)object atIndex:(NSUInteger)index
{
    
}

//不做处理,防止崩溃
- (void)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    
}

//不做处理,防止崩溃
- (void)safe_removeAllObjects
{
    
}

//不做处理,防止崩溃
- (void)safe_removeObjectAtIndex:(NSUInteger)index
{
    
}

- (id)safe_objectAtIndex:(NSUInteger)index
{
    id object = nil;
    @try {
        object = [self safe_objectAtIndex:index];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    return object;
}

- (id)array0_objectAtIndex:(NSUInteger)index
{
    id object = nil;
    @try {
        object = [self array0_objectAtIndex:index];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    return object;
}

- (id)array1_objectAtIndex:(NSUInteger)index
{
    id object = nil;
    @try {
        object = [self array1_objectAtIndex:index];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    return object;
}

- (NSArray *)safe_arrayByAddingObject:(id)object
{
    id array = nil;
    @try {
        array = [self safe_arrayByAddingObject:object];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    return array;
}

@end

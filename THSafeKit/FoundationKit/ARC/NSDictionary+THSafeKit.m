//
//  NSDictionary+THSafeKit.m
//  Westore
//
//  Created by WenQing on 2017/5/31.
//  Copyright © 2017年 Rainbow Department Store Co., Ltd. All rights reserved.
//

#import "NSDictionary+THSafeKit.h"
#import "NSObject+THRuntime.h"

@implementation NSDictionary (THSafeKit)

+ (void) load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeImplementationsWithClass:@"__NSDictionary0" fromMethodSelector:@selector(initWithObjects:forKeys:count:) toMethodSelector:@selector(initWithObjects_safe:forKeys:count:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSDictionary0" fromMethodSelector:@selector(removeObjectForKey:) toMethodSelector:@selector(safe_removeObjectForKey:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSDictionary0" fromMethodSelector:@selector(setObject:forKey:) toMethodSelector:@selector(safe_setObject:forKey:) isInstanceMethod:YES];
        
        [self exchangeImplementationsWithClass:@"__NSSingleEntryDictionaryI" fromMethodSelector:@selector(initWithObjects:forKeys:count:) toMethodSelector:@selector(initWithObjects_safe:forKeys:count:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSSingleEntryDictionaryI" fromMethodSelector:@selector(removeObjectForKey:) toMethodSelector:@selector(safe_removeObjectForKey:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSSingleEntryDictionaryI" fromMethodSelector:@selector(setObject:forKey:) toMethodSelector:@selector(safe_setObject:forKey:) isInstanceMethod:YES];
        
        [self exchangeImplementationsWithClass:@"__NSDictionaryI" fromMethodSelector:@selector(initWithObjects:forKeys:count:) toMethodSelector:@selector(initWithObjects_safe:forKeys:count:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSDictionaryI" fromMethodSelector:@selector(removeObjectForKey:) toMethodSelector:@selector(safe_removeObjectForKey:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"__NSDictionaryI" fromMethodSelector:@selector(setObject:forKey:) toMethodSelector:@selector(safe_setObject:forKey:) isInstanceMethod:YES];
    });
}

//容错处理，防止不可变对象调用可变对象方法
- (void)safe_removeObjectForKey:(id)key
{
    
}

//容错处理，防止不可变对象调用可变对象方法
- (void)safe_setObject:(id)object forKey:(id <NSCopying>)key
{
    
}

- (instancetype)initWithObjects_safe:(id *)objects forKeys:(id<NSCopying> *)keys count:(NSUInteger)cnt
{
    id object = nil;
    @try {
        object = [self initWithObjects_safe:objects forKeys:keys count:cnt];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    return object;
}

@end

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

- (instancetype)initWithObjects_safe:(id *)objects forKeys:(id<NSCopying> *)keys count:(NSUInteger)cnt
{
    NSUInteger newCnt = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        if (!(keys[i] && objects[i])) {
            break;
        }
        newCnt++;
    }
    self = [self initWithObjects_safe:objects forKeys:keys count:newCnt];
    return self;
}

+ (void) load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeImplementationsWithClass:@"__NSPlaceholderDictionary" fromMethodSelector:@selector(initWithObjects:forKeys:count:) toMethodSelector:@selector(initWithObjects_safe:forKeys:count:) isInstanceMethod:YES];
    });
}

@end

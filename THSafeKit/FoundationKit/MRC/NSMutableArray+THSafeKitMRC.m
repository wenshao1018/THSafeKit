//
//  NSMutableArray+THSafeKitMRC.m
//  Westore
//
//  Created by WenQing on 2017/5/31.
//  Copyright © 2017年 Rainbow Department Store Co., Ltd. All rights reserved.
//

#import "NSMutableArray+THSafeKitMRC.h"
#import "NSObject+THRuntime.h"

///键盘显示的时候应用退到后台在arc下会导致crash
@implementation NSMutableArray (THSafeKitMRC)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeImplementationsWithClass:@"__NSArrayM" fromMethodSelector:@selector(objectAtIndex:) toMethodSelector:@selector(safe_objectAtIndex:) isInstanceMethod:YES];
    });
}

- (id)safe_objectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return nil;
    }
    return [self safe_objectAtIndex:index];
}

@end

//
//  UIView+THSafeKit.m
//  Westore
//
//  Created by WenQing on 2017/6/12.
//  Copyright © 2017年 Rainbow Department Store Co., Ltd. All rights reserved.
//

#import "UIView+THSafeKit.h"
#import "NSObject+THRuntime.h"

@implementation UIView (THSafeKit)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self exchangeImplementationsWithClass:@"UIView" fromMethodSelector:@selector(addSubview:) toMethodSelector:@selector(safe_addSubview:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"UIView" fromMethodSelector:@selector(insertSubview:atIndex:) toMethodSelector:@selector(safe_insertSubview:atIndex:) isInstanceMethod:YES];
    });
}

- (void)safe_addSubview:(UIView *)view
{
    @try {
        [self safe_addSubview:view];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_insertSubview:(UIView *)view atIndex:(NSInteger)index
{
    @try {
        [self safe_insertSubview:view atIndex:index];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

@end

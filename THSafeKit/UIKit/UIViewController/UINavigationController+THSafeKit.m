//
//  UINavigationController+THSafeKit.m
//  Westore
//
//  Created by WenQing on 2017/6/9.
//  Copyright © 2017年 Rainbow Department Store Co., Ltd. All rights reserved.
//

#import "UINavigationController+THSafeKit.h"
#import "NSObject+THRuntime.h"

@implementation UINavigationController (THSafeKit)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self exchangeImplementationsWithClass:@"UINavigationController" fromMethodSelector:@selector(popToViewController:animated:) toMethodSelector:@selector(safe_popToViewController:animated:) isInstanceMethod:YES];
    });
}

- (nullable NSArray<__kindof UIViewController *> *)safe_popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController && [self.viewControllers indexOfObject:viewController] != NSNotFound) {
       return  [self safe_popToViewController:viewController animated:animated];
    }
    [self popViewControllerAnimated:animated];
    return nil;
}

@end

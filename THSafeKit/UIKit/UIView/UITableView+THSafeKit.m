//
//  UITableView+THSafeKit.m
//  Westore
//
//  Created by WenQing on 2017/6/12.
//  Copyright © 2017年 Rainbow Department Store Co., Ltd. All rights reserved.
//

#import "UITableView+THSafeKit.h"
#import "NSObject+THRuntime.h"

@implementation UITableView (THSafeKit)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self exchangeImplementationsWithClass:@"UITableView" fromMethodSelector:@selector(reloadRowsAtIndexPaths:withRowAnimation:) toMethodSelector:@selector(safe_reloadRowsAtIndexPaths:withRowAnimation:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"UITableView" fromMethodSelector:@selector(deleteRowsAtIndexPaths:withRowAnimation:) toMethodSelector:@selector(safe_deleteRowsAtIndexPaths:withRowAnimation:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"UITableView" fromMethodSelector:@selector(reloadSections:withRowAnimation:) toMethodSelector:@selector(safe_reloadSections:withRowAnimation:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"UITableView" fromMethodSelector:@selector(deleteSections:withRowAnimation:) toMethodSelector:@selector(safe_deleteSections:withRowAnimation:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"UITableView" fromMethodSelector:@selector(moveRowAtIndexPath:toIndexPath:) toMethodSelector:@selector(safe_moveRowAtIndexPath:toIndexPath:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"UITableView" fromMethodSelector:@selector(moveSection:toSection:) toMethodSelector:@selector(safe_moveSection:toSection:) isInstanceMethod:YES];
    });
}

- (void)safe_reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    @try {
        [self safe_reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    @try {
        [self safe_deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
{
    @try {
        [self safe_deleteSections:sections withRowAnimation:animation];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
{
    @try {
        [self safe_reloadSections:sections withRowAnimation:animation];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath
{
    @try {
        [self safe_moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_moveSection:(NSInteger)section toSection:(NSInteger)newSection
{
    @try {
        [self safe_moveSection:section toSection:newSection];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

@end

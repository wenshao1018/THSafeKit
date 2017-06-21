//
//  UICollectionView+THSafeKit.m
//  Westore
//
//  Created by WenQing on 2017/6/21.
//  Copyright © 2017年 Rainbow Department Store Co., Ltd. All rights reserved.
//

#import "UICollectionView+THSafeKit.h"
#import "NSObject+THRuntime.h"

@implementation UICollectionView (THSafeKit)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self exchangeImplementationsWithClass:@"UICollectionView" fromMethodSelector:@selector(scrollToItemAtIndexPath:atScrollPosition:animated:) toMethodSelector:@selector(safe_scrollToItemAtIndexPath:atScrollPosition:animated:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"UICollectionView" fromMethodSelector:@selector(insertSections:) toMethodSelector:@selector(safe_insertSections:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"UICollectionView" fromMethodSelector:@selector(deleteSections:) toMethodSelector:@selector(safe_deleteSections:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"UICollectionView" fromMethodSelector:@selector(reloadSections:) toMethodSelector:@selector(safe_reloadSections:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"UICollectionView" fromMethodSelector:@selector(moveSection:toSection:) toMethodSelector:@selector(safe_moveSection:toSection:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"UICollectionView" fromMethodSelector:@selector(insertItemsAtIndexPaths:) toMethodSelector:@selector(safe_insertItemsAtIndexPaths:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"UICollectionView" fromMethodSelector:@selector(deleteItemsAtIndexPaths:) toMethodSelector:@selector(safe_deleteItemsAtIndexPaths:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"UICollectionView" fromMethodSelector:@selector(reloadItemsAtIndexPaths:) toMethodSelector:@selector(safe_reloadItemsAtIndexPaths:) isInstanceMethod:YES];
        [self exchangeImplementationsWithClass:@"UICollectionView" fromMethodSelector:@selector(moveItemAtIndexPath:toIndexPath:) toMethodSelector:@selector(safe_moveItemAtIndexPath:toIndexPath:) isInstanceMethod:YES];
    });
}

- (void)safe_scrollToItemAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UICollectionViewScrollPosition)scrollPosition animated:(BOOL)animated
{
    @try {
        [self safe_scrollToItemAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_insertSections:(NSIndexSet *)sections
{
    @try {
        [self safe_insertSections:sections];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_deleteSections:(NSIndexSet *)sections
{
    @try {
        [self safe_deleteSections:sections];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_reloadSections:(NSIndexSet *)sections
{
    @try {
        [self safe_reloadSections:sections];
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

- (void)safe_insertItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
{
    @try {
        [self safe_insertItemsAtIndexPaths:indexPaths];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_deleteItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
{
    @try {
        [self safe_deleteItemsAtIndexPaths:indexPaths];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_reloadItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
{
    @try {
        [self safe_reloadItemsAtIndexPaths:indexPaths];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)safe_moveItemAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath
{
    @try {
        [self safe_moveItemAtIndexPath:indexPath toIndexPath:newIndexPath];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

@end

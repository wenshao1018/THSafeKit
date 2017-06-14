//
//  ViewController.m
//  THSafeKitDemo
//
//  Created by WenQing on 2017/6/9.
//  Copyright © 2017年 com.rainbow. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
}


- (UIScrollView *)scrollView
{
    if (_scrollView) {
        return _scrollView;
    }
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-50)];
    _scrollView.backgroundColor = [UIColor redColor];
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 2000);
    return _scrollView;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-50) animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.scrollView = nil;
    });
}

@end

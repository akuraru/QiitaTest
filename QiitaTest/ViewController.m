//
//  ViewController.m
//  QiitaTest
//
//  Created by akuraru on 2013/11/22.
//  Copyright (c) 2013年 akuraru. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *checkView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGPoint point = [self absPoint:_checkView];
    NSLog(@"%@", [NSValue valueWithCGPoint:point]);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    CGPoint point = [self absPoint:_checkView];
    NSLog(@"%@", [NSValue valueWithCGPoint:point]);
}
- (CGPoint)absPoint:(UIView *) view {
    CGPoint ret = CGPointMake(view.frame.origin.x, view.frame.origin.y);
    if ([view superview] != nil) {
        CGPoint addPoint = [self absPoint:[view superview]];
        ret = CGPointMake(ret.x + addPoint.x, ret.y + addPoint.y);
    }
    return ret;
}

@end

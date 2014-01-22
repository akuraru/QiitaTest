//
//  BeyondSegueViewController.m
//  QiitaTest
//
//  Created by akuraru on 2014/01/22.
//  Copyright (c) 2014年 akuraru. All rights reserved.
//

#import "BeyondSegueViewController.h"
#import "MainEntry.h"

@implementation BeyondSegueViewController

- (IBAction)touchtToD:(id)sender {
    [[MainEntry sharedEntry] moveToD:self.navigationController];
}

@end

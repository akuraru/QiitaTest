//
//  MainEntry.m
//  QiitaTest
//
//  Created by akuraru on 2014/01/22.
//  Copyright (c) 2014年 akuraru. All rights reserved.
//

#import "MainEntry.h"

@implementation MainEntry{
    UIStoryboard *_storyboard;
}

+ (instancetype)sharedEntry {
    static id _sharedEntry = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedEntry = self.new;
    });
    
    return _sharedEntry;
}

- (id)init {
    self = [super init];
    if (self) {
        _storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    }
    return self;
}

- (id)viewController:(NSString *)identifier {
    return [_storyboard instantiateViewControllerWithIdentifier:identifier];
}

- (void)moveToD:(UINavigationController *)controller {
    [controller popToRootViewControllerAnimated:NO];
    [controller pushViewController:[self viewController:@"C"] animated:NO];
    [controller pushViewController:[self viewController:@"D"] animated:YES];
}

@end

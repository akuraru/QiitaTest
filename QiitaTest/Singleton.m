//
// Created by akuraru on 2014/04/15.
// Copyright (c) 2014 akuraru. All rights reserved.
//

#import "Singleton.h"


@implementation Singleton {

}

+ (instancetype)sharedManager {
    static id manager_ = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager_ = [[self alloc] init];
    });
    return manager_;
}

@end
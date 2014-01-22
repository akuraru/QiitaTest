//
//  MainEntry.h
//  QiitaTest
//
//  Created by akuraru on 2014/01/22.
//  Copyright (c) 2014年 akuraru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainEntry : NSObject

+ (instancetype)sharedEntry;

- (void)moveToD:(UINavigationController *)controller;
@end

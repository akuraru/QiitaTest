//
// Created by akuraru on 2014/04/15.
// Copyright (c) 2014 akuraru. All rights reserved.
//

#import "OtherClass.h"
#import "Singleton.h"


@implementation OtherClass {

}

- (id)singleton {
    return [Singleton sharedManager];
}
@end
#import "Kiwi.h"
#import "Singleton.h"
#import "OtherClass.h"

SPEC_BEGIN(SingletonSpec)
describe(@"Singleton", ^{
    let(s,^{ return [Singleton sharedManager];});
    
    it(@"isEqual", ^{
        BOOL isEqualSingleton = s == [[[OtherClass alloc] init] singleton];
        [[theValue(isEqualSingleton) should] equal:theValue(YES)];
    });
    it(@"isKindOfClass", ^{
        BOOL isKindOfClass = [s isKindOfClass:[[[[OtherClass alloc] init] singleton] class]];
        [[theValue(isKindOfClass) should] equal:theValue(YES)];
    });
});
SPEC_END

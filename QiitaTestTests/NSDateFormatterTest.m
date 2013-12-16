#import <Kiwi/Kiwi.h>
#import <AZDateBuilder/NSDate+AZDateBuilder.h>

SPEC_BEGIN(NSDateFormatterTest)
describe(@"", ^{
    __block NSDateFormatter *formatter;
    beforeEach(^{
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd";
        formatter.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    });
    it(@"1970", ^{
        NSDate *date1970 = [NSDate AZ_dateByUnit:@{
            AZ_DateUnit.year : @1970,
            AZ_DateUnit.month : @1,
            AZ_DateUnit.day : @1,
        }];
        NSDate *result = [formatter dateFromString:@"1970-01-01"];
        [[result should] equal:date1970];
    });
    it(@"2010", ^{
        NSDate *date2010 = [NSDate AZ_dateByUnit:@{
            AZ_DateUnit.year : @2010,
            AZ_DateUnit.month : @10,
            AZ_DateUnit.day : @10,
        }];
        NSDate *result = [formatter dateFromString:@"2010-10-10"];
        [[result should] equal:date2010];
    });
    it(@"9999", ^{
        NSDate *date9999 = [NSDate AZ_dateByUnit:@{
            AZ_DateUnit.year : @9999,
            AZ_DateUnit.month : @12,
            AZ_DateUnit.day : @31,
        }];
        NSDate *result = [formatter dateFromString:@"9999-12-31"];
        [[result should] equal:date9999];
    });
});
SPEC_END
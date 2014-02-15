#import <AZDateBuilder/NSDate+AZDateBuilder.h>
#import <NSDate-Escort/NSDate+Escort.h>
#import "Kiwi.h"

@interface NSDate (dateOfNextWeekday)
- (NSDate *)dateOfNextWeekday:(NSInteger)weekday;
@end

@implementation NSDate (dateOfNextWeekday)
- (NSDate *)dateOfNextWeekday:(NSInteger)weekday {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    calendar.locale = [NSLocale currentLocale];
    NSDateComponents *dateComps = [calendar components:NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | kCFCalendarUnitWeekdayOrdinal fromDate:self];
    dateComps.weekday = weekday;
    NSDate *day = [calendar dateFromComponents:dateComps];

    if ([day compare:self] == NSOrderedDescending) {
        return day;
    } else {
        return [day dateByAddingTimeInterval:604800];
    }
}
@end

SPEC_BEGIN(DateOfNextWookday)
context(@"baseDay is Wednesday", ^{
    __block NSDate *baseDate;
    beforeEach(^{
        baseDate = [NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year : @2010,
                AZ_DateUnit.month : @10,
                AZ_DateUnit.day : @13,
                AZ_DateUnit.hour : @20,
        }];
    });
    it(@"next sunday", ^{
        [[[baseDate dateOfNextWeekday:1] should] equal:[NSDate AZ_dateByUnit:@{
            AZ_DateUnit.year : @2010,
            AZ_DateUnit.month : @10,
            AZ_DateUnit.day : @17,
        }]];
    });
    it(@"next wednsday", ^{
        [[[baseDate dateOfNextWeekday:4] should] equal:[NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year : @2010,
                AZ_DateUnit.month : @10,
                AZ_DateUnit.day : @20,
        }]];
    });
    it(@"next thursday", ^{
        [[[baseDate dateOfNextWeekday:5] should] equal:[NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year : @2010,
                AZ_DateUnit.month : @10,
                AZ_DateUnit.day : @14,
        }]];
    });
});
SPEC_END

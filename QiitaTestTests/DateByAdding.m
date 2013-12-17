#import <Kiwi/Kiwi.h>
#import <NSDate+Escort.h>
#import <NSDate+AZDateBuilder.h>

SPEC_BEGIN(DateByAdding)
describe(@"", ^{
    __block NSDate *baseDate;
    __block NSCalendar *calendar;
    NSCalendarUnit allUnit = (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit);
    beforeAll(^{
        baseDate = [NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year : @2010,
                AZ_DateUnit.month : @10,
                AZ_DateUnit.day : @10,
                AZ_DateUnit.hour : @14,
                AZ_DateUnit.minute : @30,
        }];
        calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        calendar.locale = [NSLocale currentLocale];
    });
    context(@"Adding minute 15", ^{
        __block NSDate *answer;
        beforeAll(^{
            answer = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @14,
                    AZ_DateUnit.minute : @45,
            }];
        });
        it(@"use NSDateComponents", ^{
            NSDateComponents *components = [calendar components:allUnit fromDate:baseDate];
            components.minute += 15;
            NSDate *result = [calendar dateFromComponents:components];

            [[result should] equal:answer];
        });
        it(@"use TimeInterval", ^{
            NSDate *result = [baseDate dateByAddingTimeInterval:60 * 15];

            [[result should] equal:answer];
        });
        it(@"use NSDate+Escort", ^{
            NSDate *result = [baseDate dateByAddingMinutes:15];
            
            [[result should] equal:answer];
        });
    });
    context(@"Adding month 1", ^{
        __block NSDate *answer;
        beforeAll(^{
            answer = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @11,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @14,
                    AZ_DateUnit.minute : @30,
            }];
        });
        it(@"use NSDateComponents", ^{
            NSDateComponents *components = [calendar components:allUnit fromDate:baseDate];
            components.month += 1;
            NSDate *result = [calendar dateFromComponents:components];

            [[result should] equal:answer];
        });
        it(@"use TimeInterval", ^{
            NSDate *result = [baseDate dateByAddingTimeInterval:60 * 60 * 24 * 31];

            [[result should] equal:answer];
        });
        it(@"use NSDate+Escort", ^{
            NSDate *result = [baseDate dateByAddingMonths:1];
            
            [[result should] equal:answer];
        });
    });
    context(@"Adding year 10", ^{
        __block NSDate *answer;
        beforeAll(^{
            answer = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2020,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @14,
                    AZ_DateUnit.minute : @30,
            }];
        });
        it(@"use NSDateComponents", ^{
            NSDateComponents *components = [calendar components:allUnit fromDate:baseDate];
            components.year += 10;
            NSDate *result = [calendar dateFromComponents:components];

            [[result should] equal:answer];
        });
        it(@"use TimeInterval", ^{
            NSDate *result = [baseDate dateByAddingTimeInterval:(60 * 60 * 24) * (365 * 10 + 3)];

            [[result should] equal:answer];
        });
        it(@"use NSDate+Escort", ^{
            NSDate *result = [baseDate dateByAddingYears:10];
            
            [[result should] equal:answer];
        });
    });
});
SPEC_END
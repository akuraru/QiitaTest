#import <Kiwi/Kiwi.h>
#import <AZDateBuilder/NSDate+AZDateBuilder.h>

SPEC_BEGIN(DateIgnoreTest)
describe(@"", ^{
    __block NSDate *date;
    beforeEach(^{
        date = [NSDate AZ_dateByUnit:@{
            AZ_DateUnit.year : @2010,
            AZ_DateUnit.month : @10,
            AZ_DateUnit.day : @10,
            AZ_DateUnit.hour : @14,
            AZ_DateUnit.minute : @30,
        }];
    });
    it(@"ignore Time", ^{
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        calendar.locale = [NSLocale currentLocale];
        NSDateComponents *dateComps = [calendar components:NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:date];
        
        NSDate *result = [calendar dateFromComponents:dateComps];
        
        NSDate *ignoreTime = [NSDate AZ_dateByUnit:@{
            AZ_DateUnit.year : @2010,
            AZ_DateUnit.month : @10,
            AZ_DateUnit.day : @10,
        }];
        
        [[result should] equal:ignoreTime];
    });
    it(@"2010", ^{
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        calendar.locale = [NSLocale currentLocale];
        NSDateComponents *dateComps = [calendar components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:date];
        
        NSDate *result = [calendar dateFromComponents:dateComps];
        
        NSDate *ignoreDay = [NSDate AZ_dateByUnit:@{
            AZ_DateUnit.hour : @14,
            AZ_DateUnit.minute : @30,
        }];
        
        [[result should] equal:ignoreDay];
    });
});
SPEC_END
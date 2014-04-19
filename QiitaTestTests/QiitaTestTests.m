#import <Kiwi/Kiwi.h>
#import <NSDate+Escort.h>
#import <NSDate+AZDateBuilder.h>

SPEC_BEGIN(NSDateMakeTest)
describe(@"", ^{
    __block NSCalendar *calender;
    __block NSDateFormatter *formatter;
    beforeAll(^{
        calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        calender.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
        
        formatter = [[NSDateFormatter alloc] init];
        formatter.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        formatter.locale = [NSLocale systemLocale];
        formatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    });
    context(@"use NSDateComponents", ^{
        it(@"1970-01-01", ^{
            NSDateComponents *components = [[NSDateComponents alloc] init];
            components.year = 1970;
            components.month = 1;
            components.day = 1;
            NSDate *date = [calender dateFromComponents:components];
            
            [[[formatter stringFromDate:date] should] equal:@"1970-01-01 00:00:00"];
        });
        it(@"2010-10-10", ^{
            NSDateComponents *components = [[NSDateComponents alloc] init];
            components.year = 2010;
            components.month = 10;
            components.day = 10;
            NSDate *date = [calender dateFromComponents:components];
            
            [[[formatter stringFromDate:date] should] equal:@"2010-10-10 00:00:00"];
        });
        it(@"9999-12-31", ^{
            NSDateComponents *components = [[NSDateComponents alloc] init];
            components.year = 9999;
            components.month = 12;
            components.day = 31;
            NSDate *date = [calender dateFromComponents:components];
            
            [[[formatter stringFromDate:date] should] equal:@"9999-12-31 00:00:00"];
        });
    });
    context(@"use NSCalender japanese", ^{
        __block NSCalendar *jaCalender;
        beforeAll(^{
            jaCalender = [[NSCalendar alloc] initWithCalendarIdentifier:NSJapaneseCalendar];
            jaCalender.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Tokyo"];
        });
        it(@"1970-01-01", ^{
            NSDateComponents *components = [[NSDateComponents alloc] init];
            components.era = 234;
            components.year = 45;
            components.month = 1;
            components.day = 1;
            components.hour = 9;
            NSDate *date = [jaCalender dateFromComponents:components];
            
            [[[formatter stringFromDate:date] should] equal:@"1970-01-01 00:00:00"];
        });
        it(@"2010-10-10", ^{
            NSDateComponents *components = [[NSDateComponents alloc] init];
            components.year = 22;
            components.month = 10;
            components.day = 10;
            components.hour = 9;
            NSDate *date = [jaCalender dateFromComponents:components];
            
            [[[formatter stringFromDate:date] should] equal:@"2010-10-10 00:00:00"];
        });
        it(@"9999-12-31", ^{
            NSDateComponents *components = [[NSDateComponents alloc] init];
            components.year = 8011;
            components.month = 12;
            components.day = 31;
            components.hour = 9;
            NSDate *date = [jaCalender dateFromComponents:components];
            
            [[[formatter stringFromDate:date] should] equal:@"9999-12-31 00:00:00"];
        });
    });
    context(@"use TimeInterval", ^{
        it(@"1970-01-01", ^{
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:0];
            
            [[[formatter stringFromDate:date] should] equal:@"1970-01-01 00:00:00"];
        });
        it(@"2010-10-10", ^{
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:1286668800];
            
            [[[formatter stringFromDate:date] should] equal:@"2010-10-10 00:00:00"];
        });
        it(@"9999-12-31", ^{
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:253402214400];
            
            [[[formatter stringFromDate:date] should] equal:@"9999-12-31 00:00:00"];
        });
    });
    context(@"use NSDate+Escort", ^{
        it(@"2010-10-10", ^{
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:0];
            date = [[[date dateByAddingYears:40] dateByAddingMonths:9] dateByAddingDays:9];
            
            [[[formatter stringFromDate:date] should] equal:@"2010-10-10 00:00:00"];
        });
        it(@"9999-12-31", ^{
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:0];
            date = [[[date dateByAddingYears:8029] dateByAddingMonths:11] dateByAddingDays:30];
            
            [[[formatter stringFromDate:date] should] equal:@"9999-12-31 00:00:00"];
        });
    });
    context(@"use AZDateBuilder", ^{
        it(@"1970-01-01", ^{
            NSDate *date = [NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year : @1970,
                AZ_DateUnit.month : @1,
                AZ_DateUnit.day : @1,
                AZ_DateUnit.hour : @9,
            }];
            
            [[[formatter stringFromDate:date] should] equal:@"1970-01-01 00:00:00"];
        });
        it(@"2010-10-10", ^{
            NSDate *date = [NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year : @2010,
                AZ_DateUnit.month : @10,
                AZ_DateUnit.day : @10,
                AZ_DateUnit.hour : @9,
            }];
            
            [[[formatter stringFromDate:date] should] equal:@"2010-10-10 00:00:00"];
        });
        it(@"9999-12-31", ^{
            NSDate *date = [NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year : @9999,
                AZ_DateUnit.month : @12,
                AZ_DateUnit.day : @31,
                AZ_DateUnit.hour : @9,
            }];
            
            [[[formatter stringFromDate:date] should] equal:@"9999-12-31 00:00:00"];
        });
    });
    it(@"NSTimeZone", ^{
        [[[[[NSCalendar alloc] init] timeZone] should] beNil];
    });
    it(@"NSCalender", ^{
        [[@([[[NSDateComponents alloc] init] era]) should] equal:@(NSNotFound)];
    });
});
SPEC_END
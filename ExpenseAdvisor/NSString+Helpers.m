//
//  NSString+Helpers.m
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/2/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import "NSString+Helpers.h"

@implementation NSString (Helpers)

- (NSString *)stringByConvertToShekelCurrency {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    formatter.minimumFractionDigits = 2;
    formatter.maximumFractionDigits = 2;
    NSString *strValue = [formatter stringFromNumber:[NSNumber numberWithDouble:[self doubleValue]]];
    strValue = [NSString stringWithFormat:@"₪%@", strValue];
    return strValue;
}


- (NSString *)stringByFormattedDate {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyymmdd"];
    NSDate *date = [format dateFromString:self];
    
    [format setDateFormat:@"dd/mm/yyyy"];
    return [format stringFromDate:date];
}


@end

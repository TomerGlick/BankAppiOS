//
//  NSString+Helpers.h
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/2/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Helpers)

// gets number and converts to shekel format
- (NSString*) stringByConvertToShekelCurrency;
// gets string date in yyyyMMdd and converts to dd/mm/yyyy
- (NSString *)stringByFormattedDate;

@end

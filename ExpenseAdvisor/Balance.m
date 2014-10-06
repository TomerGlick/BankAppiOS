//
//  Balance.m
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 9/8/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import "Balance.h"

@implementation Balance

- (id)initWithData:(NSDictionary*)balanceData {
    if (self = [super init])
    {
        self.accountNumber = [NSString stringWithFormat:@"%d", [[balanceData objectForKey:@"accountNumber"] intValue]];
        self.balanceId = [NSString stringWithFormat:@"%d", [[balanceData objectForKey:@"balanceId"] intValue]];
        self.capitalMarketBalance = [NSString stringWithFormat:@"%d", [[balanceData objectForKey:@"capitalMarketBalance"] intValue]];
        self.creditBalance = [NSString stringWithFormat:@"%d", [[balanceData objectForKey:@"creditBalance"] intValue]];
        self.depositBalance = [NSString stringWithFormat:@"%d", [[balanceData objectForKey:@"depositBalance"] intValue]];
        self.dollarBalance = [NSString stringWithFormat:@"%d", [[balanceData objectForKey:@"dollarBalance"] intValue]];
        self.euroBalance = [NSString stringWithFormat:@"%d", [[balanceData objectForKey:@"euroBalance"] intValue]];
        self.nisBalance = [NSString stringWithFormat:@"%d", [[balanceData objectForKey:@"nisBalance"] intValue]];
        self.validityDate = [balanceData objectForKey:@"validityDate"];
    }
    return self;
}



@end

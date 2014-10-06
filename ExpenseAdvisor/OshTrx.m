//
//  OshTrx.m
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/5/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import "OshTrx.h"

@implementation OshTrx

- (id)initWithData:(NSDictionary*)creditCardTrxData {
    if (self = [super init])
    {    
        self.accountNumber = [NSString stringWithFormat:@"%d", [[creditCardTrxData objectForKey:@"accountNumber"] intValue]];
        self.creditDebitCode   = [creditCardTrxData objectForKey:@"creditDebitCode"];
        self.transactionAmount = [NSNumber numberWithDouble:[[creditCardTrxData objectForKey:@"transactionAmount"] doubleValue]];
        self.transactionCurrency = [creditCardTrxData objectForKey:@"transactionCurrency"];
        self.transactionDate = [creditCardTrxData objectForKey:@"transactionDate"];
        self.transactionDescription = [creditCardTrxData objectForKey:@"transactionDescription"];
        self.transactionGroupDescription = [creditCardTrxData objectForKey:@"transactionGroupDescription"];
        self.transactionId = [creditCardTrxData objectForKey:@"transactionId"];
        self.transactionTime = [creditCardTrxData objectForKey:@"transactionTime"];
    }
    return self;
}

@end

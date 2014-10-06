//
//  CreditCardTrx.m
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/2/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import "CreditCardTrx.h"

@implementation CreditCardTrx

- (id)initWithData:(NSDictionary*)creditCardTrxData {
    if (self = [super init])
    {
        self.accountNumber = [NSString stringWithFormat:@"%d", [[creditCardTrxData objectForKey:@"accountNumber"] intValue]];
        self.businessLocation   = [creditCardTrxData objectForKey:@"businessLocation"];
        self.businessName       = [creditCardTrxData objectForKey:@"businessName"];
        self.chargeId = [NSString stringWithFormat:@"%d", [[creditCardTrxData objectForKey:@"chargeId"] intValue]];
        self.numberOfPaymentsInPurchase = [NSString stringWithFormat:@"%d", [[creditCardTrxData objectForKey:@"numberOfPaymentsInPurchase"] intValue]];
        self.paymentCategory       = [creditCardTrxData objectForKey:@"paymentCategory"];
        self.purchaseAmount       = [NSNumber numberWithDouble:[[creditCardTrxData objectForKey:@"purchaseAmount"] doubleValue]];
        self.purchaseDate       = [creditCardTrxData objectForKey:@"purchaseDate"];
        self.purchaseTime       = [creditCardTrxData objectForKey:@"purchaseTime"];
    }
    return self;
}

@end

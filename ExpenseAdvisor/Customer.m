//
//  Customer.m
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 9/8/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import "Customer.h"

@implementation Customer

// init the customer with all of his data
- (id)initWithData:(NSDictionary *)customerData {
    
    if (self = [super init])
    {
        // personal details (bank account, addresx exc')
        NSDictionary *accountData = [customerData objectForKey:@"account"];
        self.account = [[Account alloc] initWithData:accountData];
        self.sections = 1;
        
        // customer's balance (all zeros from server)
        NSDictionary *balanceData = [customerData objectForKey:@"balance"];
        if (balanceData)
        {
            self.balance = [[Balance alloc] initWithData:balanceData];
            self.sections++;
        }
        
        
        // credit card transactions
        NSDictionary *creditCardTrxData = [customerData objectForKey:@"creditCardsList"];
        if (creditCardTrxData)
        {
            NSMutableArray *arrTempTrx = [NSMutableArray array];
            for (NSDictionary *dicSingleTrx in creditCardTrxData)
            {
                CreditCardTrx *trx = [[CreditCardTrx alloc] initWithData:dicSingleTrx];
                [arrTempTrx addObject:trx];
            }
            self.arrCreditCardTransactions = [NSArray arrayWithArray:arrTempTrx];
        }
        
        // osh transactions
        NSDictionary *oshTrxData = [customerData objectForKey:@"transactionsList"];
        if (oshTrxData)
        {
            NSMutableArray *arrTempTrx = [NSMutableArray array];
            for (NSDictionary *dicSingleTrx in oshTrxData)
            {
                OshTrx *trx = [[OshTrx alloc] initWithData:dicSingleTrx];
                [arrTempTrx addObject:trx];
            }
            self.arrOshTransactions = [NSArray arrayWithArray:arrTempTrx];
        }
    }
    return self;

    
    
}


@end

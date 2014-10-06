//
//  Customer.h
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 9/8/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"
#import "Balance.h"
#import "CreditCardTrx.h"
#import "OshTrx.h"

@interface Customer : NSObject

- (id)initWithData:(NSDictionary*)customerData;

@property (nonatomic, strong) Account *account;
@property (nonatomic, strong) Balance *balance;
@property (nonatomic, strong) NSArray *arrCreditCardTransactions;
@property (nonatomic, strong) NSArray *arrOshTransactions;
@property (nonatomic) int sections;

@end

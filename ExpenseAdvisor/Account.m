//
//  Account.m
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 9/8/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import "Account.h"

@implementation Account

- (id)initWithData:(NSDictionary*)accountData {
    if (self = [super init])
    {
        self.accountNumber = [NSString stringWithFormat:@"%d", [[accountData objectForKey:@"accountNumber"] intValue]];
        self.accountOpenDate = [accountData objectForKey:@"accountOpenDate"];
        self.accountOwnerAddress = [accountData objectForKey:@"accountOwnerAddress"];
        self.accountTypeDescription = [accountData objectForKey:@"accountTypeDescription"];
        self.branchCity = [accountData objectForKey:@"branchCity"];
        self.branchName = [accountData objectForKey:@"branchName"];
        self.branchNumber = [accountData objectForKey:@"branchNumber"];
        self.customerAge = [NSString stringWithFormat:@"%d", [[accountData objectForKey:@"customerAge"] intValue]];
        self.customerGender = [accountData objectForKey:@"customerGender"];
        self.customerName = [accountData objectForKey:@"customerName"];
        self.languagePreference = [accountData objectForKey:@"languagePreference"];
    }
    return self;
}

@end

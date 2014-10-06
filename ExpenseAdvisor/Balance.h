//
//  Balance.h
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 9/8/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Balance : NSObject

- (id)initWithData:(NSDictionary*)accountData;

@property (nonatomic, strong) NSString *accountNumber;
@property (nonatomic, strong) NSString *balanceId;
@property (nonatomic, strong) NSString *capitalMarketBalance;
@property (nonatomic, strong) NSString *creditBalance;
@property (nonatomic, strong) NSString *depositBalance;
@property (nonatomic, strong) NSString *dollarBalance;
@property (nonatomic, strong) NSString *euroBalance;
@property (nonatomic, strong) NSString *nisBalance;
@property (nonatomic, strong) NSString *validityDate;

@end

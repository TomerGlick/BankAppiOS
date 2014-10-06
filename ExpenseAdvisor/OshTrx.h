//
//  OshTrx.h
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/5/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OshTrx : NSObject

- (id)initWithData:(NSDictionary*)creditCardTrxData;

@property (nonatomic, strong) NSString *accountNumber;
@property (nonatomic, strong) NSString *creditDebitCode;
@property (nonatomic, strong) NSNumber *transactionAmount;
@property (nonatomic, strong) NSString *transactionCurrency;
@property (nonatomic, strong) NSString *transactionDate;
@property (nonatomic, strong) NSString *transactionDescription;
@property (nonatomic, strong) NSString *transactionGroupDescription;
@property (nonatomic, strong) NSString *transactionId;
@property (nonatomic, strong) NSString *transactionTime;

@end

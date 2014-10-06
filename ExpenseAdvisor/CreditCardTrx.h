//
//  CreditCardTrx.h
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/2/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreditCardTrx : NSObject

- (id)initWithData:(NSDictionary*)creditCardTrxData;

@property (nonatomic, strong) NSString *accountNumber;
@property (nonatomic, strong) NSString *businessLocation;
@property (nonatomic, strong) NSString *businessName;
@property (nonatomic, strong) NSString *chargeId;
@property (nonatomic, strong) NSString *numberOfPaymentsInPurchase;
@property (nonatomic, strong) NSString *paymentCategory;
@property (nonatomic, strong) NSNumber *purchaseAmount;
@property (nonatomic, strong) NSString *purchaseDate;
@property (nonatomic, strong) NSString *purchaseTime;

@end

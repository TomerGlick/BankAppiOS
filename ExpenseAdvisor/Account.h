//
//  Account.h
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 9/8/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject

- (id)initWithData:(NSDictionary*)accountData;

@property (nonatomic, strong) NSString *accountNumber;
@property (nonatomic, strong) NSString *accountOpenDate;
@property (nonatomic, strong) NSString *accountOwnerAddress;
@property (nonatomic, strong) NSString *accountTypeDescription;
@property (nonatomic, strong) NSString *branchCity;
@property (nonatomic, strong) NSString *branchName;
@property (nonatomic, strong) NSString *branchNumber;
@property (nonatomic, strong) NSString *customerAge;
@property (nonatomic, strong) NSString *customerGender;
@property (nonatomic, strong) NSString *customerName;
@property (nonatomic, strong) NSString *languagePreference;

@end

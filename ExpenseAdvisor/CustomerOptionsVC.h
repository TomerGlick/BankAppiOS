//
//  CustomerOptionsVC.h
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/1/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestData.h"
#import "Customer.h"
#import "Account.h"

@interface CustomerOptionsVC : UICollectionViewController < RestDataProtocol> {
    Customer *fetchedCustomer;
}

@property (nonatomic, strong) NSString *accountNumber;

@end

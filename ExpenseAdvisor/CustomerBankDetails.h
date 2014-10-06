//
//  CustomerOsh.h
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/1/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Customer.h"

@interface CustomerBankDetails : UITableViewController {
    Customer *fetchedCustomer;
}

@property (nonatomic, strong) Customer *fetchedCustomer;

@end

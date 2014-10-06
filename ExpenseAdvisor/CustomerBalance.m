//
//  CustomerBalance.m
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/1/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import "CustomerBalance.h"

@implementation CustomerBalance
@synthesize fetchedCustomer;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ריכוז יתרות";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (NSString*) getTitleByIndex:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            return @"מזהה";
            break;
        case 1:
            return @"שוק ההון";
            break;
        case 2:
            return @"אשראי";
            break;
        case 3:
            return @"פיקדונות";
            break;
        case 4:
            return @"דולר";
            break;
        case 5:
            return @"אירו";
            break;
        case 6:
            return @"שקל";
            break;
        case 7:
            return @"ת. נכונות";
            break;
        default:
            return @"";
            break;
    }
}


- (NSString*) getValueByIndex:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            return fetchedCustomer.balance.balanceId;
            break;
        case 1:
            return fetchedCustomer.balance.capitalMarketBalance;
            break;
        case 2:
            return fetchedCustomer.balance.creditBalance;
            break;
        case 3:
            return fetchedCustomer.balance.depositBalance;
            break;
        case 4:
            return fetchedCustomer.balance.dollarBalance;
            break;
        case 5:
            return fetchedCustomer.balance.euroBalance;
            break;
        case 6:
            return fetchedCustomer.balance.nisBalance;
            break;
        case 7:
            return fetchedCustomer.balance.validityDate;
            break;
        default:
            return @"";
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AccountDetailCell"];
    if (!cell)
    {
        cell =    [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2
                                         reuseIdentifier:@"AccountDetailCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.detailTextLabel.text = [self getTitleByIndex:indexPath];
    cell.textLabel.text = [self getValueByIndex:indexPath];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

@end

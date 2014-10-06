//
//  CustomerOsh.m
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/1/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import "CustomerBankDetails.h"

@implementation CustomerBankDetails
@synthesize fetchedCustomer;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"פרטי החשבון";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 11;
}

- (NSString*) getTitleByIndex:(NSIndexPath *)indexPath {

    switch (indexPath.row) {
        case 0:
            return @"מספר חשבון";
            break;
        case 1:
            return @"ת. פתיחה";
            break;
        case 2:
            return @"כתובת הלקוח";
            break;
        case 3:
            return @"סוג חשבון";
            break;
        case 4:
            return @"עיר הסניף";
            break;
        case 5:
            return @"שם הסניף";
            break;
        case 6:
            return @"מספר הסניף";
            break;
        case 7:
            return @"גיל הלקוח";
            break;
        case 8:
            return @"מגדר הלקוח";
            break;
        case 9:
            return @"שם הלקוח";
            break;
        case 10:
            return @"שפה מועדפת";
            break;
        default:
            return @"";
            break;
    }
}
- (NSString*) getValueByIndex:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
            return fetchedCustomer.account.accountNumber;
            break;
        case 1:
            return fetchedCustomer.account.accountOpenDate;
            break;
        case 2:
            return fetchedCustomer.account.accountOwnerAddress;
            break;
        case 3:
            return fetchedCustomer.account.accountTypeDescription;
            break;
        case 4:
            return fetchedCustomer.account.branchCity;
            break;
        case 5:
            return fetchedCustomer.account.branchName;
            break;
        case 6:
            return fetchedCustomer.account.branchNumber;
            break;
        case 7:
            return fetchedCustomer.account.customerAge;
            break;
        case 8:
            return fetchedCustomer.account.customerGender;
            break;
        case 9:
            return fetchedCustomer.account.customerName;
            break;
        case 10:
            return fetchedCustomer.account.languagePreference;
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

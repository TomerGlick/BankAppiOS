//
//  CustomerCreditCards.m
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/1/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import "CustomerCreditCards.h"
#import "CreditCardTrxCell.h"
#import "CustomerCreditCardsPie.h"
#import "CreditCardTrxDetails.h"
#import "NSString+Helpers.h"
#import "SVProgressHUD.h"

@implementation CustomerCreditCards
@synthesize fetchedCustomer;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"תנועות בכ.אשראי";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (!arrCreditCardData)
    {
        [SVProgressHUD showWithStatus:@"אנא המתן.." maskType:SVProgressHUDMaskTypeBlack];
        
        RestData *data = [RestData new];
        data.delegate = self;
        [data getCreditCardTrxdata:fetchedCustomer.account.accountNumber
                       AndFromData:@"20140101"
                         AndToDate:@"20140801"];
    }
}

- (void)didFinishLoadingData:(id)data {
    arrCreditCardData = data;
    [self.tableView reloadData];
    [SVProgressHUD dismiss];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrCreditCardData ? arrCreditCardData.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CreditCardTrxCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreditCardTrxCell"];
    if (!cell)
    {
        cell =    [[CreditCardTrxCell alloc] initWithStyle:UITableViewCellStyleDefault
                                         reuseIdentifier:@"CreditCardTrxCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    CreditCardTrx *trx = [arrCreditCardData objectAtIndex:indexPath.row];
    cell.lblAmount.text = [[trx.purchaseAmount stringValue] stringByConvertToShekelCurrency];
    cell.lblBusinessName.text = trx.businessName;
    cell.lblDate.text = [trx.purchaseDate stringByFormattedDate];
    [cell.btnCategoryName setTitle:trx.paymentCategory forState:UIControlStateNormal];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 62;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"CustomerCreditCardsPie"])
    {
        CustomerCreditCardsPie *pieVC = segue.destinationViewController;
        pieVC.arrCreditCardData = arrCreditCardData;
    }
    else if ([segue.identifier isEqualToString:@"CreditCardTrxDetails"])
    {
        CreditCardTrxDetails *creditDetails = segue.destinationViewController;
        CreditCardTrx *trx = [arrCreditCardData objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        creditDetails.creditCardTrx = trx;
        creditDetails.arrCreditCardData = arrCreditCardData;
    }
}

@end

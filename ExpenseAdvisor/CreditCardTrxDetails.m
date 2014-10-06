//
//  CreditCardTrxDetails.m
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/2/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import "CreditCardTrxDetails.h"
#import "NSString+Helpers.h"
#import "TrxOnMapView.h"
#import "CreditCardTrxCell.h"

@implementation CreditCardTrxDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = self.creditCardTrx.businessName;
    
    lblBusinessName.text = self.creditCardTrx.businessName;
    lblAmount.text = [[self.creditCardTrx.purchaseAmount stringValue] stringByConvertToShekelCurrency];
    lblDate.text = [self.creditCardTrx.purchaseDate stringByFormattedDate];
    lblPayments.text = self.creditCardTrx.numberOfPaymentsInPurchase;
    lblCategory.text = self.creditCardTrx.paymentCategory;
    
    double sumForbusiness = 0;
    NSMutableArray *tempArrTrx = [NSMutableArray array];
    for (CreditCardTrx *trx in self.arrCreditCardData)
    {
        if ([trx.businessName isEqualToString:self.creditCardTrx.businessName] &&
            ![trx.chargeId isEqualToString:self.creditCardTrx.chargeId])
        {
            [tempArrTrx addObject:trx];
            sumForbusiness += [trx.purchaseAmount doubleValue];
        }
    }
    sumForbusiness += [self.creditCardTrx.purchaseAmount doubleValue];
    lblTotalForBusiness.text = [[[NSNumber numberWithDouble:sumForbusiness] stringValue] stringByConvertToShekelCurrency];
    arrCreditCradTrxFromSameBusiness = [NSArray arrayWithArray:tempArrTrx];
    [tableViewMoreTrx reloadData];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"TrxOnMapView"])
    {
        TrxOnMapView *trxMap = segue.destinationViewController;
        trxMap.creditCardTrx = self.creditCardTrx;
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrCreditCradTrxFromSameBusiness ? arrCreditCradTrxFromSameBusiness.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CreditCardTrxCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreditCardTrxCell"];
    if (!cell)
    {
        cell =    [[CreditCardTrxCell alloc] initWithStyle:UITableViewCellStyleDefault
                                           reuseIdentifier:@"CreditCardTrxCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    CreditCardTrx *trx = [arrCreditCradTrxFromSameBusiness objectAtIndex:indexPath.row];
    cell.lblAmount.text = [[trx.purchaseAmount stringValue] stringByConvertToShekelCurrency];
    cell.lblDate.text = [trx.purchaseDate stringByFormattedDate];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 42;
}


@end

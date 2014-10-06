//
//  CreditCardTrxDetails.h
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/2/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreditCardTrx.h"

@interface CreditCardTrxDetails : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    
    
    __weak IBOutlet UILabel *lblBusinessName;
    __weak IBOutlet UILabel *lblDate;
    __weak IBOutlet UILabel *lblAmount;
    __weak IBOutlet UILabel *lblPayments;
    __weak IBOutlet UILabel *lblCategory;
    __weak IBOutlet UILabel *lblTotalForBusiness;
    __weak IBOutlet UITableView *tableViewMoreTrx;
    NSArray *arrCreditCradTrxFromSameBusiness;
}

@property (nonatomic, strong) CreditCardTrx *creditCardTrx;
@property (nonatomic, strong) NSArray       *arrCreditCardData;

@end

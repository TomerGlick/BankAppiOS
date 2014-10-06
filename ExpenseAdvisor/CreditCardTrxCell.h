//
//  CreditCardTrxCell.h
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/2/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreditCardTrxCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel  *lblBusinessName;
@property (weak, nonatomic) IBOutlet UILabel  *lblAmount;
@property (weak, nonatomic) IBOutlet UIButton *btnCategoryName;
@property (weak, nonatomic) IBOutlet UILabel  *lblDate;


@end

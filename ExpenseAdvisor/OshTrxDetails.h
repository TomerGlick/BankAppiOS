//
//  OshTrxDetails.h
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/5/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Customer.h"
#import "RestData.h"
#import "DatePickerVC.h"


@interface OshTrxDetails : UIViewController  <UITableViewDelegate, UITableViewDataSource, RestDataProtocol, UIActionSheetDelegate> {
    Customer *fetchedCustomer;
    NSArray  *arrOshData;
    IBOutlet UITableView *tableView;
    
    __weak IBOutlet UILabel *lblFromDate;
    __weak IBOutlet UILabel *lblToDate;
    __weak IBOutlet UIButton *btnFromDate;
    __weak IBOutlet UIButton *btnToDate;
    
    UIButton *currentDatePicker;
    NSString *selectedFromDate;
    NSString *selectedToDate;
    DatePickerVC *datePickerVC;
}

- (void) setSelectedDate:(UIDatePicker*) datePicker;
@property (nonatomic, strong) Customer *fetchedCustomer;

@end

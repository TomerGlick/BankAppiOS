//
//  OshTrxDetails.m
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/5/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import "OshTrxDetails.h"
#import "NSString+Helpers.h"
#import "SVProgressHUD.h"
#import "OshTrxCell.h"

@implementation OshTrxDetails
@synthesize fetchedCustomer;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"עו״ש";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (!arrOshData)
    {
        selectedFromDate = @"20140101";
        selectedToDate = @"20140801";
        
        [self setDateLabels];
        
        [SVProgressHUD showWithStatus:@"אנא המתן.." maskType:SVProgressHUDMaskTypeBlack];
       
        RestData *data = [RestData new];
        data.delegate = self;
        
        [data getOshTrxdata:fetchedCustomer.account.accountNumber
                       AndFromData:selectedFromDate
                         AndToDate:selectedToDate];
    }
}

- (void) setDateLabels {
    lblFromDate.text = [selectedFromDate stringByFormattedDate];
    lblToDate.text = [selectedToDate stringByFormattedDate];
}

- (void)didFinishLoadingData:(id)data {
    arrOshData = data;
    [tableView reloadData];
    [SVProgressHUD dismiss];
}

- (void) setSelectedDate:(UIDatePicker*) datePicker {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyyMMdd"];
    if (currentDatePicker == btnFromDate)
    {
        selectedFromDate = [dateFormat stringFromDate:datePicker.date];
    }
    else
    {
        selectedToDate   = [dateFormat stringFromDate:datePicker.date];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    [self setDateLabels];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"datePickerVC"])
    {
        datePickerVC = segue.destinationViewController;
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyyMMdd"];

        datePickerVC.parent = self;
        if (sender == btnFromDate)
        {
            currentDatePicker = btnFromDate;
            [datePickerVC.datePicker setDate:[dateFormat dateFromString:selectedFromDate] animated:YES];
        }
        else
        {
            currentDatePicker = btnToDate;
            [datePickerVC.datePicker setDate:[dateFormat dateFromString:selectedToDate] animated:YES];
        }
    }
}

- (IBAction)onBtnRefresh:(id)sender {
    [SVProgressHUD showWithStatus:@"אנא המתן.." maskType:SVProgressHUDMaskTypeBlack];
    
    RestData *data = [RestData new];
    data.delegate = self;
    
    [data getOshTrxdata:fetchedCustomer.account.accountNumber
            AndFromData:selectedFromDate
              AndToDate:selectedToDate];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrOshData ? arrOshData.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OshTrxCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OshTrxCell"];
    if (!cell)
    {
        cell =    [[OshTrxCell alloc] initWithStyle:UITableViewCellStyleDefault
                                           reuseIdentifier:@"OshTrxCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    OshTrx *trx = [arrOshData objectAtIndex:indexPath.row];
    
    cell.lblAmount.text = [[trx.transactionAmount stringValue] stringByConvertToShekelCurrency];
    cell.lblBusinessName.text = trx.transactionDescription;
    cell.lblDate.text = [trx.transactionDate stringByFormattedDate];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 51;
}

@end

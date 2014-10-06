//
//  DatePickerVC.m
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/5/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import "DatePickerVC.h"
#import "OshTrxDetails.h"

@implementation DatePickerVC
@synthesize parent;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onBtnDatePicker:(id)sender {
     SEL selector = NSSelectorFromString(@"setSelectedDate:");
     if (self.parent && [self.parent respondsToSelector:selector])
     {
         [self.parent performSelector:selector withObject:self.datePicker];
     }
}


@end

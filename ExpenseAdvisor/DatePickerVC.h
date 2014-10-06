//
//  DatePickerVC.h
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/5/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerVC : UIViewController {
    id parent;
}

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property id parent;

@end

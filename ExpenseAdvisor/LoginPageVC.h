//
//  LoginPageVC.h
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/5/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginPageVC : UIViewController <UITextFieldDelegate> {
    
    __weak IBOutlet UITextField *txtCustomerID;
    NSString *selectedAccount;
}


- (void) setSelectedAccount:(NSString*) accountNumber;

@end

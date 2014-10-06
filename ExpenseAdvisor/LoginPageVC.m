//
//  LoginPageVC.m
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/5/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import "LoginPageVC.h"
#import "CustomerOptionsVC.h"
#import "AccountsVC.h"

@implementation LoginPageVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // set default account (this account has credit card data + osh data
    selectedAccount = @"75973";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     [self.navigationController setNavigationBarHidden:YES animated:YES];
    txtCustomerID.text = selectedAccount;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"accountDetails"])
    {
        // enter with specific user for now
        CustomerOptionsVC *accountA = segue.destinationViewController;
        accountA.accountNumber = txtCustomerID.text;
    }
    else if ([segue.identifier isEqualToString:@"selectAccount"])
    {
        // set parent to account picker
        AccountsVC *accountA = segue.destinationViewController;
        accountA.parent = self;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)setSelectedAccount:(NSString *)accountNumber {
    [self dismissViewControllerAnimated:YES completion:nil];
    selectedAccount = accountNumber;
}

@end

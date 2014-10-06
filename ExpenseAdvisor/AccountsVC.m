//
//  ViewController.m
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 9/8/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import "AccountsVC.h"
#import "RestData.h"
#import "Account.h"
#import "SVProgressHUD.h"
#import "CustomerOptionsVC.h"
#import "LoginPageVC.h"

@implementation AccountsVC
@synthesize parent;


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // load sample accounts
    [self onBtnGetData:self];
}

- (IBAction)onBtnGetData:(id)sender {
    // show loading progress
    [SVProgressHUD showWithStatus:@"אנא המתן.." maskType:SVProgressHUDMaskTypeBlack];
    
    // create a data request
    RestData *data = [RestData new];
    NSURLRequest *request = [data getRequestForService:@"account/sample"];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *dicResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:NULL];
             
             NSLog(@"%@", [dicResponse description]);
             
             NSMutableArray *arrTemp = [NSMutableArray array];
             for (NSDictionary *item in dicResponse) {
                 Account *account = [[Account alloc] initWithData:item];
                 [arrTemp addObject:account];
             }
             
             arrAccounts = [NSArray arrayWithArray:arrTemp];
             
             [tableViewAccounts reloadData];
         }
         
         [SVProgressHUD dismiss];
     }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!arrAccounts) return 0;
    else return arrAccounts.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AccountCell"];
    if (!cell)
    {
        cell =    [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                         reuseIdentifier:@"AccountCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    Account *account = [arrAccounts objectAtIndex:indexPath.row];
    cell.textLabel.text = account.customerName;
    cell.detailTextLabel.text = account.branchName;    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Account *account = [arrAccounts objectAtIndex:[tableViewAccounts indexPathForSelectedRow].row];
    SEL selector = NSSelectorFromString(@"setSelectedAccount:");
    if (self.parent && [self.parent respondsToSelector:selector])
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.parent performSelector:selector withObject:account.accountNumber];
#pragma clang diagnostic pop
    }
}

- (IBAction)onBtnCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

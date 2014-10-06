//
//  CustomerOptionsVC.m
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/1/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import "CustomerOptionsVC.h"
#import "RestData.h"
#import "Customer.h"
#import "SVProgressHUD.h"
#import "Account.h"
#import "OshTrxDetails.h"
#import "CustomerBankDetails.h"
#import "CustomerBalance.h"
#import "CustomerCreditCards.h"

@implementation CustomerOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back.jpg"]];
    view.frame = self.collectionView.bounds;
    view.contentMode = UIViewContentModeScaleToFill;
    self.collectionView.backgroundView = view;
    
    [self.collectionView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    if (!fetchedCustomer)
    {
        [SVProgressHUD showWithStatus:@"אנא המתן.." maskType:SVProgressHUDMaskTypeBlack];
        
        RestData *data = [RestData new];
        data.delegate = self;
        [data getBalanceData:self.accountNumber];
    }
}

- (void)didFinishLoadingData:(id)data {
    fetchedCustomer = data;
    self.title = fetchedCustomer.account.customerName;
    
    [SVProgressHUD dismiss];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailsVC"])
    {
        CustomerBankDetails *oshVC = segue.destinationViewController;
        oshVC.fetchedCustomer = fetchedCustomer;
    }
    else if ([segue.identifier isEqualToString:@"balanceVC"])
    {
        CustomerBalance *balanceVC = segue.destinationViewController;
        balanceVC.fetchedCustomer = fetchedCustomer;
    }
    else if ([segue.identifier isEqualToString:@"creditCards"])
    {
        CustomerCreditCards *creditCardsVC = segue.destinationViewController;
        creditCardsVC.fetchedCustomer = fetchedCustomer;
    }
    else if ([segue.identifier isEqualToString:@"osh"])
    {
        OshTrxDetails *oshVC = segue.destinationViewController;
        oshVC.fetchedCustomer = fetchedCustomer;
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = [NSString stringWithFormat:@"Cell%d", (int)indexPath.row];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier
                                                                           forIndexPath:indexPath];
    
    cell.layer.borderWidth =  1.0f;
    cell.layer.borderColor = [[UIColor whiteColor] CGColor];
    cell.layer.cornerRadius = 10.0f;
    cell.layer.masksToBounds = YES;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout         *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row == 2 || indexPath.row == 3)
//        return CGSizeMake(310, 90);
//    return CGSizeMake(145, 132);
return CGSizeMake(300 , 82);
}

@end

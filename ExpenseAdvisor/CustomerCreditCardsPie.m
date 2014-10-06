//
//  CustomerCreditCardsPie.m
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/2/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import "CustomerCreditCardsPie.h"
#import "SVProgressHUD.h"
#import "CategoryCell.h"
#import "CreditCardTrx.h"
#import "NSString+Helpers.h"

@implementation CustomerCreditCardsPie

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pieChart.delegate = self;
    [self.pieChart setDataSource:self];
    [self.pieChart setStartPieAngle:M_PI_2];
    [self.pieChart setAnimationSpeed:1.0];
    [self.pieChart setLabelRadius:130];
    [self.pieChart setShowLabel:YES];
    [self.pieChart setShowPercentage:NO];
    [self.pieChart setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.pieChart setLabelColor:[UIColor blackColor]];
    

    arrSliceColors =[NSArray arrayWithObjects:
                     
                     [UIColor colorWithRed:246/255.0 green:155/255.0 blue:0/255.0 alpha:1],
                     [UIColor colorWithRed:129/255.0 green:195/255.0 blue:29/255.0 alpha:1],
                     [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1],
                     [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],
                     [UIColor colorWithRed:148/255.0 green:141/255.0 blue:139/255.0 alpha:1],
                     [UIColor colorWithRed:215/255.0 green:107/255.0 blue:211/255.0 alpha:1],
                     [UIColor colorWithRed:226/255.0 green:247/255.0 blue:89/255.0 alpha:1],
                     [UIColor colorWithRed:232/255.0 green:63/255.0 blue:63/255.0 alpha:1],
                     [UIColor colorWithRed:215/255.0 green:107/255.0 blue:0/255.0 alpha:1],
                     nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [SVProgressHUD showWithStatus:@"מחשב נתונים" maskType:SVProgressHUDMaskTypeBlack];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{

        NSMutableArray *arrTempCategories        = [NSMutableArray array];
        NSMutableArray *arrTempCategoriesAmounts = [NSMutableArray array];
        NSMutableArray *arrTempCategoriesPct     = [NSMutableArray array];
        double total = 0;
        
        // setup categories
        for (CreditCardTrx *trx in self.arrCreditCardData)
        {
            BOOL exists = NO;
            for (NSString *strCategory in arrTempCategories)
            {
                if ([strCategory isEqualToString:trx.paymentCategory])
                {
                    exists = YES;
                }
            }
            if (!exists)
            {
                [arrTempCategories addObject:trx.paymentCategory];
            }
        }
        arrCategories = [NSArray arrayWithArray:arrTempCategories];
        
        // setup total to category
        for (NSString *strCategory in arrCategories)
        {
            double categorySum = 0;
            for (CreditCardTrx *trx in self.arrCreditCardData)
            {
                if ([trx.paymentCategory isEqualToString:strCategory])
                {
                    categorySum += [trx.purchaseAmount doubleValue];
                }
            }
            // add to total
            total += categorySum;
            // add to category array
            [arrTempCategoriesAmounts addObject:[NSNumber numberWithDouble:categorySum]];
        }
        arrCategoriesAmounts = [NSArray arrayWithArray:arrTempCategoriesAmounts];
        
        // set percentage after summary
        for (NSNumber *categoryAmount in arrCategoriesAmounts)
        {
            double pct = ([categoryAmount doubleValue] / total) * 100;
            [arrTempCategoriesPct addObject:[NSNumber numberWithDouble:pct]];
        }
        arrCategoriesPercentage = [NSArray arrayWithArray:arrTempCategoriesPct];
        
            // reload after done
            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
                [self.pieChart reloadData];
                
                [self.pieChart setSliceSelectedAtIndex:0];
                self.selectedSliceLabel.text = [NSString stringWithFormat:@"%@    %@",
                                                [arrCategories objectAtIndex:0],
                                                [[[arrCategoriesAmounts objectAtIndex:0]  stringValue]stringByConvertToShekelCurrency]];
                
                [self.collectionCategories reloadData];
            });
    });
}

#pragma mark - XYPieChart Data Source

- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart
{
    return arrCategoriesPercentage ? arrCategoriesPercentage.count : 0;
}

- (NSString *)pieChart:(XYPieChart *)pieChart textForSliceAtIndex:(NSUInteger)index {
    return [NSString stringWithFormat:@"%d%%", [[arrCategoriesPercentage objectAtIndex:index] intValue]];
}

- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    return [[arrCategoriesPercentage objectAtIndex:index] intValue];
}

- (UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index
{
    return [arrSliceColors objectAtIndex:(index % arrSliceColors.count)];
}

#pragma mark - XYPieChart Delegate
- (void)pieChart:(XYPieChart *)pieChart willSelectSliceAtIndex:(NSUInteger)index
{
//    NSLog(@"will select slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart willDeselectSliceAtIndex:(NSUInteger)index
{
//    NSLog(@"will deselect slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart didDeselectSliceAtIndex:(NSUInteger)index
{
//    NSLog(@"did deselect slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart didSelectSliceAtIndex:(NSUInteger)index
{
    self.selectedSliceLabel.text = [NSString stringWithFormat:@"%@\n%@", [arrCategories objectAtIndex:index],
                                    [[[arrCategoriesAmounts objectAtIndex:index] stringValue] stringByConvertToShekelCurrency]];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return arrCategories ? arrCategories.count : 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryCell" forIndexPath:indexPath];
    
    cell.lblCategory.text = [arrCategories objectAtIndex:indexPath.row];
    cell.viewColor.backgroundColor = [arrSliceColors objectAtIndex:(indexPath.row % arrSliceColors.count)];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout         *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(155, 30);
}



//CategoryCell








@end

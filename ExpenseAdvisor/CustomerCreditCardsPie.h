//
//  CustomerCreditCardsPie.h
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/2/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYPieChart.h"

@interface CustomerCreditCardsPie : UIViewController <XYPieChartDelegate, XYPieChartDataSource, UICollectionViewDataSource, UICollectionViewDelegate> {
    NSArray *arrSliceColors;
    NSArray *arrCategories;
    NSArray *arrCategoriesPercentage;
    NSArray *arrCategoriesAmounts;
}

@property (weak, nonatomic) IBOutlet UICollectionView *collectionCategories;
@property (nonatomic, strong) NSArray *arrCreditCardData;
@property (weak, nonatomic) IBOutlet XYPieChart *pieChart;
@property (weak, nonatomic) IBOutlet UILabel *selectedSliceLabel;

@end

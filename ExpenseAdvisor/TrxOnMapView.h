//
//  TrxOnMapView.h
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/2/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Annotation.h"
#import "CreditCardTrx.h"

@interface TrxOnMapView : UIViewController <MKMapViewDelegate> {
    
    Annotation *business;
    __weak IBOutlet MKMapView *mapView;
    
}

@property (nonatomic, strong) CreditCardTrx *creditCardTrx;


@end

//
//  TrxOnMapView.m
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 10/2/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import "TrxOnMapView.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "NSString+Helpers.h"

@implementation TrxOnMapView

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    MKCoordinateRegion mapRegion;
    mapRegion.center.latitude = 32.072554;
    mapRegion.center.longitude = 34.779357;
    mapRegion.span.latitudeDelta = 0;
    mapRegion.span.longitudeDelta = 0;
    [mapView setRegion:mapRegion animated: YES];
    [mapView setZoomEnabled:YES];

    business = [[Annotation alloc] init];
    business.title = self.creditCardTrx.businessName;
    business.subtitle = [[self.creditCardTrx.purchaseAmount stringValue] stringByConvertToShekelCurrency];
    
    MKCoordinateRegion buildingcoordinates = { {0.0, 0.0}, {0.0, 0.0} };
    buildingcoordinates.center.latitude = mapRegion.center.latitude;
    buildingcoordinates.center.longitude = mapRegion.center.longitude;
    business.coordinate = buildingcoordinates.center;
    [mapView addAnnotation:business];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [mapView selectAnnotation:business animated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)_mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    static NSString *pinIdentifier = @"pinIndentifier";
    
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)
    [mapView dequeueReusableAnnotationViewWithIdentifier:pinIdentifier];
    if (pinView == nil)
    {
        // if an existing pin view was not available, create one
        MKPinAnnotationView *customPinView = [[MKPinAnnotationView alloc]
                                              initWithAnnotation:annotation reuseIdentifier:pinIdentifier];
        customPinView.pinColor = MKPinAnnotationColorRed;
        customPinView.animatesDrop = YES;
        customPinView.canShowCallout = YES;
        return customPinView;
    }
    else
    {
        pinView.annotation = annotation;
    }
    return pinView;
}





@end

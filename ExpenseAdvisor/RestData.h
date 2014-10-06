//
//  RestData.h
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 9/8/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RestDataProtocol <NSObject>
- (void) didFinishLoadingData:(id)data;
@end

@interface RestData : NSObject {
    
}

@property (nonatomic) id<RestDataProtocol> delegate;
- (NSURLRequest*) getRequestForService:(NSString*) strService;
- (void) getOshData: (NSString*) strAccountNumbe;
- (void) getBalanceData: (NSString*) strAccountNumber;
- (void) getCreditCardTrxdata: (NSString*) strAccountNumber
                  AndFromData:(NSString*) fromDate
                    AndToDate:(NSString*) toDate;
- (void) getOshTrxdata: (NSString*) strAccountNumber
           AndFromData:(NSString*) fromDate
             AndToDate:(NSString*) toDate;
@end

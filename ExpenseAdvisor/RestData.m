//
//  RestData.m
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 9/8/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import "RestData.h"
#import "Customer.h"

#define URL @"https://api.bankapp.co.il"

@implementation RestData

- (NSURLRequest *)getRequestForService:(NSString *)strService {
    
    NSString *restCallString = [NSString stringWithFormat:@"%@/%@",
                                URL,
                                strService
                                ];
    NSURL *url = [NSURL URLWithString:restCallString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
#warning Add Your own key here !
    [request setValue:@"mykey" forHTTPHeaderField:@"accessKey"];
    [request setValue:@"mysecret" forHTTPHeaderField:@"secretKey"];

    return request;    
}
- (void) getOshData: (NSString*) strAccountNumber {
    
    NSString *strReq = [NSString stringWithFormat:@"account/%@/details", strAccountNumber];
    NSURLRequest *request = [self getRequestForService:strReq];
    
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
            NSDictionary *dicTemp = [NSDictionary dictionaryWithObject:dicResponse forKey:@"account"];
            Customer *customerData = [[Customer alloc] initWithData:dicTemp];
             if (self.delegate && [self.delegate respondsToSelector:@selector(didFinishLoadingData:)])
             {
                 [self.delegate performSelector:@selector(didFinishLoadingData:) withObject:customerData];
             }
         }
     }];
}
- (void) getBalanceData: (NSString*) strAccountNumber {
    
    NSString *strReq = [NSString stringWithFormat:@"account/%@/all", strAccountNumber];
    NSURLRequest *request = [self getRequestForService:strReq];
    
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
             Customer *customerData = [[Customer alloc] initWithData:dicResponse];
             if (self.delegate && [self.delegate respondsToSelector:@selector(didFinishLoadingData:)])
             {
                 [self.delegate performSelector:@selector(didFinishLoadingData:) withObject:customerData];
             }
         }
     }];
}
- (void) getCreditCardTrxdata: (NSString*) strAccountNumber
                  AndFromData:(NSString*) fromDate
                    AndToDate:(NSString*) toDate {
    NSString *strReq = [NSString stringWithFormat:@"account/%@/credit-card-transaction/by-date?fromDate=%@&toDate=%@", strAccountNumber, fromDate, toDate];
    
    NSURLRequest *request = [self getRequestForService:strReq];
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
             NSMutableArray *arrTempTrx = [NSMutableArray array];
             if (dicResponse)
             {
                 for (NSDictionary *dicSingleTrx in dicResponse)
                 {
                     CreditCardTrx *trx = [[CreditCardTrx alloc] initWithData:dicSingleTrx];
                     [arrTempTrx addObject:trx];
                 }
             }
            
             NSArray *arrResponse = [NSArray arrayWithArray:arrTempTrx];
             if (self.delegate && [self.delegate respondsToSelector:@selector(didFinishLoadingData:)])
             {
                 [self.delegate performSelector:@selector(didFinishLoadingData:) withObject:arrResponse];
             }
         }
     }];
}

- (void) getOshTrxdata: (NSString*) strAccountNumber
                  AndFromData:(NSString*) fromDate
                    AndToDate:(NSString*) toDate {
    
    NSString *strReq = [NSString stringWithFormat:@"account/%@/transaction/by-date?fromDate=%@&toDate=%@", strAccountNumber, fromDate, toDate];
    
    NSURLRequest *request = [self getRequestForService:strReq];
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
             NSMutableArray *arrTempTrx = [NSMutableArray array];
             if (dicResponse)
             {
                 for (NSDictionary *dicSingleTrx in dicResponse)
                 {
                     OshTrx *trx = [[OshTrx alloc] initWithData:dicSingleTrx];
                     [arrTempTrx addObject:trx];
                 }
             }
             
             NSArray *arrResponse = [NSArray arrayWithArray:arrTempTrx];
             if (self.delegate && [self.delegate respondsToSelector:@selector(didFinishLoadingData:)])
             {
                 [self.delegate performSelector:@selector(didFinishLoadingData:) withObject:arrResponse];
             }
         }
     }];
}



@end

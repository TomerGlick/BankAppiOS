//
//  ViewController.h
//  ExpenseAdvisor
//
//  Created by Tomer Glick on 9/8/14.
//  Copyright (c) 2014 Tomer Glick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountsVC : UIViewController <NSXMLParserDelegate, NSURLConnectionDelegate, UITableViewDataSource, UITableViewDelegate> {
    
    
    NSURLConnection *currentConnection;
    NSXMLParser *xmlParser;
    NSArray *arrAccounts;
    
    __weak IBOutlet UITableView *tableViewAccounts;
    
    id parent;
}

@property id parent;
@property (strong, nonatomic) NSMutableData *apiReturnXMLData;
@property (nonatomic) NSInteger statusNbr;
@property (nonatomic) NSInteger reasonCode;
@property (strong, nonatomic) NSString *hygieneResult;
@property (strong, nonatomic) NSString *currentElement;

@end


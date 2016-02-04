//
//  FISResultTableViewController.h
//  searchAndShout
//
//  Created by Joshua Motley on 2/4/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISResultTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray * resultNameArray;
@property (strong, nonatomic) NSMutableArray * resultStepArray;
@property (strong, nonatomic) NSString * type;

@end

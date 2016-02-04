//
//  FISResultTableViewController.m
//  searchAndShout
//
//  Created by Joshua Motley on 2/4/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISResultTableViewController.h"


@interface FISResultTableViewController ()



@end

@implementation FISResultTableViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"resultCell"];
    
    
    if([self.type isEqualToString:@"step"]){
    cell.textLabel.text = [NSString stringWithFormat:@"Search Result: %@",self.resultStepArray[indexPath.row]];
    
  
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Dance: %@",self.resultNameArray[indexPath.row]];}
    
    else{
            
            cell.textLabel.text = [NSString stringWithFormat:@"Dance: %@",self.resultNameArray[indexPath.row]];
            
            
            cell.detailTextLabel.text = @"";
            
        }
    
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.resultNameArray count];
}



@end

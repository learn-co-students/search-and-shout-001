//
//  FISSearchViewController.m
//  searchAndShout
//
//  Created by Joe Burgess on 7/2/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISSearchViewController.h"
#import "FISDataStore.h"
#import "FISDanceMove.h"
#import "FISResultTableViewController.h"


@interface FISSearchViewController ()
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) IBOutlet UIButton *search;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) NSMutableArray *resultName;
@property (strong, nonatomic) NSMutableArray *resultStep;
@property (strong, nonatomic) NSString *type;

@property (strong, nonatomic) FISDataStore *store;

@end

@implementation FISSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.store = [FISDataStore sharedDataStore];
    [self.store fetchDances];

    
    self.resultName = [[NSMutableArray alloc]init];
    self.resultStep = [[NSMutableArray alloc]init];

    
    
    
    

    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    
    [self.resultName removeAllObjects];
    [self.resultStep removeAllObjects];
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchAction:(id)sender {
    
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        
        for (FISDanceMove *move in self.store.dances) {
            if ([[move.name lowercaseString] containsString:[self.textField.text lowercaseString]]) {
                [self.resultName addObject:move.name];
                [self.resultStep addObject:@""];


            }
        }
        
        
    }else
    
    if (self.segmentedControl.selectedSegmentIndex == 1) {
        
        for (FISDanceMove *move in self.store.dances) {
            if ([[move.step1 lowercaseString] containsString:[self.textField.text lowercaseString]]) {
                [self.resultName addObject:move.name];
                [self.resultStep addObject:move.step1];
            }
        }
        

        
    }else
    
    if (self.segmentedControl.selectedSegmentIndex == 2) {
        
        for (FISDanceMove *move in self.store.dances) {
            if ([[move.step2 lowercaseString] containsString:[self.textField.text lowercaseString]]) {
                [self.resultName addObject:move.name];
                [self.resultStep addObject:move.step2];
            }
        }
        

        
    }else
    
    if (self.segmentedControl.selectedSegmentIndex == 3) {
        
        for (FISDanceMove *move in self.store.dances) {
            if ([[move.step3 lowercaseString] containsString:[self.textField.text lowercaseString]]) {
                [self.resultName addObject:move.name];
                [self.resultStep addObject:move.step3];
            }
        }
        

        
    }else
    
    if (self.segmentedControl.selectedSegmentIndex == 4) {
        
        for (FISDanceMove *move in self.store.dances) {
            if ([[move.step4 lowercaseString] containsString:[self.textField.text lowercaseString]]) {
                [self.resultName addObject:move.name];
                [self.resultStep addObject:move.step4];
            }
        }

        
    }
    
 
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"resultSegue"]) {
        FISResultTableViewController *result = segue.destinationViewController;
        result.resultNameArray = self.resultName;


        result.resultStepArray = self.resultStep;
        
        if (self.segmentedControl.selectedSegmentIndex ==0) {
            self.type = @"name";
        }else{
            self.type = @"step";
        }
        
        result.type = self.type;
        
    }
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

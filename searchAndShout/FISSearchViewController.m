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
#import "FISSearchDetailTableViewController.h"

@interface FISSearchViewController ()

@property (strong, nonatomic) NSDictionary *searchDict;

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)dancesContainingTerm:(NSString *)term inAttribute:(NSString *)attribute {
    FISDataStore *store = [FISDataStore sharedDataStore];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"FISDanceMove"];
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@", attribute, term];
    request.predicate = searchPredicate;
    return [store.managedObjectContext executeFetchRequest:request error:nil];
}

- (IBAction)searchTapped:(id)sender {
    NSArray *attributes = @[@"name", @"step1", @"step2", @"step3", @"step4"];
    NSString *searchedAttribute = attributes[self.segmentedControl.selectedSegmentIndex];
    NSArray *values = [self dancesContainingTerm:self.searchField.text inAttribute:searchedAttribute];
    self.searchDict = @{@"attribute": searchedAttribute, @"data":values};
    [self performSegueWithIdentifier:@"searchDetail" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    FISSearchDetailTableViewController *SDTVC = segue.destinationViewController;
    SDTVC.searchedAttribute = self.searchDict[@"attribute"];
    SDTVC.danceMoves = self.searchDict[@"data"];
    
}


@end

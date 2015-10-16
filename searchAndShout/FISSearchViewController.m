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

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) IBOutlet UITextField *searchHere;
@property (strong, nonatomic) NSDictionary *searchObject;
- (IBAction)search:(id)sender;

@end

@implementation FISSearchViewController

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
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@", attribute,term];
    request.predicate = searchPredicate;
    return [store.managedObjectContext executeFetchRequest:request error:nil];
}

- (IBAction)search:(id)sender {
    
    NSArray *attributes = @[@"name", @"step1", @"step2", @"step3", @"step4"];
    NSString *attributeWeAreSearching = attributes[self.segmentedControl.selectedSegmentIndex];
    NSArray *values = [self dancesContainingTerm:self.searchHere.text inAttribute:attributeWeAreSearching];
    self.searchObject = @{@"attribute": attributeWeAreSearching, @"data": values};
    [self performSegueWithIdentifier:@"searchDetail" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    FISSearchDetailTableViewController *nextVC = segue.destinationViewController;
    nextVC.searchedAttribute = self.searchObject[@"attribute"];
    nextVC.filteredDanceMoves = self.searchObject[@"data"];
}

@end

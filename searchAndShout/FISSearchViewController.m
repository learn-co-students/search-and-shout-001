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
@property (strong, nonatomic) IBOutlet UITextField *nameSearch;
@property (strong, nonatomic) IBOutlet UITextField *step1Search;
@property (strong, nonatomic) IBOutlet UITextField *step2Search;
@property (strong, nonatomic) IBOutlet UITextField *step3Search;
@property (strong, nonatomic) IBOutlet UITextField *step4Search;

@property (strong, nonatomic) NSDictionary *searchObject;

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

- (IBAction)nameSearchButtonTapped:(id)sender {
    NSArray *values = [self searchAttribute:@"name" forTerm:self.nameSearch.text];
    self.searchObject = @{@"attribute": @"name", @"data": values};
    
    [self performSegueWithIdentifier:@"searchDetail" sender:self];
}

- (IBAction)step1SearchButtonTapped:(id)sender {
    NSArray *values = [self searchAttribute:@"step1" forTerm:self.step1Search.text];
    self.searchObject = @{@"attribute": @"step1", @"data": values};
    
    [self performSegueWithIdentifier:@"searchDetail" sender:self];
}

- (IBAction)step2SearchButtonTapped:(id)sender {
    NSArray *values = [self searchAttribute:@"step2" forTerm:self.step2Search.text];
    self.searchObject = @{@"attribute": @"step2", @"data": values};
    
    [self performSegueWithIdentifier:@"searchDetail" sender:self];
}

- (IBAction)step3SearchButtonTapped:(id)sender {
    NSArray *values = [self searchAttribute:@"step3" forTerm:self.step3Search.text];
    self.searchObject = @{@"attribute": @"step3", @"data": values};
    
    [self performSegueWithIdentifier:@"searchDetail" sender:self];
}

- (IBAction)step4SearchButtonTapped:(id)sender {
    NSArray *values = [self searchAttribute:@"step4" forTerm:self.step4Search.text];
    self.searchObject = @{@"attribute": @"step4", @"data": values};
    
    [self performSegueWithIdentifier:@"searchDetail" sender:self];
}

-(NSArray *)searchAttribute:(NSString *)attribute forTerm:(NSString *)searchTerm
{
    FISDataStore *store = [FISDataStore sharedDataStore];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"FISDanceMove"];
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@", attribute,searchTerm];
    request.predicate = searchPredicate;
    return [store.managedObjectContext executeFetchRequest:request error:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    FISSearchDetailTableViewController *nextVC = segue.destinationViewController;
    
    nextVC.searchedAttribute = self.searchObject[@"attribute"];
    nextVC.filteredDanceMoves = self.searchObject[@"data"];
}

@end

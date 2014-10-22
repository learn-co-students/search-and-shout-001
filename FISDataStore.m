//
//  FISDataStore.m
//  playingWithCoreData
//
//  Created by Joe Burgess on 6/27/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISDataStore.h"
#import "FISDanceMove.h"

@implementation FISDataStore
@synthesize managedObjectContext = _managedObjectContext;


+ (instancetype)sharedDataStore {
    static FISDataStore *_sharedDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDataStore = [[FISDataStore alloc] init];
    });

    return _sharedDataStore;
}


- (void)save
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (void) generateTestData
{
    FISDanceMove *hokeypokey = [NSEntityDescription insertNewObjectForEntityForName:@"FISDanceMove" inManagedObjectContext:self.managedObjectContext];
    hokeypokey.name = @"The Hokey Pokey";
    hokeypokey.step1 = @"Right hand in";
    hokeypokey.step2 = @"Right hand out";
    hokeypokey.step3 = @"Right hand in";
    hokeypokey.step4 = @"shake it all about";

    FISDanceMove *theTwist = [NSEntityDescription insertNewObjectForEntityForName:@"FISDanceMove" inManagedObjectContext:self.managedObjectContext];
    theTwist.name = @"The Twist";
    theTwist.step1 = @"Shift weight to right leg";
    theTwist.step2 = @"Shift arms to right";
    theTwist.step3 = @"Twist body left";
    theTwist.step4 = @"Shift weight to left leg";

    // Abbreviated macarena
    FISDanceMove *macarena = [NSEntityDescription insertNewObjectForEntityForName:@"FISDanceMove" inManagedObjectContext:self.managedObjectContext];
    macarena.name = @"The Macarena";
    macarena.step1 = @"both arms out straight";
    macarena.step2 = @"cross right arm across left";
    macarena.step3 = @"cross left arm across right";
    macarena.step4 = @"move your hips";

    [self fetchDances];
}

- (void)fetchDances
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"FISDanceMove"];

    self.dances = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];

    if ([self.dances count] == 0) {
        [self generateTestData];
    }
}
#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }


    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"searchAndShout.sqlite"];

    NSError *error = nil;

    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"searchAndShout" withExtension:@"momd"];
    NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];

    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end

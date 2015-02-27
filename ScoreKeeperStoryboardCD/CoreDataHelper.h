//
//  CoreDataHelper.h
//  ScoreKeeperStoryboardCD
//
//  Created by Julien Guanzon on 2/26/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface CoreDataHelper : NSObject

@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;

+ (CoreDataHelper *)sharedInstance;

- (void)save;

@end

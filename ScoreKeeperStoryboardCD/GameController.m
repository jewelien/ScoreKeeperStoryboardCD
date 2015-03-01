//
//  GameController.m
//  ScoreKeeperStoryboardCD
//
//  Created by Julien Guanzon on 2/26/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "GameController.h"

@implementation GameController

+ (GameController *)sharedInstance {
    static GameController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [GameController new];
    });
    return sharedInstance;
}

- (NSArray *)games {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Game"];
    return [[CoreDataHelper sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];
}

- (Game *)createGameWithTitle:(NSString *)title {
    Game *game = [NSEntityDescription insertNewObjectForEntityForName:@"Game" inManagedObjectContext:[CoreDataHelper sharedInstance].managedObjectContext ];
    game.title = title;
    [self save];
    return game;
}

- (void)addPlayerToGame:(Game *)game {
    Player *player = [NSEntityDescription insertNewObjectForEntityForName:@"Player" inManagedObjectContext:[CoreDataHelper sharedInstance].managedObjectContext];
    player.game = game;
    [self save];
}

- (void)removeGame:(Game *)game {
    [game.managedObjectContext deleteObject:game];
    [self save];
}

- (void)removePlayer:(Player *)player {
    if (!player) {
        return;
    }
    [player.managedObjectContext deleteObject:player];
    [self save];
}

- (void)save {
    [[CoreDataHelper sharedInstance] save];
    // calling "[[self managedObjectContext] save:NULL];" save method in coredatahelper.

}

@end

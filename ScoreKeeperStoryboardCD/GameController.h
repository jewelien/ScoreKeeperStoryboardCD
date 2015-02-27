//
//  GameController.h
//  ScoreKeeperStoryboardCD
//
//  Created by Julien Guanzon on 2/26/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"
#import "Player.h"
#import "CoreDataHelper.h"

@interface GameController : NSObject

@property (nonatomic, strong) NSArray *games;

+ (GameController *)sharedInstance;

- (Game *)createGameWithTitle:(NSString *)title;
- (void)addPlayerToGame:(Game *)game;

- (void)save;

@end

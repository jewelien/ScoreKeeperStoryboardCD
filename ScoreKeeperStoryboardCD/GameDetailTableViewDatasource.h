//
//  GameDetailTableViewDatasource.h
//  ScoreKeeperStoryboardCD
//
//  Created by Julien Guanzon on 2/26/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GameController.h"

@interface GameDetailTableViewDatasource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) Game *game;

- (void)updatePlayerWithGame:(Game *)game;


@end

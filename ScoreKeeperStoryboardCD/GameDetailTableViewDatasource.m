//
//  GameDetailTableViewDatasource.m
//  ScoreKeeperStoryboardCD
//
//  Created by Julien Guanzon on 2/26/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "GameDetailTableViewDatasource.h"
#import "ScoreTableViewCell.h"

@interface GameDetailTableViewDatasource ()

@property (nonatomic, strong) NSArray *players;

@end

@implementation GameDetailTableViewDatasource

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.game.players.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ScoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playerCell"];
    
    Player *player = [self.players objectAtIndex:indexPath.row];
    [cell updateWithPlayer:player];
    
    return cell;
}

- (void)updatePlayerWithGame:(Game *)game {
    NSMutableArray *players = [NSMutableArray new];
    for (Player *player in game.players) {
        [players addObject:player];
    }
    self.game = game;
    self.players = players;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [tableView beginUpdates];
        [[GameController sharedInstance] removePlayer:[self.players objectAtIndex:indexPath.row]];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        NSMutableArray *players = [[NSMutableArray alloc] initWithArray:self.players];
        [players removeObjectAtIndex:indexPath.row];
        self.players = players;
        
        [tableView endUpdates];
    }
}

@end

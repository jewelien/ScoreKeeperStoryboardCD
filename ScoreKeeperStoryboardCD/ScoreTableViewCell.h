//
//  ScoreTableViewCell.h
//  ScoreKeeperStoryboardCD
//
//  Created by Julien Guanzon on 2/26/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameController.h"


@interface ScoreTableViewCell : UITableViewCell

- (void)updateWithPlayer:(Player *)player;

@end

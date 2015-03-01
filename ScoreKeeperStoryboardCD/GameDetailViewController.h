//
//  GameDetailViewController.h
//  ScoreKeeperStoryboardCD
//
//  Created by Julien Guanzon on 2/26/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameController.h"

@interface GameDetailViewController : UIViewController



@property (nonatomic, strong) Game *game;
@property (weak, nonatomic) IBOutlet UITextField *titleField;


- (void)updateWithGame:(Game *)game;

@end

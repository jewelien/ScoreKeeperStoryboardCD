//
//  ScoreTableViewCell.m
//  ScoreKeeperStoryboardCD
//
//  Created by Julien Guanzon on 2/26/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "ScoreTableViewCell.h"

@interface ScoreTableViewCell ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIStepper *scoreStepper;

@property (nonatomic, strong) Player *player;

@end

@implementation ScoreTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)updateWithPlayer:(Player *)player {
    self.player = player;
    self.nameField.text = player.name;
    self.scoreLabel.text = player.score;
    self.scoreStepper.value = [player.score doubleValue];
    [[GameController sharedInstance] save];
    
}
- (IBAction)stepperTapped:(id)sender {
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", (int)self.scoreStepper.value];
    
    self.player.score = self.scoreLabel.text;;
    [[GameController sharedInstance] save];
    
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  GameDetailViewController.m
//  ScoreKeeperStoryboardCD
//
//  Created by Julien Guanzon on 2/26/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "GameDetailViewController.h"
#import "GameDetailTableViewDatasource.h"

@interface GameDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet GameDetailTableViewDatasource *datasource;


@end

@implementation GameDetailViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleField.text = self.game.title;//when saved game is selected and pushes to this VC title textField would be filled with the the game title selected.
    [self.tableView reloadData];
    
}

- (IBAction)gameTitleSave:(id)sender {
    self.game.title = self.titleField.text;
    [[GameController sharedInstance] save];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField  {
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)addPlayer:(id)sender {
    [[GameController sharedInstance] addPlayerToGame:self.game];
    [self.datasource updatePlayerWithGame:self.game];
    [self.tableView reloadData];
}

- (void)updateWithGame:(Game *)game {
    self.game = game;
    [self.datasource updatePlayerWithGame:game];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

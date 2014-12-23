//
//  SetGameViewController.m
//  stanford1
//
//  Created by Julie Huguet on 07/12/2014.
//  Copyright (c) 2014 Julie Huguet. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetCardDeck.h"
#import "GameHistoryViewController.h"

@interface SetGameViewController ()

@end

@implementation SetGameViewController

- (Deck *)createDeck
{
    return [[SetCardDeck alloc]init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) availableGame:(int)cardIndex
{
    [self.game game3cards:cardIndex];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowHistory3cards"]) {
        if ([segue.destinationViewController isKindOfClass:[GameHistoryViewController class]]) {
            GameHistoryViewController *ghvc = (GameHistoryViewController *)segue.destinationViewController;
            ghvc.historyToShow = self.game.msgHistory;
        }
    }
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

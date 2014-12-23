//
//  ViewController.h
//  stanford1
//
//  Created by Julie Huguet on 28/11/2014.
//  Copyright (c) 2014 Julie Huguet. All rights reserved.
//
// Abstract class. Must implement methods as described below

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"
@interface ViewController : UIViewController

@property (nonatomic,strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic)NSMutableArray *cardIndex;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;

//protected
//for subclasses
- (Deck *)createDeck; //abstract
- (void) availableGame:(int)cardIndex;//abstract
@end


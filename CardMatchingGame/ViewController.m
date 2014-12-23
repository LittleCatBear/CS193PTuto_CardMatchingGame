//
//  ViewController.m
//  stanford1
//
//  Created by Julie Huguet on 28/11/2014.
//  Copyright (c) 2014 Julie Huguet. All rights reserved.
//

#import "ViewController.h"
//#import "Deck.h"
//#import "PlayingCardDeck.h"
//#import "PlayingCard.h"
#import "CardMatchingGame.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
- (void)updateMsgLabel{
    self.msgLabel.text = [[NSString alloc]initWithString:self.game.msg];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CardMatchingGame *)game
{
    if (!_game){
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]];
    }
    
    
    return _game;
}

- (NSMutableArray *)cardIndex
{
    if(! _cardIndex) _cardIndex = [[NSMutableArray alloc] init];
    return _cardIndex;
}



- (Deck *) createDeck //abstract method
{
    //return [[PlayingCardDeck alloc]init];
    return nil;
}


- (IBAction)touchCardButton:(UIButton *)sender //à mettre en abstract et à override dans les 2 controllers
{
    int cardIndex;
    //if (self.gameControl.selectedSegmentIndex==0){
    cardIndex = [self.cardButtons indexOfObject:sender];
    //NSLog(@"cardindex: %d",cardIndex);
    //[self.game chooseCardAtIndex:cardIndex];
    [self availableGame:cardIndex];
    [self updateUI];
    // }
    /*
     else{
     cardIndex = [self.cardButtons indexOfObject:sender];
     [self.game game3cards:cardIndex];
     [self updateUI];
     */
    //sinon, on passe l'argument 3 dans une méthode de jeu (pour avoir le nombre de carte à matcher) et on trouve l'algo en fonction
}

- (void) availableGame:(int)cardIndex{//abstract
    
}

- (void) updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardIndex =  [self.cardButtons indexOfObject:cardButton];
        
        Card *card = [self.game cardAtIndex:cardIndex];
        
        [cardButton setAttributedTitle:[self titleForCard:card] forState:(UIControlStateNormal)];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState: (UIControlStateNormal)];
        //active les cartes non choisies et/ou terminées
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld",(long)self.game.score];
    [self updateMsgLabel];
}

- (NSAttributedString *) titleForCard:(Card *)card
{
    //NSLog(@"%@", card.contents);
    return card.isChosen ? card.contents : [[NSMutableAttributedString alloc]initWithString:@""];
}


- (UIImage *) backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"blankCard": @"back" ];
}

- (IBAction)resetButton:(UIButton *)sender {
    
    [self.game resetGame:self.game withDeck:[self createDeck]];
    [self.game.msgHistory removeAllObjects];
    //[self.game.msg stringByAppendingString:@"New game ! "];
    [self updateUI];
    //[self updateMsgLabel];
    
    
}


@end

//
//  CardMatchingGame.m
//  stanford1
//
//  Created by Julie Huguet on 01/12/2014.
//  Copyright (c) 2014 Julie Huguet. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of Card
@property (nonatomic) NSInteger cardCount; //pour compter le nombre de cartes mtchée
@property (nonatomic, strong)NSMutableArray *selectedCards; //pour les cartes à matcher

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if(! _cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (NSMutableArray *)msgHistory
{
    if(! _msgHistory) _msgHistory = [[NSMutableArray alloc] init];
    return _msgHistory;
}

- (NSString *)msg
{
    if(! _msg) _msg = [[NSString alloc] init];
    return _msg;
}


- (NSMutableArray *)selectedCards
{
    if(! _selectedCards) _selectedCards = [[NSMutableArray alloc] init];
    return _selectedCards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self)
    {
        for (int i = 0; i<count; i++){
            Card *card = [deck drawRandomCard];
            
            if(card){ //card ok
                //NSLog(@"content de cardmathinggame %@",card.contents);
                [self.cards addObject:card];
            }
            else{
                self=nil;
                break;
            }
        }
    }
    
    return self;
}

- (void)resetGame:(CardMatchingGame *)oldGame withDeck:(Deck *) deck
{
    for (int i = 0; i < oldGame.cards.count;i++){
        oldGame.cards[i] = [deck drawRandomCard];
    }
    self.score = 0;
    self.msg = @"New game ! ";
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index]:nil;
}

//l'un ou l'autre
//#define MISMATCH_PENALTY 2
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;
static const int MISMATCH_PENALTY_3 = 1;
static const int MATCH_BONUS_3 = 10;
static const int COST_TO_CHOOSE_3 = 0;

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched){
        
        if (card.isChosen){
            card.chosen = NO;
        }
        
        else{
            //match against another card
            for(Card *otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    
                    if (matchScore){
                        self.score +=matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                       self.msg = [self messagerie:1 andCards:@[otherCard, card] andPoints:matchScore * MATCH_BONUS];
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                        self.msg = [self messagerie:2 andCards:@[otherCard, card] andPoints:MISMATCH_PENALTY];
                    }
                    break;
                }
                else self.msg = [self messagerie:3 andCards:@[card] andPoints:COST_TO_CHOOSE];
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
            [self.msgHistory addObject:self.msg];
        }
    }
}
- (NSString *)messagerie:(NSUInteger)choix andCards:(NSArray *)msgCards andPoints:(NSInteger)points
{
    NSString *carte1 = [((Card *)msgCards[0]).contents string];
    NSString *carte2;
    if(msgCards.count==2)carte2 = [((Card *)msgCards[1]).contents string];
    NSString *carte3;
    if(msgCards.count>=3) {
        carte2 = [((Card *)msgCards[1]).contents string];
        carte3 =[((Card *)msgCards[2]).contents string];
    }
    NSMutableString *tempsgm = [[NSMutableString alloc]initWithString:@""];
   // self.msg = [[NSMutableAttributedString alloc]initWithString:@""];
    switch (choix) {
        case 1:
            [tempsgm appendFormat:@"Gagnant: %@ et %@ gagnent %ld points", carte1, carte2, points];
            return tempsgm;
            //[NSString stringWithFormat:@"Gagnant: %@ et %@ gagnent %ld points", carte1, carte2, points];
            break;
        case 2:
            [tempsgm appendFormat:@"Perdant: %@ et %@ perdent %ld points", carte1, carte2, points];
            return tempsgm;
            //[NSString stringWithFormat:@"Perdant: %@ et %@ perdent %ld points", ((Card *)msgCards[0]).contents, ((Card *)msgCards[1]).contents, (long)points];
            break;
        case 3:
             [tempsgm appendFormat:@" %@ retourne, cout =  %ld", carte1, points];
            return tempsgm;
            break;
        case 4:
            [tempsgm appendFormat:@"Gagnant: %@, %@ et %@ gagnent %ld points", carte1, carte2, carte3, points];
            return tempsgm;
            break;
        case 5:
            [tempsgm appendFormat:@"Perdant: %@, %@ et %@ perdent %ld points", carte1, carte2, carte3, points];
            return tempsgm;
            break;
        case 6:
            [tempsgm appendFormat:@" %@ retourné, coût =  %ld", carte1, points];
            return tempsgm;
        default:
            return @"nouveau jeu";
            break;
    }
}

- (void)game3cards:(NSUInteger)index
{
    
    
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched){
        
        if (card.isChosen){
            card.chosen = NO;
        }
        
        else{
           
            for(Card *otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched){
                    [self.selectedCards addObject:otherCard];
                    self.msg = [self messagerie:6 andCards:@[card] andPoints:COST_TO_CHOOSE_3];
                }
            }
             //match against another card
            if (self.selectedCards.count==2) {
               // for (Card *cardToMatch in self.selectedCards) {
                int matchScore = [card match:self.selectedCards];
                
                if (matchScore){
                    self.score +=matchScore * MATCH_BONUS_3;
                    card.matched = YES;
                    for (Card *lastCard in self.selectedCards) {
                        lastCard.matched = YES;
                    }
                    self.msg = [self messagerie:4 andCards:@[self.selectedCards[0], self.selectedCards[1], card] andPoints:matchScore * MATCH_BONUS_3];
                }else{
                    self.score -= MISMATCH_PENALTY_3;
                    for (Card *lastCard in self.selectedCards) {
                        lastCard.chosen = NO;
                    }
                    self.msg = [self messagerie:5 andCards:@[self.selectedCards[0],self.selectedCards[1],  card] andPoints:matchScore * MATCH_BONUS_3];
                }
            }
            else if (self.selectedCards.count>2){
                card.Chosen = NO;
                for(Card *falseCard in self.selectedCards){
                    falseCard.chosen = NO;
                }
            }
            [self.selectedCards removeAllObjects];
            self.score -= COST_TO_CHOOSE_3;
            card.chosen = YES;
            [self.msgHistory addObject:self.msg];
            
        }
    }
}
@end

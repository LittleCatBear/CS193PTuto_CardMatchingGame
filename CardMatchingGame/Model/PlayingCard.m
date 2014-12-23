//
//  PlayingCard.m
//  stanford1
//
//  Created by Julie Huguet on 29/11/2014.
//  Copyright (c) 2014 Julie Huguet. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards
{
    
    int score  = 0;
    
    if ([otherCards count] == 1) {
        id card = [otherCards firstObject];
        if([card isKindOfClass:[PlayingCard class]]){
            PlayingCard *otherCard = (PlayingCard *) card;
            if ([self.suit isEqualToString:otherCard.suit]){
                score = 1;
            }else if (self.rank == otherCard.rank){
                 score = 4;
            }
        }
    }
    else if (otherCards.count > 1){
        NSLog(@"start");
       // NSLog(self.contents);
        //NSLog(((PlayingCard *)otherCards[0]).contents);
        //NSLog(((PlayingCard *)otherCards[1]).contents);
        for (int i=0;i<otherCards.count-1; i++) {
            if ([self.suit isEqualToString:((PlayingCard *)otherCards[i]).suit] && [self.suit isEqualToString:((PlayingCard *)otherCards[i+1]).suit])
            {
                score  = 3;
            }else if (self.rank == ((PlayingCard *)otherCards[i]).rank && self.rank == ((PlayingCard *)otherCards[i+1]).rank){
                score = 7;
            
            }else if ([self.suit isEqualToString:((PlayingCard *)otherCards[i+1]).suit] || [self.suit isEqualToString:((PlayingCard *)otherCards[i]).suit] || [((PlayingCard *)otherCards[i]).suit isEqualToString:((PlayingCard *)otherCards[i+1]).suit]){
                score=1;
            
            }else if (self.rank == ((PlayingCard *)otherCards[i+1]).rank || self.rank == ((PlayingCard *)otherCards[i]).rank || ((PlayingCard *)otherCards[i+1]).rank == ((PlayingCard *)otherCards[i]).rank){
                score = 1;
            }
            
        }
    }
    return score;
}

- (NSAttributedString *) contents
{
    NSArray *rankStrings=@[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"V", @"D", @"R"];
    
    return [[NSAttributedString alloc]initWithString:[rankStrings[self.rank] stringByAppendingString: self.suit]];
    //[rankStrings[self.rank] stringByAppendingString: self.suit];
}

//on doit le mettre parce qu'on met un getter ET un setter
@synthesize suit = _suit;

//methode de classe (pas méthode d'instance)
//sert à créer des choses
//ou utility methods
+ (NSArray *)validSuits
{
    return @[@"♦", @"♥", @"♣", @"♠"];
}

- (void)setSuit:(NSString *)suit
{
    if ([@[@"♦", @"♥", @"♣", @"♠"] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"V", @"D", @"R"];
}

+ (NSUInteger)maxRank
{
    return [[self rankStrings] count]-1;
}
@end

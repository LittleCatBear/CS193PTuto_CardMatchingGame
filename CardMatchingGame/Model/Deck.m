//
//  Deck.m
//  stanford1
//
//  Created by Julie Huguet on 29/11/2014.
//  Copyright (c) 2014 Julie Huguet. All rights reserved.
//

#import "Deck.h"

@interface Deck ()
@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation Deck

//vérification que le tableau n'est pas nil, on test et on initialise dans le getter
- (NSMutableArray *)cards{
    if(!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
        }

- (void)addCard:(id)card atTop:(BOOL)atTop{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }
    else{
        [self.cards addObject:card];
    }
}
- (Card *)drawRandomCard{
    Card *randomCard =  nil;
   
    if([self.cards count]){
        
        unsigned index = arc4random()%[self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}

- (void)addCard:(Card *)card{
    [self addCard:card atTop:NO];
}

@end

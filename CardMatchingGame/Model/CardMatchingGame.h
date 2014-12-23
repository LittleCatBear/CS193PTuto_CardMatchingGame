//
//  CardMatchingGame.h
//  stanford1
//
//  Created by Julie Huguet on 01/12/2014.
//  Copyright (c) 2014 Julie Huguet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSMutableArray *msgHistory;
//designated initializer
- (instancetype) initWithCardCount:(NSUInteger)count
                         usingDeck: (Deck *) deck;

- (void)chooseCardAtIndex:(NSUInteger) index;
- (Card *)cardAtIndex:(NSUInteger)index; 
- (void)resetGame:(CardMatchingGame *)oldGame withDeck:(Deck *) deck;
- (void)game3cards:(NSUInteger)index;
- (NSString *)messagerie:(NSUInteger)choix andCards:(NSArray *)msgCards andPoints:(NSInteger)points;
//- (NSString *)messagerieHardGame:(NSUInteger)choix andCards:(NSMutableArray *)msgCards;

@property (nonatomic, readonly) NSInteger score;
@end

//
//  SetCardDeck.m
//  stanford1
//
//  Created by Julie Huguet on 12/12/2014.
//  Copyright (c) 2014 Julie Huguet. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (instancetype) init
{
    self = [super init];
    
    if (self){
        for (NSString *shape in [SetCard validShape])
        {
            for(NSUInteger rankColor = 0; rankColor<=[SetCard maxColorRank];rankColor++){
             
                for (NSUInteger rankShade = 0; rankShade<=[SetCard maxShadeRank]; rankShade++) {
                    SetCard *card = [[SetCard alloc] init];
                    card.rankColor = rankColor;
                    card.rankShade = rankShade;
                    card.shape = shape;
                    //NSLog(@" %lu%@%lu",card.rankColor,card.shape, card.rankShade);
                    [self addCard:card];
                    //NSLog(@"%@",card.contents);
                }
            }
        }
    }
    return self;
}


@end

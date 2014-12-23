//
//  PlayingCard.h
//  stanford1
//
//  Created by Julie Huguet on 29/11/2014.
//  Copyright (c) 2014 Julie Huguet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString * suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger)maxRank;

@end

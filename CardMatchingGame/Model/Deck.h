//
//  Deck.h
//  stanford1
//
//  Created by Julie Huguet on 29/11/2014.
//  Copyright (c) 2014 Julie Huguet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;
@end

//
//  Card.m
//  stanford1
//
//  Created by Julie Huguet on 28/11/2014.
//  Copyright (c) 2014 Julie Huguet. All rights reserved.
//

#import "Card.h"

@interface Card()
@end

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    for(Card *card in otherCards){
        
    
        if ([card.contents isEqualToAttributedString:self.contents]) {
            score+=1;
        }
    }
    return score;
}





@end
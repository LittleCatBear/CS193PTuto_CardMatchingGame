//
//  Card.h
//  stanford1
//
//  Created by Julie Huguet on 28/11/2014.
//  Copyright (c) 2014 Julie Huguet. All rights reserved.
//
#import <Foundation/Foundation.h>

#ifndef stanford1_Card_h
#define stanford1_Card_h


@interface Card : NSObject

@property (strong, nonatomic) NSAttributedString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) bool matched;

-(int)match:(NSArray *)otherCards;


@end



#endif


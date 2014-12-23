//
//  SetCard.h
//  stanford1
//
//  Created by Julie Huguet on 07/12/2014.
//  Copyright (c) 2014 Julie Huguet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import <UIKit/UIKit.h>

@interface SetCard : Card

@property (strong, nonatomic) NSString *shape;
@property (strong, nonatomic) UIColor *color;
@property (nonatomic) NSUInteger rankColor;
@property (nonatomic) NSUInteger rankShade;

+ (NSArray *)validColor;
+ (NSArray *)validShape;
+ (NSArray *)validShade;
+ (NSUInteger)maxColorRank;
+ (NSUInteger)maxShadeRank;
@end

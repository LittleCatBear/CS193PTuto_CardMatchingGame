//
//  SetCard.m
//  stanford1
//
//  Created by Julie Huguet on 07/12/2014.
//  Copyright (c) 2014 Julie Huguet. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if (otherCards.count > 1){
        NSLog(@"start");
       // NSLog(self.contents);
        //NSLog(((SetCard *)otherCards[0]).contents);
        //NSLog(((SetCard *)otherCards[1]).contents);
        for (int i=0;i<otherCards.count-1; i++) {
            if ([self.shape isEqualToString:((SetCard *)otherCards[i]).shape] && [self.shape isEqualToString:((SetCard *)otherCards[i+1]).shape])
            {
                score  = 3;
            }else if (self.rankShade == ((SetCard *)otherCards[i]).rankShade && self.rankColor == ((SetCard *)otherCards[i+1]).rankColor){
                score = 7;
                
            }else if ([self.shape isEqualToString:((SetCard *)otherCards[i+1]).shape] || [self.shape isEqualToString:((SetCard *)otherCards[i]).shape] || [((SetCard *)otherCards[i]).shape isEqualToString:((SetCard *)otherCards[i+1]).shape]){
                score=1;
                
            }else if (self.rankColor == ((SetCard *)otherCards[i+1]).rankColor || self.rankColor == ((SetCard *)otherCards[i]).rankColor || ((SetCard *)otherCards[i+1]).rankColor == ((SetCard *)otherCards[i]).rankColor){
                score = 1;
            }
            
        }
    }
    return score;

}

+ (NSArray *)validShape
{
    return @[@"A", @"B", @"C"];
}

+ (NSArray *)validShade
{
    return @[@0.2, @0.5, @1];
}

+ (NSArray *)validColor
{
    UIColor *red = [[UIColor alloc]initWithRed:1 green:0 blue:0 alpha:1],
    *blue =[[UIColor alloc] initWithRed:0 green:0 blue:1 alpha:1],
    *green = [[UIColor alloc] initWithRed:0 green:1 blue:0 alpha:1];
    NSArray *color=@[red, blue, green];
    return color;
}

@synthesize shape = _shape;

- (void)setShape:(NSString *)shape
{
    if([@[@"A", @"B", @"C"] containsObject:shape]){
        _shape = shape;
    }
}

- (NSString *)shape
{
    return _shape ? _shape : @"?";
}
/*
@synthesize rankShade = _rankShade;

- (void)setRankShade:(NSUInteger)rankShade
{
    NSNumber *tempShade = [NSNumber numberWithInteger:rankShade];
    if([@[@0.2, @0.5, @1] containsObject:tempShade]){
        _rankShade = rankShade;
    }
}

- (NSUInteger)rankShade
{
    return _rankShade ? _rankShade : 0;
}

@synthesize rankColor = _rankColor;

- (void)setRankColor:(NSUInteger *)rankColor
{
    NSNumber *tempColor = [NSNumber numberWithInteger:rankColor];
    if([@[[UIColor greenColor],[UIColor blackColor], [UIColor redColor], [UIColor yellowColor]]  containsObject:tempColor]){
        _rankColor = rankColor;
    }
}

- (NSUInteger)rankColor
{
    return _rankColor? _rankColor : 0;
}

@synthesize color = _color;

- (void)setColor:(UIColor *)color
{
    if([@[@greenColor, @blackColor, @redColor, @yellowColor] containsObject:color]){
        _color = color;
    }
}

- (UIColor *)color
{
    return _color ? _color : whiteColor;
}
*/
- (NSAttributedString *) contents
{
    UIColor *red = [[UIColor alloc]initWithRed:1 green:0 blue:0 alpha:1],
            *blue =[[UIColor alloc] initWithRed:0 green:0 blue:1 alpha:1],
            *green = [[UIColor alloc] initWithRed:0 green:1 blue:0 alpha:1];
    NSArray *color=@[red, blue, green];
    NSArray *shade=@[@0.2, @0.5, @1];
    NSMutableAttributedString *toBeReturned = [[NSMutableAttributedString alloc]initWithString:self.shape];
    double temp = [shade[self.rankShade] doubleValue];
    UIColor *tempColor = [color[self.rankColor] colorWithAlphaComponent:temp];
    [toBeReturned addAttribute:NSForegroundColorAttributeName value:tempColor range:NSMakeRange(0, 1)];
    //toBeReturned addAttribute:NSForegroundColorAttributeName value:[color[self.rankColor] colorWithAlpha:shade[self.rankShade]];
    //NSString *temp= toBeReturned;
   // NSLog(@"temps: %@", temp);
    return toBeReturned;
}

+ (NSArray *)rankColor
{
    UIColor *red = [[UIColor alloc]initWithRed:1 green:0 blue:0 alpha:1],
    *blue =[[UIColor alloc] initWithRed:0 green:0 blue:1 alpha:1],
    *green = [[UIColor alloc] initWithRed:0 green:1 blue:0 alpha:1];
    return @[red, blue, green];
}

+ (NSUInteger)maxColorRank
{
    return [[self rankColor] count]-1;
}

+ (NSArray *)rankShade
{
    return @[@0.2, @0.5, @1];
}

+ (NSUInteger)maxShadeRank
{
    return [[self rankShade] count]-1;
}

@end

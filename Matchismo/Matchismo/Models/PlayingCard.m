//
//  PlayingCard.m
//  Matchismo
//
//  Created by jfroom on 3/4/14.
//  Copyright (c) 2014 JFMK, LLC. All rights reserved.
//

#import "PlayingCard.h"

NSString * const PlayingCardSymbolHearts = @"♥";
NSString * const PlayingCardSymbolDiamonds = @"♦";
NSString * const PlayingCardSymbolSpades = @"♠";
NSString * const PlayingCardSymbolClubs = @"♣";

#pragma mark - Class

@implementation PlayingCard

- (NSString *)contents{
    NSArray *rankStrings = [PlayingCard validRanks];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *)validSuits
{
    return @[PlayingCardSymbolHearts,
             PlayingCardSymbolDiamonds,
             PlayingCardSymbolSpades,
             PlayingCardSymbolClubs];
}

+ (NSArray *)validRanks
{
    static NSArray *ranks = nil;
    if (!ranks) ranks = @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
    return ranks;
}
+ (NSUInteger)maxRank
{
    return [[self validRanks] count]  - 1;
}

#pragma mark - Properties

@synthesize suit = _suit;

- (NSString *)suit
{
    return (_suit)? _suit : @"Ø";
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}
- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

#pragma mark - Methods



- (int)match:(NSArray *)otherCards{
    int score = 0;
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank){
            score = 4;
        }else if ([otherCard.suit isEqualToString:self.suit]){
            score = 1;
        }
    }
    return score;
}
@end

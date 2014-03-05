//
//  Deck.m
//  Matchismo
//
//  Created by jfroom on 3/4/14.
//  Copyright (c) 2014 JFMK, LLC. All rights reserved.
//


#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards; // of Card
@end

@implementation Deck

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}
- (unsigned) cardsCount
{
    return [self.cards count];
}
- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop){
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}
- (void)addCard:(Card *)card
{
    [self addCard:card atTop:YES];
    
}
- (Card *) drawRandomCard
{
    Card *randomCard = nil;
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}
@end

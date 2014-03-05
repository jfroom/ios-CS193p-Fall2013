//
//  Deck.h
//  Matchismo
//
//  Created by jfroom on 3/4/14.
//  Copyright (c) 2014 JFMK, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
@property (readonly) unsigned cardsCount;
- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;

@end

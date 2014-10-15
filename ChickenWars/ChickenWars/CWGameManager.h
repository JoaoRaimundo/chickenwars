//
//  CWGameManager.h
//  ChickenWars
//
//  Created by iOS Course on 08/10/14.
//  Copyright (c) 2014 Wit Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWGameManager : NSObject

//Moves done by both players
@property (strong) NSMutableArray *playerMoves;
@property (strong) NSMutableArray *botMoves;

@property (strong) NSArray *row;

@end

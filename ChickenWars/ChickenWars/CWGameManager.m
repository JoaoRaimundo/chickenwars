//
//  CWGameManager.m
//  ChickenWars
//
//  Created by iOS Course on 08/10/14.
//  Copyright (c) 2014 Wit Software. All rights reserved.
//

#import "CWGameManager.h"
#import "CWBoard.h"

@interface CWGameManager ()

@property(readwrite) CWBoard *board;



@end

@implementation CWGameManager

-(instancetype)init {
    self = [super init];
    
    if (self) {
        
        _playerMoves = [[NSMutableArray alloc] initWithCapacity: 10];
        
        _playerMoves = [self movesInitializer:_playerMoves];
        
        _botMoves = [[NSMutableArray alloc] initWithCapacity: 10];
        
        _botMoves = [self movesInitializer:_botMoves];
        
    }
    
    return self;
}

+(instancetype)sharedManager
{
    static CWGameManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self class] new];
    });
    return instance;
}

//Game logic helper functions

-(NSNumber *)hit:(NSInteger *)column :(NSInteger *)row {

    return @NO;
}

// function that gets a boatplacement and the corresponding player

//////////////////////////
//Init helper for arrays//
//////////////////////////

-(NSMutableArray *)movesInitializer:(NSMutableArray *) desiredMoves {
    
    _row = @[@(NO),@(NO),@(NO),@(NO),
             @(NO),@(NO),@(NO),@(NO),
             @(NO),@(NO)];
    
    for (int i = 0; i < 10; i++) {
        [desiredMoves insertObject:_row atIndex:i];
    }
    
    return desiredMoves;
}


@end

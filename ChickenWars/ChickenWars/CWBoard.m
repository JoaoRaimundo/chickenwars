//
//  CWBoard.m
//  ChickenWars
//
//  Created by iOS Course on 08/10/14.
//  Copyright (c) 2014 Wit Software. All rights reserved.
//

#import "CWBoard.h"

@interface CWBoard ()


@end

@implementation CWBoard

- (instancetype)init {
    self = [super init];
    
    if (self) {
        
        _playerBoard = [[NSMutableArray alloc] initWithCapacity: 10];
        
        _playerBoard = [self boardInitializer:_playerBoard];
        
        _botBoard = [[NSMutableArray alloc] initWithCapacity: 10];
        
        _botBoard = [self boardInitializer:_botBoard];
    
    }
    
    return self;
}

//////////////////////////
//Init helper for arrays//
//////////////////////////

-(NSMutableArray *)boardInitializer:(NSMutableArray *) desiredBoard {

    _row = @[@(NO),@(NO),@(NO),@(NO),
             @(NO),@(NO),@(NO),@(NO),
             @(NO),@(NO)];
    
    for (int i = 0; i < 10; i++) {
        [desiredBoard insertObject:_row atIndex:i];
    }
    
    return desiredBoard;
}

@end

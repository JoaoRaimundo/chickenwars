//
//  CWBoard.m
//  ChickenWars
//
//  Created by iOS Course on 08/10/14.
//  Copyright (c) 2014 Wit Software. All rights reserved.
//

#import "CWBoard.h"

@interface CWBoard ()

//Boards for chickens placement
@property (strong) NSMutableArray *board;
@end

@implementation CWBoard

- (instancetype)initWithDimension:(NSInteger) dimension {
    self = [super init];
    if (self) {
        
        self.board = [[NSMutableArray alloc] init];
        for (int i = 0; i < dimension; i++) {
            NSMutableArray *row = [[NSMutableArray alloc] init];
            for (int j = 0; j < dimension; j++) {
                [row addObject:@NO];
            }
            self.board[i]=row;
        }
    }
    
    return self;
}

@end

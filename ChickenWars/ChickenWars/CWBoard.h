//
//  CWBoard.h
//  ChickenWars
//
//  Created by iOS Course on 08/10/14.
//  Copyright (c) 2014 Wit Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWBoard : NSObject

//Boards for boat placement
@property (strong) NSMutableArray *playerBoard;
@property (strong) NSMutableArray *botBoard;

@property (strong) NSArray *row;

@end

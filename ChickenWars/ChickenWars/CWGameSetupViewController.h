//
//  CWGameSetupViewController.h
//  ChickenWars
//
//  Created by Daniel Ferreira on 08/10/14.
//  Copyright (c) 2014 Wit Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CWGameSetupViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate>

@property(readwrite) NSInteger columnSize;

@end
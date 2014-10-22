//
//  CWGameSetupViewController.m
//  ChickenWars
//
//  Created by Daniel Ferreira on 08/10/14.
//  Copyright (c) 2014 Wit Software. All rights reserved.
//

#import "CWGameSetupViewController.h"

@interface CWGameSetupViewController ()

@property(strong) IBOutlet UICollectionView *boardCollectionView;
@property(strong, nonatomic) IBOutletCollection(UIImageView) NSArray *piecesImageView;
@property(strong, nonatomic) UISnapBehavior *pieceSnapBehavior;
@property int firstX;
@property int firstY;

@end

@implementation CWGameSetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.boardCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.columnSize = 10;
    [self initPanGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.columnSize * self.columnSize;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UICollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    }
    cell.backgroundColor = [UIColor colorWithRed: (float) 0 green: (float)(arc4random() % 100) / 100 blue:0 alpha: 1];
    return cell;
}

- (void)initPanGestureRecognizer {
    for (UIView *view in self.piecesImageView) {
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(movePiece:)];
        [panRecognizer setMinimumNumberOfTouches:1];
        [panRecognizer setMaximumNumberOfTouches:1];
        [view addGestureRecognizer:panRecognizer];
    };
}

- (void)movePiece:(UIPanGestureRecognizer*)sender {
//    [self.view bringSubviewToFront:sender.view];
    CGPoint translatedPoint = [sender translationInView:self.view];
    
    if ([sender state] == UIGestureRecognizerStateBegan) {
        self.firstX = sender.view.center.x;
        self.firstY = sender.view.center.y;
    }
    
    translatedPoint = CGPointMake(self.firstX + translatedPoint.x, self.firstY + translatedPoint.y);
    
    [sender.view setCenter:translatedPoint];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        CGFloat finalX = translatedPoint.x;
        CGFloat finalY = translatedPoint.y;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        if (finalX < 0) {
            finalX = 0;
        } else if (finalX > width) {
            finalX = width;
        }
        
        if (finalY < 0) {
            finalY = 0;
        } else if (finalY > height) {
            finalY = height;
        }
        CGFloat animationDuration = 0.5;
        CGRect boundsA = [self.boardCollectionView convertRect:self.boardCollectionView.bounds toView:nil];
        CGRect boundsB = [sender.view convertRect:sender.view.bounds toView:nil];
        if (!CGRectIntersectsRect(boundsA, boundsB)) {
            finalX = self.firstX;
            finalY = self.firstY;
        } else {
            CGPoint closestPiece = [self closestPieceToPoint: CGPointMake(finalX - sender.view.bounds.size.width / 2, finalY - sender.view.bounds.size.height / 2)];
            finalX = closestPiece.x + sender.view.bounds.size.width / 2;
            finalY = closestPiece.y + sender.view.bounds.size.height / 2;
        }
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:animationDuration];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView setAnimationDelegate:self];
//        [UIView setAnimationDidStopSelector:@selector(animationDidFinish)];
        [sender.view setCenter:CGPointMake(finalX, finalY)];
        [UIView commitAnimations];
    }
}

- (CGPoint)closestPieceToPoint:(CGPoint) point {
    int closestDistance = INT16_MAX;
    UICollectionViewCell *closestCell;
    for (UICollectionViewCell* cell in [self.boardCollectionView visibleCells]) {
        CGPoint cellPosition = [cell convertRect:cell.bounds toView:nil].origin;
        CGFloat xDist = cellPosition.x - point.x;
        CGFloat yDist = cellPosition.y - point.y;
        CGFloat distance = sqrt((xDist * xDist) + (yDist * yDist));
        if (distance < closestDistance) {
            closestCell = cell;
            closestDistance = distance;
        }
    }
    return [closestCell convertRect:closestCell.bounds toView:nil].origin;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

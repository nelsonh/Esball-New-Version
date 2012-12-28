//
//  BetSquare.h
//  ESBall
//
//  Created by Nelson on 12/4/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

//can be subclass

#import <UIKit/UIKit.h>
#import "BetInfoView.h"


@class BetSquareView;

@protocol BetSquareViewDelegate <NSObject>

@required
-(BOOL)BetSquareViewIsTotalBetOverBalance:(BetSquareView *)betSquare withCurrentBet:(double)currentBet;
-(BOOL)BetSquareViewShouldBet:(BetSquareView *)betSquare;
-(double)BetSquareViewValueToBet:(BetSquareView *)betSquare;

@end

@interface BetSquareView : UIButton{
    
    double currentBet;
    
}

@property (nonatomic, weak) id<BetSquareViewDelegate> theDelegate;
@property (nonatomic, assign) double maxBet;//limit
@property (nonatomic, readonly) double theCurrentBet;
@property (nonatomic, weak) IBOutlet BetInfoView *betInfoView;



-(void)hideBetInfoView;
-(void)resetCurrentBet;
-(void)displayCurrentBetResult;

@end

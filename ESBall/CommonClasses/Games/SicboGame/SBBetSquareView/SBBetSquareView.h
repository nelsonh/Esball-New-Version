//
//  SBBetSquareView.h
//  ESBall
//
//  Created by Nelson on 1/21/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "BetSquareView.h"

/**
 * SBBetSquareView subclass of BetSqaureView.
 * 
 */
@interface SBBetSquareView : BetSquareView

@property (nonatomic, copy) NSString *dataName;

-(void)changeMaxBetAndBetInfoWithNewMaxBet:(double)newMaxBet;

@end

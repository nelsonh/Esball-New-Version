//
//  BetInfo.h
//  ESBall
//
//  Created by Nelson on 12/4/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

//can be subclass

#import <UIKit/UIKit.h>

@interface BetInfoView : UIView

@property (nonatomic, weak) IBOutlet UILabel *maxBetLabel;
@property (nonatomic, weak) IBOutlet UILabel *currentBetLabel;
@property (nonatomic, weak) IBOutlet UILabel *betResultLabel;

-(void)setMaxBet:(double)maxBet;
-(void)setCurrentBet:(double)currentBet;
-(void)setBetFinalResult:(double)betFinalResult;

@end

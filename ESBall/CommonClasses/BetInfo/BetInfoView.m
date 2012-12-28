//
//  BetInfo.m
//  ESBall
//
//  Created by Nelson on 12/4/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "BetInfoView.h"

@interface BetInfoView ()




@end

@implementation BetInfoView

@synthesize maxBetLabel = _maxBetLabel;
@synthesize currentBetLabel = _currentBetLabel;
@synthesize betResultLabel = _betResultLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setMaxBet:(double)maxBet
{
    _maxBetLabel.text = [NSString stringWithFormat:@"%i", (int)maxBet];
    _maxBetLabel.hidden = NO;
    _betResultLabel.hidden = YES;
}

-(void)setCurrentBet:(double)currentBet
{
    _currentBetLabel.text = [NSString stringWithFormat:@"%i", (int)currentBet];
    _currentBetLabel.hidden = NO;
    _betResultLabel.hidden = YES;
}

-(void)setBetFinalResult:(double)betFinalResult
{
    _betResultLabel.text = [NSString stringWithFormat:@"+%i", (int)betFinalResult];
    _betResultLabel.hidden = NO;
    _currentBetLabel.hidden = YES;
    _maxBetLabel.hidden = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

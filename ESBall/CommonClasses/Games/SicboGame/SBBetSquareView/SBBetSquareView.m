//
//  SBBetSquareView.m
//  ESBall
//
//  Created by Nelson on 1/21/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "SBBetSquareView.h"

@implementation SBBetSquareView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - public interface
-(void)changeMaxBetAndBetInfoWithNewMaxBet:(double)newMaxBet
{
    self.maxBet = newMaxBet;
    
    [self.betInfoView setMaxBet:newMaxBet];
}

#pragma mark - override method
-(void)doBet:(double)newBet
{
    if([self.theDelegate respondsToSelector:@selector(BetSquareViewIsTotalBetOverBalance:withCurrentBet:)])
    {
        //if total bet over balance, pass newBet because current bet is not set yet
        if([self.theDelegate BetSquareViewIsTotalBetOverBalance:self withCurrentBet:newBet])
            return;
    }
    
    if([self.theDelegate respondsToSelector:@selector(BetSquareWillDoBet:)])
    {
        [self.theDelegate BetSquareWillDoBet:self];
    }
    
    double maxBet = 0;
    
    //check if not over max
    if((currentBet+newBet)<=self.maxBet)
    {
        //assign to track
        lastBet = newBet;
        
        //add temp bet
        tempBet += newBet;
        
        currentBet += newBet;
        maxBet = self.maxBet - newBet;//subtract newbet
        
        //set the new max bet for this bet square
        self.maxBet = maxBet;
        
        //update bet info view
        [self.betInfoView setCurrentBet:currentBet];
        [self.betInfoView setMaxBet:maxBet];
        
        //show bet info view
        if(self.betInfoView)
        {
            [self.betInfoView setHidden:NO];
        }
        
        if([self.theDelegate respondsToSelector:@selector(BetSquareDoBet:)])
        {
            [self.theDelegate BetSquareDoBet:self];
        }
    }
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

//
//  BetSquare.m
//  ESBall
//
//  Created by Nelson on 12/4/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "BetSquareView.h"

@interface BetSquareView ()


-(void)didTap;
-(void)doBet:(double)newBet;

@end

@implementation BetSquareView

@synthesize theDelegate = _theDelegate;
@synthesize betInfoView = _betInfoView;
@synthesize maxBet = _maxBet;
@synthesize theCurrentBet = _theCurrentBet;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    [self addTarget:self action:@selector(didTap) forControlEvents:UIControlEventTouchUpInside];
    
    return [super initWithCoder:aDecoder];
}

-(void)didTap
{
    if([_theDelegate respondsToSelector:@selector(BetSquareViewShouldBet:)])
    {
        //Whether it can bet or not
        if([_theDelegate BetSquareViewShouldBet:self])
        {
            if([_theDelegate respondsToSelector:@selector(BetSquareViewValueToBet:)])
            {
                //ask value for bet
                double betValue = [_theDelegate BetSquareViewValueToBet:self];
                [self doBet:betValue];
            }
        }
    }
}

-(void)hideBetInfoView
{
    if(_betInfoView)
        [_betInfoView setHidden:YES];
}

-(void)doBet:(double)newBet
{
    if([_theDelegate respondsToSelector:@selector(BetSquareViewIsTotalBetOverBalance:withCurrentBet:)])
    {
        //if total bet over balance, pass newBet cause current bet is not set yet
        if([_theDelegate BetSquareViewIsTotalBetOverBalance:self withCurrentBet:newBet])
            return;
    }
    
    double maxBet = 0;
    
    //check if not over max
    if((currentBet+newBet)<=_maxBet)
    {
        currentBet += newBet;
        maxBet = _maxBet - currentBet;
        
        //update bet info view
        [_betInfoView setCurrentBet:currentBet];
        [_betInfoView setMaxBet:maxBet];
        
        //show bet info view
        if(_betInfoView)
        {
            [_betInfoView setHidden:NO];
        }
    }
}

-(void)resetCurrentBetWithBetInfo:(BOOL)yesOrNo
{
    currentBet = 0;
    
    if(yesOrNo)
    {
        [_betInfoView setCurrentBet:currentBet];
        [_betInfoView setMaxBet:_maxBet];
    }

    
    /*
    if(_betInfoView)
        _betInfoView.hidden = YES;
     */
}

-(void)displayCurrentBetResult
{
    if(currentBet > 0 && _betInfoView)
        [_betInfoView setBetFinalResult:currentBet];
        
}

#pragma mark - getter setter
-(double)theCurrentBet
{
    return currentBet;
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

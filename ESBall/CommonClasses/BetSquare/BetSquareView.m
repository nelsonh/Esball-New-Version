//
//  BetSquare.m
//  ESBall
//
//  Created by Nelson on 12/4/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "BetSquareView.h"
#import "SoundManager.h"

@interface BetSquareView ()


-(void)didTap;
-(void)doBet:(double)newBet;

@end

@implementation BetSquareView

@synthesize theDelegate = _theDelegate;
@synthesize betInfoView = _betInfoView;
@synthesize maxBet = _maxBet;
@synthesize betHistory = _betHistory;
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
                
                //play sound effect
                SoundManager *soundManager = [SoundManager soundManager];
                [soundManager playSoundEffectWithKey:@"SE_BetTap"];
            }
        }
    }
}

-(void)clearBetHistory
{
    _betHistory = 0;
}

-(void)hideBetInfoView
{
    if(_betInfoView)
        [_betInfoView setHidden:YES];
}

-(void)showBetInfoView
{
    if(_betInfoView)
        [_betInfoView setHidden:NO];
}

-(void)clearTempBet
{
    tempBet = 0;
}

-(void)doBetApply
{
    //if greater than max bet
    if((_betHistory+tempBet) > _maxBet)
    {
        //set history equal to max bet
        _betHistory = _maxBet;
    }
    else
    {
        //add to bet history
        _betHistory += tempBet;
    }
    
    tempBet =0;
}

-(void)applyBetHistoryWithValue:(double)betHistoryValue
{
    _betHistory = betHistoryValue;
    _maxBet = _maxBet - _betHistory;
}

-(void)doBet:(double)newBet
{
    
    if([_theDelegate respondsToSelector:@selector(BetSquareViewIsTotalBetOverBalance:withCurrentBet:)])
    {
        //if total bet over balance, pass newBet because current bet is not set yet
        if([_theDelegate BetSquareViewIsTotalBetOverBalance:self withCurrentBet:newBet])
            return;
    }
    
    
    if([_theDelegate respondsToSelector:@selector(BetSquareWillDoBet:)])
    {
        [_theDelegate BetSquareWillDoBet:self];
    }
    
    double maxBet = 0;
    
    
    
    //check if not over max
    if((currentBet+newBet)<=_maxBet)
    {
        //assign to track
        lastBet = newBet;
        
        //add temp bet
        tempBet += newBet;
        
        currentBet += newBet;
        maxBet = _maxBet - currentBet;
        
        //update bet info view
        [_betInfoView setCurrentBet:currentBet];
        [_betInfoView setMaxBet:maxBet-_betHistory];
        
        //show bet info view
        if(_betInfoView)
        {
            [_betInfoView setHidden:NO];
        }
        
        if([_theDelegate respondsToSelector:@selector(BetSquareDoBet:)])
        {
            [_theDelegate BetSquareDoBet:self];
        }
    }
    else
    {
        NSString *msg = NSLocalizedString(@"超過限額", @"超過限額");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", @"确定") otherButtonTitles: nil];
        [alertView show];
    }
}

-(void)restoreLastBetState
{
    _betHistory -= lastBet;
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

-(void)displayHistoryBetResult
{
    //if bet history greater than 0 display it
    if(_betHistory > 0 && _betInfoView)
        [_betInfoView setBetFinalResult:_betHistory];
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

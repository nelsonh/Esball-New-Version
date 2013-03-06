//
//  SBBetView.m
//  ESBall
//
//  Created by Nelson on 1/7/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "SBBetView.h"
#import "FileFinder.h"

#define kNumberOfButton 52

@interface SBBetView ()

@end

@implementation SBBetView

@synthesize betSquare1 = _betSquare1;
@synthesize betSquare2 = _betSquare2;
@synthesize betSquare3 = _betSquare3;
@synthesize betSquare4 = _betSquare4;
@synthesize betSquare5 = _betSquare5;
@synthesize betSquare6 = _betSquare6;
@synthesize betSquare7 = _betSquare7;
@synthesize betSquare8 = _betSquare8;
@synthesize betSquare9 = _betSquare9;
@synthesize betSquare10 = _betSquare10;
@synthesize betSquare11 = _betSquare11;
@synthesize betSquare12 = _betSquare12;
@synthesize betSquare13 = _betSquare13;
@synthesize betSquare14 = _betSquare14;
@synthesize betSquare15 = _betSquare15;
@synthesize betSquare16 = _betSquare16;
@synthesize betSquare17 = _betSquare17;
@synthesize betSquare18 = _betSquare18;
@synthesize betSquare19 = _betSquare19;
@synthesize betSquare20 = _betSquare20;
@synthesize betSquare21 = _betSquare21;
@synthesize betSquare22 = _betSquare22;
@synthesize betSquare23 = _betSquare23;
@synthesize betSquare24 = _betSquare24;
@synthesize betSquare25 = _betSquare25;
@synthesize betSquare26 = _betSquare26;
@synthesize betSquare27 = _betSquare27;
@synthesize betSquare28 = _betSquare28;
@synthesize betSquare29 = _betSquare29;
@synthesize betSquare30 = _betSquare30;
@synthesize betSquare31 = _betSquare31;
@synthesize betSquare32 = _betSquare32;
@synthesize betSquare33 = _betSquare33;
@synthesize betSquare34 = _betSquare34;
@synthesize betSquare35 = _betSquare35;
@synthesize betSquare36 = _betSquare36;
@synthesize betSquare37 = _betSquare37;
@synthesize betSquare38 = _betSquare38;
@synthesize betSquare39 = _betSquare39;
@synthesize betSquare40 = _betSquare40;
@synthesize betSquare41 = _betSquare41;
@synthesize betSquare42 = _betSquare42;
@synthesize betSquare43 = _betSquare43;
@synthesize betSquare44 = _betSquare44;
@synthesize betSquare45 = _betSquare45;
@synthesize betSquare46 = _betSquare46;
@synthesize betSquare47 = _betSquare47;
@synthesize betSquare48 = _betSquare48;
@synthesize betSquare49 = _betSquare49;
@synthesize betSquare50 = _betSquare50;
@synthesize betSquare51 = _betSquare51;
@synthesize betSquare52 = _betSquare52;

@synthesize square1Result = _square1Result;
@synthesize square2Result = _square2Result;
@synthesize square3Result = _square3Result;
@synthesize square4Result = _square4Result;
@synthesize square5Result = _square5Result;
@synthesize square6Result = _square6Result;
@synthesize square7Result = _square7Result;
@synthesize square8Result = _square8Result;
@synthesize square9Result = _square9Result;
@synthesize square10Result = _square10Result;
@synthesize square11Result = _square11Result;
@synthesize square12Result = _square12Result;
@synthesize square13Result = _square13Result;
@synthesize square14Result = _square14Result;
@synthesize square15Result = _square15Result;
@synthesize square16Result = _square16Result;
@synthesize square17Result = _square17Result;
@synthesize square18Result = _square18Result;
@synthesize square19Result = _square19Result;
@synthesize square20Result = _square20Result;
@synthesize square21Result = _square21Result;
@synthesize square22Result = _square22Result;
@synthesize square23Result = _square23Result;
@synthesize square24Result = _square24Result;
@synthesize square25Result = _square25Result;
@synthesize square26Result = _square26Result;
@synthesize square27Result = _square27Result;
@synthesize square28Result = _square28Result;
@synthesize square29Result = _square29Result;
@synthesize square30Result = _square30Result;
@synthesize square31Result = _square31Result;
@synthesize square32Result = _square32Result;
@synthesize square33Result = _square33Result;
@synthesize square34Result = _square34Result;
@synthesize square35Result = _square35Result;
@synthesize square36Result = _square36Result;
@synthesize square37Result = _square37Result;
@synthesize square38Result = _square38Result;
@synthesize square39Result = _square39Result;
@synthesize square40Result = _square40Result;
@synthesize square41Result = _square41Result;
@synthesize square42Result = _square42Result;
@synthesize square43Result = _square43Result;
@synthesize square44Result = _square44Result;
@synthesize square45Result = _square45Result;
@synthesize square46Result = _square46Result;
@synthesize square47Result = _square47Result;
@synthesize square48Result = _square48Result;
@synthesize square49Result = _square49Result;
@synthesize square50Result = _square50Result;
@synthesize square51Result = _square51Result;
@synthesize square52Result = _square52Result;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)dealloc
{
    NSLog(@"bet view dealloc");
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    isBetSquareDelegateSet = NO;
    isBetSquareMaxBetSet = NO;
    return [super initWithCoder:aDecoder];
}

#pragma mark - internal
-(void)setupDelegate
{
    /*
    _betSquare1.theDelegate = self;
    _betSquare2.theDelegate = self;
    _betSquare3.theDelegate = self;
    _betSquare4.theDelegate = self;
    _betSquare5.theDelegate = self;
    _betSquare6.theDelegate = self;
    _betSquare7.theDelegate = self;
    _betSquare8.theDelegate = self;
    _betSquare9.theDelegate = self;
    _betSquare10.theDelegate = self;
    _betSquare11.theDelegate = self;
    _betSquare12.theDelegate = self;
    _betSquare13.theDelegate = self;
    _betSquare14.theDelegate = self;
    _betSquare15.theDelegate = self;
    _betSquare16.theDelegate = self;
    _betSquare17.theDelegate = self;
    _betSquare18.theDelegate = self;
    _betSquare19.theDelegate = self;
    _betSquare20.theDelegate = self;
    _betSquare21.theDelegate = self;
    _betSquare22.theDelegate = self;
    _betSquare23.theDelegate = self;
    _betSquare24.theDelegate = self;
    _betSquare25.theDelegate = self;
    _betSquare26.theDelegate = self;
    _betSquare27.theDelegate = self;
    _betSquare28.theDelegate = self;
    _betSquare29.theDelegate = self;
    _betSquare30.theDelegate = self;
    _betSquare31.theDelegate = self;
    _betSquare32.theDelegate = self;
    _betSquare33.theDelegate = self;
    _betSquare34.theDelegate = self;
    _betSquare35.theDelegate = self;
    _betSquare36.theDelegate = self;
    _betSquare37.theDelegate = self;
    _betSquare38.theDelegate = self;
    _betSquare39.theDelegate = self;
    _betSquare40.theDelegate = self;
    _betSquare41.theDelegate = self;
    _betSquare42.theDelegate = self;
    _betSquare43.theDelegate = self;
    _betSquare44.theDelegate = self;
    _betSquare45.theDelegate = self;
    _betSquare46.theDelegate = self;
    _betSquare47.theDelegate = self;
    _betSquare48.theDelegate = self;
    _betSquare49.theDelegate = self;
    _betSquare50.theDelegate = self;
    _betSquare51.theDelegate = self;
    _betSquare52.theDelegate = self;
     */
    
    for(int i = 1; i <= kNumberOfButton; i++)
    {
        NSString *tagStr = [NSString stringWithFormat:@"1%i", i];
        SBBetSquareView *squareView = (SBBetSquareView *)[self viewWithTag:[tagStr intValue]];
        
        squareView.theDelegate = self;
        
        tagStr = nil;
    }
}

#pragma mark - public interface
-(void)clearBetsWithoutFinalSet
{
    for(int i = 1; i <= kNumberOfButton; i++)
    {
        NSString *tagStr = [NSString stringWithFormat:@"1%i", i];
        SBBetSquareView *squareView = (SBBetSquareView *)[self viewWithTag:[tagStr intValue]];
        
        [squareView resetCurrentBetWithBetInfo:NO];
        
        if(squareView.betHistory == 0)
        {
            [squareView hideBetInfoView];
        }
        else
        {
            [squareView.betInfoView setBetFinalResult:squareView.betHistory];
        }
        
        tagStr = nil;
    }
    /*
    [_betSquare1 resetCurrentBetWithBetInfo:NO];
    [_betSquare2 resetCurrentBetWithBetInfo:NO];
    [_betSquare3 resetCurrentBetWithBetInfo:NO];
    [_betSquare4 resetCurrentBetWithBetInfo:NO];
    [_betSquare5 resetCurrentBetWithBetInfo:NO];
    [_betSquare6 resetCurrentBetWithBetInfo:NO];
    [_betSquare7 resetCurrentBetWithBetInfo:NO];
    [_betSquare8 resetCurrentBetWithBetInfo:NO];
    [_betSquare9 resetCurrentBetWithBetInfo:NO];
    [_betSquare10 resetCurrentBetWithBetInfo:NO];
    [_betSquare11 resetCurrentBetWithBetInfo:NO];
    
    if(_betSquare1.betHistory == 0)
    {
        [_betSquare1 hideBetInfoView];
    }
    else
    {
        [_betSquare1.betInfoView setBetFinalResult:_betSquare1.betHistory];
    }
    
    if(_betSquare2.betHistory == 0)
    {
        [_betSquare2 hideBetInfoView];
    }
    else
    {
        [_betSquare2.betInfoView setBetFinalResult:_betSquare2.betHistory];
    }
    
    if(_betSquare3.betHistory == 0)
    {
        [_betSquare3 hideBetInfoView];
    }
    else
    {
        [_betSquare3.betInfoView setBetFinalResult:_betSquare3.betHistory];
    }
    
    if(_betSquare4.betHistory == 0)
    {
        [_betSquare4 hideBetInfoView];
    }
    else
    {
        [_betSquare4.betInfoView setBetFinalResult:_betSquare4.betHistory];
    }
    
    if(_betSquare5.betHistory == 0)
    {
        [_betSquare5 hideBetInfoView];
    }
    else
    {
        [_betSquare5.betInfoView setBetFinalResult:_betSquare5.betHistory];
    }
    
    if(_betSquare6.betHistory == 0)
    {
        [_betSquare6 hideBetInfoView];
    }
    else
    {
        [_betSquare6.betInfoView setBetFinalResult:_betSquare6.betHistory];
    }
    
    if(_betSquare7.betHistory == 0)
    {
        [_betSquare7 hideBetInfoView];
    }
    else
    {
        [_betSquare7.betInfoView setBetFinalResult:_betSquare7.betHistory];
    }
    
    if(_betSquare8.betHistory == 0)
    {
        [_betSquare8 hideBetInfoView];
    }
    else
    {
        [_betSquare8.betInfoView setBetFinalResult:_betSquare8.betHistory];
    }
    
    if(_betSquare9.betHistory == 0)
    {
        [_betSquare9 hideBetInfoView];
    }
    else
    {
        [_betSquare9.betInfoView setBetFinalResult:_betSquare9.betHistory];
    }
    
    if(_betSquare10.betHistory == 0)
    {
        [_betSquare10 hideBetInfoView];
    }
    else
    {
        [_betSquare10.betInfoView setBetFinalResult:_betSquare10.betHistory];
    }
    
    if(_betSquare11.betHistory == 0)
    {
        [_betSquare11 hideBetInfoView];
    }
    else
    {
        [_betSquare11.betInfoView setBetFinalResult:_betSquare11.betHistory];
    }
     */
}

-(void)clearAllBetsWithHideInfo:(BOOL)yesOrNo
{
    [self clearBetsWithHideInfo:yesOrNo];
    
    [self setupCurrentMaxBet];
    
    //clean all tracking bet square
    if(bettedSquares)
        bettedSquares = nil;
}

-(void)clearBetsWithHideInfo:(BOOL)yesOrNo
{
    if(yesOrNo)
    {
        /**clear all bets info and info view**/
        /*
        [_betSquare1 hideBetInfoView];
        [_betSquare2 hideBetInfoView];
        [_betSquare3 hideBetInfoView];
        [_betSquare4 hideBetInfoView];
        [_betSquare5 hideBetInfoView];
        [_betSquare6 hideBetInfoView];
        [_betSquare7 hideBetInfoView];
        [_betSquare8 hideBetInfoView];
        [_betSquare9 hideBetInfoView];
        [_betSquare10 hideBetInfoView];
        [_betSquare11 hideBetInfoView];
        [_betSquare12 hideBetInfoView];
        [_betSquare13 hideBetInfoView];
        [_betSquare14 hideBetInfoView];
        [_betSquare15 hideBetInfoView];
        [_betSquare16 hideBetInfoView];
        [_betSquare17 hideBetInfoView];
        [_betSquare18 hideBetInfoView];
        [_betSquare19 hideBetInfoView];
        [_betSquare20 hideBetInfoView];
        [_betSquare21 hideBetInfoView];
        [_betSquare22 hideBetInfoView];
        [_betSquare23 hideBetInfoView];
        [_betSquare24 hideBetInfoView];
        [_betSquare25 hideBetInfoView];
        [_betSquare26 hideBetInfoView];
        [_betSquare27 hideBetInfoView];
        [_betSquare28 hideBetInfoView];
        [_betSquare29 hideBetInfoView];
        [_betSquare30 hideBetInfoView];
        [_betSquare31 hideBetInfoView];
        [_betSquare32 hideBetInfoView];
        [_betSquare33 hideBetInfoView];
        [_betSquare34 hideBetInfoView];
        [_betSquare35 hideBetInfoView];
        [_betSquare36 hideBetInfoView];
        [_betSquare37 hideBetInfoView];
        [_betSquare38 hideBetInfoView];
        [_betSquare39 hideBetInfoView];
        [_betSquare40 hideBetInfoView];
        [_betSquare41 hideBetInfoView];
        [_betSquare42 hideBetInfoView];
        [_betSquare43 hideBetInfoView];
        [_betSquare44 hideBetInfoView];
        [_betSquare45 hideBetInfoView];
        [_betSquare46 hideBetInfoView];
        [_betSquare47 hideBetInfoView];
        [_betSquare48 hideBetInfoView];
        [_betSquare49 hideBetInfoView];
        [_betSquare50 hideBetInfoView];
        [_betSquare51 hideBetInfoView];
        [_betSquare52 hideBetInfoView];
        
        [_betSquare1 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare2 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare3 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare4 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare5 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare6 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare7 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare8 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare9 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare10 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare11 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare12 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare13 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare14 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare15 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare16 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare17 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare18 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare19 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare20 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare21 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare22 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare23 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare24 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare25 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare26 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare27 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare28 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare29 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare30 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare31 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare32 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare33 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare34 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare35 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare36 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare37 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare38 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare39 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare40 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare41 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare42 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare43 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare44 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare45 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare46 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare47 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare48 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare49 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare50 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare51 resetCurrentBetWithBetInfo:yesOrNo];
        [_betSquare52 resetCurrentBetWithBetInfo:yesOrNo];
         */
        
        for(int i = 1; i <= kNumberOfButton; i++)
        {
            NSString *tagStr = [NSString stringWithFormat:@"1%i", i];
            SBBetSquareView *squareView = (SBBetSquareView *)[self viewWithTag:[tagStr intValue]];
            
            [squareView hideBetInfoView];
            [squareView resetCurrentBetWithBetInfo:yesOrNo];
            
            tagStr = nil;
        }
    }
}

-(NSMutableArray *)collectBetInfo
{
    NSMutableArray *infos = [[NSMutableArray alloc] init];
    
    for(int i = 1; i <= kNumberOfButton; i++)
    {
        NSString *tagStr = [NSString stringWithFormat:@"1%i", i];
        SBBetSquareView *squareView = (SBBetSquareView *)[self viewWithTag:[tagStr intValue]];
        
        [infos addObject:[NSNumber numberWithDouble:squareView.theCurrentBet]];
        
        tagStr = nil;
    }
    
    /*
    [infos addObject:[NSNumber numberWithDouble:_betSquare1.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare2.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare3.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare4.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare5.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare6.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare7.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare8.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare9.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare10.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare11.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare12.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare13.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare14.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare15.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare16.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare17.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare18.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare19.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare20.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare21.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare22.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare23.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare24.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare25.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare26.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare27.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare28.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare29.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare30.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare31.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare32.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare33.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare34.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare35.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare36.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare37.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare38.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare39.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare40.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare41.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare42.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare43.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare44.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare45.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare46.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare47.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare48.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare49.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare50.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare51.theCurrentBet]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare52.theCurrentBet]];
     */
    
    return infos;
}

-(void)displayPlayerBetResult
{
    //custom
    for(int i = 1; i <= kNumberOfButton; i++)
    {
        NSString *tagStr = [NSString stringWithFormat:@"1%i", i];
        SBBetSquareView *squareView = (SBBetSquareView *)[self viewWithTag:[tagStr intValue]];
        
        [squareView displayCurrentBetResult];
        
        tagStr = nil;
    }
    /*
    [_betSquare1 displayCurrentBetResult];
    [_betSquare2 displayCurrentBetResult];
    [_betSquare3 displayCurrentBetResult];
    [_betSquare4 displayCurrentBetResult];
    [_betSquare5 displayCurrentBetResult];
    [_betSquare6 displayCurrentBetResult];
    [_betSquare7 displayCurrentBetResult];
    [_betSquare8 displayCurrentBetResult];
    [_betSquare9 displayCurrentBetResult];
    [_betSquare10 displayCurrentBetResult];
    [_betSquare11 displayCurrentBetResult];
    [_betSquare12 displayCurrentBetResult];
    [_betSquare13 displayCurrentBetResult];
    [_betSquare14 displayCurrentBetResult];
    [_betSquare15 displayCurrentBetResult];
    [_betSquare16 displayCurrentBetResult];
    [_betSquare17 displayCurrentBetResult];
    [_betSquare18 displayCurrentBetResult];
    [_betSquare19 displayCurrentBetResult];
    [_betSquare20 displayCurrentBetResult];
    [_betSquare21 displayCurrentBetResult];
    [_betSquare22 displayCurrentBetResult];
    [_betSquare23 displayCurrentBetResult];
    [_betSquare24 displayCurrentBetResult];
    [_betSquare25 displayCurrentBetResult];
    [_betSquare26 displayCurrentBetResult];
    [_betSquare27 displayCurrentBetResult];
    [_betSquare28 displayCurrentBetResult];
    [_betSquare29 displayCurrentBetResult];
    [_betSquare30 displayCurrentBetResult];
    [_betSquare31 displayCurrentBetResult];
    [_betSquare32 displayCurrentBetResult];
    [_betSquare33 displayCurrentBetResult];
    [_betSquare34 displayCurrentBetResult];
    [_betSquare35 displayCurrentBetResult];
    [_betSquare36 displayCurrentBetResult];
    [_betSquare37 displayCurrentBetResult];
    [_betSquare38 displayCurrentBetResult];
    [_betSquare39 displayCurrentBetResult];
    [_betSquare40 displayCurrentBetResult];
    [_betSquare41 displayCurrentBetResult];
    [_betSquare42 displayCurrentBetResult];
    [_betSquare43 displayCurrentBetResult];
    [_betSquare44 displayCurrentBetResult];
    [_betSquare45 displayCurrentBetResult];
    [_betSquare46 displayCurrentBetResult];
    [_betSquare47 displayCurrentBetResult];
    [_betSquare48 displayCurrentBetResult];
    [_betSquare49 displayCurrentBetResult];
    [_betSquare50 displayCurrentBetResult];
    [_betSquare51 displayCurrentBetResult];
    [_betSquare52 displayCurrentBetResult];
     */
    
    isDisplayPlayerBetResult = YES;
}



-(void)setupBetSquare
{
    
    //make sure they do not appear
    for(int i = 1; i <= kNumberOfButton; i++)
    {
        NSString *tagStr = [NSString stringWithFormat:@"2%i", i];
        UIImageView *squareResult = (UIImageView *)[self viewWithTag:[tagStr intValue]];
        
        squareResult.hidden = YES;
        
        tagStr = nil;
    }
    /*
    _square1Result.hidden = YES;
    _square2Result.hidden = YES;
    _square3Result.hidden = YES;
    _square4Result.hidden = YES;
    _square5Result.hidden = YES;
    _square6Result.hidden = YES;
    _square7Result.hidden = YES;
    _square8Result.hidden = YES;
    _square9Result.hidden = YES;
    _square10Result.hidden = YES;
    _square11Result.hidden = YES;
    _square12Result.hidden = YES;
    _square13Result.hidden = YES;
    _square14Result.hidden = YES;
    _square15Result.hidden = YES;
    _square16Result.hidden = YES;
    _square17Result.hidden = YES;
    _square18Result.hidden = YES;
    _square19Result.hidden = YES;
    _square20Result.hidden = YES;
    _square21Result.hidden = YES;
    _square22Result.hidden = YES;
    _square23Result.hidden = YES;
    _square24Result.hidden = YES;
    _square25Result.hidden = YES;
    _square26Result.hidden = YES;
    _square27Result.hidden = YES;
    _square28Result.hidden = YES;
    _square29Result.hidden = YES;
    _square30Result.hidden = YES;
    _square31Result.hidden = YES;
    _square32Result.hidden = YES;
    _square33Result.hidden = YES;
    _square34Result.hidden = YES;
    _square35Result.hidden = YES;
    _square36Result.hidden = YES;
    _square37Result.hidden = YES;
    _square38Result.hidden = YES;
    _square39Result.hidden = YES;
    _square40Result.hidden = YES;
    _square41Result.hidden = YES;
    _square42Result.hidden = YES;
    _square43Result.hidden = YES;
    _square44Result.hidden = YES;
    _square45Result.hidden = YES;
    _square46Result.hidden = YES;
    _square47Result.hidden = YES;
    _square48Result.hidden = YES;
    _square49Result.hidden = YES;
    _square50Result.hidden = YES;
    _square51Result.hidden = YES;
    _square52Result.hidden = YES;
     */
}

-(void)setupCurrentMaxBet
{
    currentMaxBet = self.userInfo.max;
    
    double amount = 0;
    
    for(int i = 1; i <= kNumberOfButton; i++)
    {
        NSString *tagStr = [NSString stringWithFormat:@"1%i", i];
        SBBetSquareView *squareView = (SBBetSquareView *)[self viewWithTag:[tagStr intValue]];
        
        amount += squareView.betHistory;
    }
    
    //substract amount of bet had been apply
    currentMaxBet -= amount;
    
    if(currentMaxBet < 0)
    {
        currentMaxBet = 0;
    }
    
    for(int i = 1; i <= kNumberOfButton; i++)
    {
        NSString *tagStr = [NSString stringWithFormat:@"1%i", i];
        SBBetSquareView *squareView = (SBBetSquareView *)[self viewWithTag:[tagStr intValue]];
        
        squareView.maxBet = currentMaxBet;
    }
    
    /*
    double maxBet = self.userInfo.max;
    
    _betSquare1.maxBet = maxBet;
    _betSquare2.maxBet = maxBet;
    _betSquare3.maxBet = maxBet;
    _betSquare4.maxBet = maxBet;
    _betSquare5.maxBet = maxBet;
    _betSquare6.maxBet = maxBet;
    _betSquare7.maxBet = maxBet;
    _betSquare8.maxBet = maxBet;
    _betSquare9.maxBet = maxBet;
    _betSquare10.maxBet = maxBet;
    _betSquare11.maxBet = maxBet;
    _betSquare12.maxBet = maxBet;
    _betSquare13.maxBet = maxBet;
    _betSquare14.maxBet = maxBet;
    _betSquare15.maxBet = maxBet;
    _betSquare16.maxBet = maxBet;
    _betSquare17.maxBet = maxBet;
    _betSquare18.maxBet = maxBet;
    _betSquare19.maxBet = maxBet;
    _betSquare20.maxBet = maxBet;
    _betSquare21.maxBet = maxBet;
    _betSquare22.maxBet = maxBet;
    _betSquare23.maxBet = maxBet;
    _betSquare24.maxBet = maxBet;
    _betSquare25.maxBet = maxBet;
    _betSquare26.maxBet = maxBet;
    _betSquare27.maxBet = maxBet;
    _betSquare28.maxBet = maxBet;
    _betSquare29.maxBet = maxBet;
    _betSquare30.maxBet = maxBet;
    _betSquare31.maxBet = maxBet;
    _betSquare32.maxBet = maxBet;
    _betSquare33.maxBet = maxBet;
    _betSquare34.maxBet = maxBet;
    _betSquare35.maxBet = maxBet;
    _betSquare36.maxBet = maxBet;
    _betSquare37.maxBet = maxBet;
    _betSquare38.maxBet = maxBet;
    _betSquare39.maxBet = maxBet;
    _betSquare40.maxBet = maxBet;
    _betSquare41.maxBet = maxBet;
    _betSquare42.maxBet = maxBet;
    _betSquare43.maxBet = maxBet;
    _betSquare44.maxBet = maxBet;
    _betSquare45.maxBet = maxBet;
    _betSquare46.maxBet = maxBet;
    _betSquare47.maxBet = maxBet;
    _betSquare48.maxBet = maxBet;
    _betSquare49.maxBet = maxBet;
    _betSquare50.maxBet = maxBet;
    _betSquare51.maxBet = maxBet;
    _betSquare52.maxBet = maxBet;
     */
}

-(void)resetCurrentMaxBet
{
    currentMaxBet = self.userInfo.max;
    
    for(int i = 1; i <= kNumberOfButton; i++)
    {
        NSString *tagStr = [NSString stringWithFormat:@"1%i", i];
        SBBetSquareView *squareView = (SBBetSquareView *)[self viewWithTag:[tagStr intValue]];
        
        squareView.maxBet = currentMaxBet;
    }
}

-(void)changeAllBetSquaresMaxBetWithValue:(double)newMaxBet
{
    for(SBBetSquareView *betSquare in bettedSquares)
    {
        [betSquare changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    }
    
    /*
    [_betSquare1 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare2 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare3 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare4 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare5 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare6 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare7 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare8 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare9 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare10 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare11 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare12 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare13 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare14 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare15 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare16 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare17 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare18 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare19 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare20 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare21 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare22 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare23 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare24 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare25 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare26 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare27 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare28 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare29 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare30 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare31 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare32 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare33 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare34 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare35 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare36 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare37 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare38 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare39 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare40 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare41 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare42 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare43 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare44 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare45 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare46 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare47 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare48 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare49 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare50 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare51 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
    [_betSquare52 changeMaxBetAndBetInfoWithNewMaxBet:newMaxBet];
     */

}

-(BOOL)isBetOverBalanceWithBetAmount:(double)amount
{
    if(amount > self.updateInfo.credit)
        return YES;
    else
        return NO;
}

-(void)clearAllBetsWithHideInfo:(BOOL)yesOrNo WithHistory:(BOOL)hisYesOrNo
{
    [self clearBetsWithHideInfo:yesOrNo WithHistory:hisYesOrNo];
    
}

-(void)clearBetsWithHideInfo:(BOOL)yesOrNo WithHistory:(BOOL)hisYesOrNo
{
    NSLog(@"clear all bet info");
    
    if(yesOrNo)
    {
        /**clear all bets info and info view**/
        for(int i = 1; i <= kNumberOfButton; i++)
        {
            NSString *tagStr = [NSString stringWithFormat:@"1%i", i];
            SBBetSquareView *squareView = (SBBetSquareView *)[self viewWithTag:[tagStr intValue]];
            
            [squareView hideBetInfoView];
            [squareView resetCurrentBetWithBetInfo:yesOrNo];
            
            if(hisYesOrNo)
            {
                [squareView clearBetHistory];
            }
        }
        
        return;
    }
    
    
    for(int i = 1; i <= kNumberOfButton; i++)
    {
        NSString *tagStr = [NSString stringWithFormat:@"1%i", i];
        SBBetSquareView *squareView = (SBBetSquareView *)[self viewWithTag:[tagStr intValue]];
        
        [squareView resetCurrentBetWithBetInfo:yesOrNo];
        
        if(hisYesOrNo)
        {
            [squareView clearBetHistory];
        }
    }
}

-(void)applyAllBets
{
    for(int i = 1; i <= kNumberOfButton; i++)
    {
        NSString *tagStr = [NSString stringWithFormat:@"1%i", i];
        SBBetSquareView *squareView = (SBBetSquareView *)[self viewWithTag:[tagStr intValue]];
        
        [squareView doBetApply];
    }
}

-(NSMutableArray *)collectHistoryBetInfo
{
    NSMutableArray *infos = [[NSMutableArray alloc] init];
    
    for(int i = 1; i <= kNumberOfButton; i++)
    {
        NSString *tagStr = [NSString stringWithFormat:@"1%i", i];
        SBBetSquareView *squareView = (SBBetSquareView *)[self viewWithTag:[tagStr intValue]];
        
        [infos addObject:[NSNumber numberWithDouble:squareView.betHistory]];
    }
    
    return infos;
}

-(void)displayPlayerHistoryBetResult
{
    for(int i = 1; i <= kNumberOfButton; i++)
    {
        NSString *tagStr = [NSString stringWithFormat:@"1%i", i];
        SBBetSquareView *squareView = (SBBetSquareView *)[self viewWithTag:[tagStr intValue]];
        
        [squareView displayHistoryBetResult];
    }
    
    isDisplayPlayerBetResult = YES;
}

#pragma mark - Square result
-(void)showResult
{
    /**show result**/
    
    if(self.updateInfo.poker.count != 3)
    {
        /*
#ifdef DEBUG
        InternalErrorAlert(self, @"", @"update first row fail\nThere are no 3 dices");
#endif
         */
        return;
    }
    
    [self showResultForFirstRow];
    [self showResultForSecondRow];
    [self showResultForThirdRow];
    [self showResultForFourthRow];
    [self showResultForFifthRow];
}

-(void)showResultForFirstRow
{
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    NSArray *poker = self.updateInfo.poker;
    
    
    NSUInteger sum = 0;
    BOOL isOddSum = NO;
    BOOL isEvenSum = NO;
    
    //calculate sum
    for(NSString *dice in poker)
    {
        sum += [dice intValue];
    }
    
    //if odd or even
    if((sum%2) == 0)
    {
        isEvenSum = YES;
    }
    else if((sum%3) == 0)
    {
        isOddSum = YES;
    }
    
    //start process
    
    //11~17
    if(sum >= 11 && sum <= 17)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_1_01s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_1_01.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square1Result.hidden=NO;
        _square1Result.animationImages = anims;
        _square1Result.animationDuration=1.0f;
        _square1Result.animationRepeatCount=1;
        [_square1Result startAnimating];
    }
    
    //odd
    if(isOddSum)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_1_02s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_1_02.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square2Result.hidden=NO;
        _square2Result.animationImages = anims;
        _square2Result.animationDuration=1.0f;
        _square2Result.animationRepeatCount=1;
        [_square2Result startAnimating];
    }
    
    //even
    if(isEvenSum)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_1_03s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_1_03.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square3Result.hidden=NO;
        _square3Result.animationImages = anims;
        _square3Result.animationDuration=1.0f;
        _square3Result.animationRepeatCount=1;
        [_square3Result startAnimating];
    }
    
    //4~10
    if(sum >= 4 && sum <= 10)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_1_04s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_1_04.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square4Result.hidden=NO;
        _square4Result.animationImages = anims;
        _square4Result.animationDuration=1.0f;
        _square4Result.animationRepeatCount=1;
        [_square4Result startAnimating];
    }
}

-(void)showResultForSecondRow
{
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    NSArray *poker = self.updateInfo.poker;
    
    /**dice 6 count equal 2**/
    int numberOfDiceSixCount = 0;
    
    for(NSString *dice in poker)
    {
        if([dice intValue] == 6)
        {
            numberOfDiceSixCount++;
        }
    }
    
    if(numberOfDiceSixCount >= 2)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_01s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_01.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square5Result.hidden=NO;
        _square5Result.animationImages = anims;
        _square5Result.animationDuration=1.0f;
        _square5Result.animationRepeatCount=1;
        [_square5Result startAnimating];
    }
    
    /**dice 5 count equal 2**/
    int numberOfDiceFiveCount = 0;
    
    for(NSString *dice in poker)
    {
        if([dice intValue] == 5)
        {
            numberOfDiceFiveCount++;
        }
    }
    
    if(numberOfDiceFiveCount == 2)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_02s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_02.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square6Result.hidden=NO;
        _square6Result.animationImages = anims;
        _square6Result.animationDuration=1.0f;
        _square6Result.animationRepeatCount=1;
        [_square6Result startAnimating];
    }
    
    /**dice 4 count equal 2**/
    int numberOfDiceFourCount = 0;
    
    for(NSString *dice in poker)
    {
        if([dice intValue] == 4)
        {
            numberOfDiceFourCount++;
        }
    }
    
    if(numberOfDiceFourCount == 2)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_03s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_03.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square7Result.hidden=NO;
        _square7Result.animationImages = anims;
        _square7Result.animationDuration=1.0f;
        _square7Result.animationRepeatCount=1;
        [_square7Result startAnimating];
    }
    
    /**dice 3 count equal 2**/
    int numberOfDiceTreeCount = 0;
    
    for(NSString *dice in poker)
    {
        if([dice intValue] == 3)
        {
            numberOfDiceTreeCount++;
        }
    }
    
    if(numberOfDiceTreeCount == 2)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_04s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_04.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square8Result.hidden=NO;
        _square8Result.animationImages = anims;
        _square8Result.animationDuration=1.0f;
        _square8Result.animationRepeatCount=1;
        [_square8Result startAnimating];
    }
    
    /**dice 2 count equal 2**/
    int numberOfDiceTwoCount = 0;
    
    for(NSString *dice in poker)
    {
        if([dice intValue] == 2)
        {
            numberOfDiceTwoCount++;
        }
    }
    
    if(numberOfDiceTwoCount == 2)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_05s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_05.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square9Result.hidden=NO;
        _square9Result.animationImages = anims;
        _square9Result.animationDuration=1.0f;
        _square9Result.animationRepeatCount=1;
        [_square9Result startAnimating];
    }
    
    /**dice 1 count equal 2**/
    int numberOfDiceOneCount = 0;
    
    for(NSString *dice in poker)
    {
        if([dice intValue] == 1)
        {
            numberOfDiceOneCount++;
        }
    }
    
    if(numberOfDiceOneCount == 2)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_06s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_06.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square10Result.hidden=NO;
        _square10Result.animationImages = anims;
        _square10Result.animationDuration=1.0f;
        _square10Result.animationRepeatCount=1;
        [_square10Result startAnimating];
    }
    
    
    /**all dices are same and in a range from 1~6**/
    int firstDice = [[poker objectAtIndex:0] intValue];
    int secondDice = [[poker objectAtIndex:1] intValue];
    int thirdDice = [[poker objectAtIndex:2] intValue];

    if(firstDice == secondDice == thirdDice)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_07s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_07.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square11Result.hidden=NO;
        _square11Result.animationImages = anims;
        _square11Result.animationDuration=1.0f;
        _square11Result.animationRepeatCount=1;
        [_square11Result startAnimating];
        
        
        /**in range 1~6**/
        switch (firstDice) {
            case 6:
            {
                NSMutableArray *anims= [[NSMutableArray alloc]init];
                UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
                UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_08s.png"]];
                UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_08.png"]];
                [anims addObject:img1];
                if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                    [anims addObject:img2];
                else
                    [anims addObject:img3];
                
                
                _square12Result.hidden=NO;
                _square12Result.animationImages = anims;
                _square12Result.animationDuration=1.0f;
                _square12Result.animationRepeatCount=1;
                [_square12Result startAnimating];
                
                break;
            }
            case 5:
            {
                NSMutableArray *anims= [[NSMutableArray alloc]init];
                UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
                UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_09s.png"]];
                UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_09.png"]];
                [anims addObject:img1];
                if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                    [anims addObject:img2];
                else
                    [anims addObject:img3];
                
                
                _square13Result.hidden=NO;
                _square13Result.animationImages = anims;
                _square13Result.animationDuration=1.0f;
                _square13Result.animationRepeatCount=1;
                [_square13Result startAnimating];
                
                break;
            }
            case 4:
            {
                NSMutableArray *anims= [[NSMutableArray alloc]init];
                UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
                UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_10s.png"]];
                UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_10.png"]];
                [anims addObject:img1];
                if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                    [anims addObject:img2];
                else
                    [anims addObject:img3];
                
                
                _square14Result.hidden=NO;
                _square14Result.animationImages = anims;
                _square14Result.animationDuration=1.0f;
                _square14Result.animationRepeatCount=1;
                [_square14Result startAnimating];
                
                break;
            }
            case 3:
            {
                NSMutableArray *anims= [[NSMutableArray alloc]init];
                UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
                UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_11s.png"]];
                UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_11.png"]];
                [anims addObject:img1];
                if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                    [anims addObject:img2];
                else
                    [anims addObject:img3];
                
                
                _square15Result.hidden=NO;
                _square15Result.animationImages = anims;
                _square15Result.animationDuration=1.0f;
                _square15Result.animationRepeatCount=1;
                [_square15Result startAnimating];
                
                break;
            }
            case 2:
            {
                NSMutableArray *anims= [[NSMutableArray alloc]init];
                UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
                UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_12s.png"]];
                UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_12.png"]];
                [anims addObject:img1];
                if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                    [anims addObject:img2];
                else
                    [anims addObject:img3];
                
                
                _square16Result.hidden=NO;
                _square16Result.animationImages = anims;
                _square16Result.animationDuration=1.0f;
                _square16Result.animationRepeatCount=1;
                [_square16Result startAnimating];
                
                break;
            }
            case 1:
            {
                NSMutableArray *anims= [[NSMutableArray alloc]init];
                UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
                UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_13s.png"]];
                UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_2_13.png"]];
                [anims addObject:img1];
                if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                    [anims addObject:img2];
                else
                    [anims addObject:img3];
                
                
                _square17Result.hidden=NO;
                _square17Result.animationImages = anims;
                _square17Result.animationDuration=1.0f;
                _square17Result.animationRepeatCount=1;
                [_square17Result startAnimating];
                
                break;
            }
            default:
                break;
        }
        
    }
    else
    {
        //three dices are not equal
        return;
    }
}

-(void)showResultForThirdRow
{
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    NSArray *poker = self.updateInfo.poker;
    
    NSUInteger sum = 0;
    
    //calculate sum
    for(NSString *dice in poker)
    {
        sum += [dice intValue];
    }
    
    /**sum range in 4~17**/
    switch (sum)
    {
        case 17:
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_01s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_01.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square18Result.hidden=NO;
            _square18Result.animationImages = anims;
            _square18Result.animationDuration=1.0f;
            _square18Result.animationRepeatCount=1;
            [_square18Result startAnimating];
            
            break;
        }
        case 16:
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_02s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_02.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square19Result.hidden=NO;
            _square19Result.animationImages = anims;
            _square19Result.animationDuration=1.0f;
            _square19Result.animationRepeatCount=1;
            [_square19Result startAnimating];
            
            break;
        }
        case 15:
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_03s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_03.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square20Result.hidden=NO;
            _square20Result.animationImages = anims;
            _square20Result.animationDuration=1.0f;
            _square20Result.animationRepeatCount=1;
            [_square20Result startAnimating];
            
            break;
        }
        case 14:
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_04s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_04.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square21Result.hidden=NO;
            _square21Result.animationImages = anims;
            _square21Result.animationDuration=1.0f;
            _square21Result.animationRepeatCount=1;
            [_square21Result startAnimating];
            
            break;
        }
        case 13:
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_05s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_05.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square22Result.hidden=NO;
            _square22Result.animationImages = anims;
            _square22Result.animationDuration=1.0f;
            _square22Result.animationRepeatCount=1;
            [_square22Result startAnimating];
            
            break;
        }
        case 12:
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_06s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_06.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square23Result.hidden=NO;
            _square23Result.animationImages = anims;
            _square23Result.animationDuration=1.0f;
            _square23Result.animationRepeatCount=1;
            [_square23Result startAnimating];
            
            break;
        }
        case 11:
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_07s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_07.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square24Result.hidden=NO;
            _square24Result.animationImages = anims;
            _square24Result.animationDuration=1.0f;
            _square24Result.animationRepeatCount=1;
            [_square24Result startAnimating];
            
            break;
        }
        case 10:
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_08s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_08.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square25Result.hidden=NO;
            _square25Result.animationImages = anims;
            _square25Result.animationDuration=1.0f;
            _square25Result.animationRepeatCount=1;
            [_square25Result startAnimating];
            
            break;
        }
        case 9:
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_09s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_09.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square26Result.hidden=NO;
            _square26Result.animationImages = anims;
            _square26Result.animationDuration=1.0f;
            _square26Result.animationRepeatCount=1;
            [_square26Result startAnimating];
            
            break;
        }
        case 8:
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_10s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_10.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square27Result.hidden=NO;
            _square27Result.animationImages = anims;
            _square27Result.animationDuration=1.0f;
            _square27Result.animationRepeatCount=1;
            [_square27Result startAnimating];
            
            break;
        }
        case 7:
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_11s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_11.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square28Result.hidden=NO;
            _square28Result.animationImages = anims;
            _square28Result.animationDuration=1.0f;
            _square28Result.animationRepeatCount=1;
            [_square28Result startAnimating];
            
            break;
        }
        case 6:
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_12s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_12.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square29Result.hidden=NO;
            _square29Result.animationImages = anims;
            _square29Result.animationDuration=1.0f;
            _square29Result.animationRepeatCount=1;
            [_square29Result startAnimating];
            
            break;
        }
        case 5:
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_13s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_13.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square30Result.hidden=NO;
            _square30Result.animationImages = anims;
            _square30Result.animationDuration=1.0f;
            _square30Result.animationRepeatCount=1;
            [_square30Result startAnimating];
            
            break;
        }
        case 4:
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_14s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_3_14.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square31Result.hidden=NO;
            _square31Result.animationImages = anims;
            _square31Result.animationDuration=1.0f;
            _square31Result.animationRepeatCount=1;
            [_square31Result startAnimating];
            
            break;
        }
        default:
            break;
    }
    
}

-(void)showResultForFourthRow
{
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    NSArray *poker = self.updateInfo.poker;
    
    BOOL first = NO;
    BOOL second = NO;
    
    /**dice match pattern**/
    
    //6 & 5
    first = NO;
    second = NO;

    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 6)
            first = YES;
        else if(diceVal == 5)
            second = YES;
    }
    
    if(first && second )
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_01s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_01.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square32Result.hidden=NO;
        _square32Result.animationImages = anims;
        _square32Result.animationDuration=1.0f;
        _square32Result.animationRepeatCount=1;
        [_square32Result startAnimating];
    }
    
    //6 & 4
    first = NO;
    second = NO;
    
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 6)
            first = YES;
        else if(diceVal == 4)
            second = YES;
    }
    
    if(first && second)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_02s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_02.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square33Result.hidden=NO;
        _square33Result.animationImages = anims;
        _square33Result.animationDuration=1.0f;
        _square33Result.animationRepeatCount=1;
        [_square33Result startAnimating];
    }
    
    //5 & 4
    first = NO;
    second = NO;
    
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 5)
            first = YES;
        else if(diceVal == 4)
            second = YES;
    }
    
    if(first && second)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_03s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_03.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square34Result.hidden=NO;
        _square34Result.animationImages = anims;
        _square34Result.animationDuration=1.0f;
        _square34Result.animationRepeatCount=1;
        [_square34Result startAnimating];
    }
    
    //6 & 3
    first = NO;
    second = NO;
    
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 6)
            first = YES;
        else if(diceVal == 3)
            second = YES;
    }
    
    if(first && second)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_04s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_04.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square35Result.hidden=NO;
        _square35Result.animationImages = anims;
        _square35Result.animationDuration=1.0f;
        _square35Result.animationRepeatCount=1;
        [_square35Result startAnimating];
    }
    
    //5 & 3
    first = NO;
    second = NO;
    
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 5)
            first = YES;
        else if(diceVal == 3)
            second = YES;
    }
    
    if(first && second)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_05s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_05.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square36Result.hidden=NO;
        _square36Result.animationImages = anims;
        _square36Result.animationDuration=1.0f;
        _square36Result.animationRepeatCount=1;
        [_square36Result startAnimating];
    }
    
    //4 & 3
    first = NO;
    second = NO;
    
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 4)
            first = YES;
        else if(diceVal == 3)
            second = YES;
    }
    
    if(first && second)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_06s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_06.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square37Result.hidden=NO;
        _square37Result.animationImages = anims;
        _square37Result.animationDuration=1.0f;
        _square37Result.animationRepeatCount=1;
        [_square37Result startAnimating];
    }
    
    //6 & 2
    first = NO;
    second = NO;
    
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 6)
            first = YES;
        else if(diceVal == 2)
            second = YES;
    }
    
    if(first && second)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_07s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_07.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square38Result.hidden=NO;
        _square38Result.animationImages = anims;
        _square38Result.animationDuration=1.0f;
        _square38Result.animationRepeatCount=1;
        [_square38Result startAnimating];
    }
    
    //5 & 2
    first = NO;
    second = NO;
    
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 5)
            first = YES;
        else if(diceVal == 2)
            second = YES;
    }
    
    if(first && second)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_08s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_08.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square39Result.hidden=NO;
        _square39Result.animationImages = anims;
        _square39Result.animationDuration=1.0f;
        _square39Result.animationRepeatCount=1;
        [_square39Result startAnimating];
    }
    
    //4 & 2
    first = NO;
    second = NO;
    
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 4)
            first = YES;
        else if(diceVal == 2)
            second = YES;
    }
    
    if(first && second)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_09s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_09.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square40Result.hidden=NO;
        _square40Result.animationImages = anims;
        _square40Result.animationDuration=1.0f;
        _square40Result.animationRepeatCount=1;
        [_square40Result startAnimating];
    }
    
    //3 & 2
    first = NO;
    second = NO;
    
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 3)
            first = YES;
        else if(diceVal == 2)
            second = YES;
    }
    
    if(first && second)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_10s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_10.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square41Result.hidden=NO;
        _square41Result.animationImages = anims;
        _square41Result.animationDuration=1.0f;
        _square41Result.animationRepeatCount=1;
        [_square41Result startAnimating];
    }
    
    //6 & 1
    first = NO;
    second = NO;
    
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 6)
            first = YES;
        else if(diceVal == 1)
            second = YES;
    }
    
    if(first && second)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_11s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_11.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square42Result.hidden=NO;
        _square42Result.animationImages = anims;
        _square42Result.animationDuration=1.0f;
        _square42Result.animationRepeatCount=1;
        [_square42Result startAnimating];
    }
    
    //5 & 1
    first = NO;
    second = NO;
    
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 5)
            first = YES;
        else if(diceVal == 1)
            second = YES;
    }
    
    if(first && second)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_12s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_12.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square43Result.hidden=NO;
        _square43Result.animationImages = anims;
        _square43Result.animationDuration=1.0f;
        _square43Result.animationRepeatCount=1;
        [_square43Result startAnimating];
    }
    
    //4 & 1
    first = NO;
    second = NO;
    
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 4)
            first = YES;
        else if(diceVal == 1)
            second = YES;
    }
    
    if(first && second)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_13s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_13.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square44Result.hidden=NO;
        _square44Result.animationImages = anims;
        _square44Result.animationDuration=1.0f;
        _square44Result.animationRepeatCount=1;
        [_square44Result startAnimating];
    }
    
    //3 & 1
    first = NO;
    second = NO;
    
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 3)
            first = YES;
        else if(diceVal == 1)
            second = YES;
    }
    
    if(first && second)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_14s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_14.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square45Result.hidden=NO;
        _square45Result.animationImages = anims;
        _square45Result.animationDuration=1.0f;
        _square45Result.animationRepeatCount=1;
        [_square45Result startAnimating];
    }
    
    //2 & 1
    first = NO;
    second = NO;
    
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 2)
            first = YES;
        else if(diceVal == 1)
            second = YES;
    }
    
    if(first && second)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_15s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_4_15.png"]];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        
        _square46Result.hidden=NO;
        _square46Result.animationImages = anims;
        _square46Result.animationDuration=1.0f;
        _square46Result.animationRepeatCount=1;
        [_square46Result startAnimating];
    }
}

-(void)showResultForFifthRow
{
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    NSArray *poker = self.updateInfo.poker;
    
    /**any dice match pattern**/
    
    //6
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 6)
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_5_01s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_5_01.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square47Result.hidden=NO;
            _square47Result.animationImages = anims;
            _square47Result.animationDuration=1.0f;
            _square47Result.animationRepeatCount=1;
            [_square47Result startAnimating];
            
            break;
        }
    }
    
    //5
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 5)
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_5_02s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_5_02.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square48Result.hidden=NO;
            _square48Result.animationImages = anims;
            _square48Result.animationDuration=1.0f;
            _square48Result.animationRepeatCount=1;
            [_square48Result startAnimating];
            
            break;
        }
    }
    
    //4
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 4)
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_5_03s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_5_03.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square49Result.hidden=NO;
            _square49Result.animationImages = anims;
            _square49Result.animationDuration=1.0f;
            _square49Result.animationRepeatCount=1;
            [_square49Result startAnimating];
            
            break;
        }
    }
    
    //3
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 3)
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_5_04s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_5_04.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square50Result.hidden=NO;
            _square50Result.animationImages = anims;
            _square50Result.animationDuration=1.0f;
            _square50Result.animationRepeatCount=1;
            [_square50Result startAnimating];
            
            break;
        }
    }
    
    //2
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 2)
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_5_05s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_5_05.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square51Result.hidden=NO;
            _square51Result.animationImages = anims;
            _square51Result.animationDuration=1.0f;
            _square51Result.animationRepeatCount=1;
            [_square51Result startAnimating];
            
            break;
        }
    }
    
    //1
    for(NSString *dice in poker)
    {
        int diceVal = [dice intValue];
        
        if(diceVal == 1)
        {
            NSMutableArray *anims= [[NSMutableArray alloc]init];
            UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
            UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_5_06s.png"]];
            UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"sicarea_5_06.png"]];
            [anims addObject:img1];
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                [anims addObject:img2];
            else
                [anims addObject:img3];
            
            
            _square52Result.hidden=NO;
            _square52Result.animationImages = anims;
            _square52Result.animationDuration=1.0f;
            _square52Result.animationRepeatCount=1;
            [_square52Result startAnimating];
            
            break;
        }
    }
}

#pragma mark - override methods
-(void)updateView
{
    [super updateView];
    
    //set delegate for BetSquare if needed
    if(!isBetSquareDelegateSet)
    {
        [self setupDelegate];
        
        isBetSquareDelegateSet = YES;
    }
    
    if(!isBetSquareMaxBetSet)
    {
        [self setupCurrentMaxBet];
        
        isBetSquareMaxBetSet = YES;
    }
    

    
    /*
    NSArray *roundInfo = [self.updateInfo.roundNumber componentsSeparatedByString:@"-"];
    NSString *roundStr = [roundInfo objectAtIndex:1];//round number is at first e.g 3-12
    [self disableBetSquareByRound:30 currentRound:[roundStr intValue]];
    */
    
    if([self.updateInfo.status isEqualToString:GameStatusDealing])
    {
        /*
        //if player hit confirm bet result displayed and keep until waiting
        if(!isDisplayPlayerBetResult)
            [self clearAllBetsWithHideInfo:YES];
         */
    }
    else if ([self.updateInfo.status isEqualToString:GameStatusBetting])
    {
        //if this is first time enter betting status
        if(isDisplayPlayerBetResult && lastGameStatus == GameStatusWaiting)
        {
            //player was confirm bet and first time enter betting status
            isDisplayPlayerBetResult = NO;
            [self clearAllBetsWithHideInfo:YES];
            //[self setupCurrentMaxBet];
            [self resetCurrentMaxBet];
        }
        else if (isDisplayPlayerBetResult == NO && lastGameStatus == GameStatusWaiting)
        {
            //player was not confirm bet and first enter betting status
            [self clearAllBetsWithHideInfo:YES];
            //[self setupCurrentMaxBet];
            [self resetCurrentMaxBet];
        }
        
        [self setupBetSquare];
        
        lastGameStatus = GameStatusBetting;
    }
    else if([self.updateInfo.status isEqualToString:GameStatusWaiting])
    {
        lastGameStatus = GameStatusWaiting;
        /*
        isDisplayPlayerBetResult = NO;
        */
        
        [self showResult];
    }
}

#pragma mark - BetSquareView delegate
-(BOOL)BetSquareViewIsTotalBetOverBalance:(BetSquareView *)betSquare withCurrentBet:(double)currentBet
{
    //calculate amount
    double amount = 0;
    
    for(int i = 1; i <= kNumberOfButton ; i++)
    {
        NSString *tagStr = [NSString stringWithFormat:@"1%i", i];
        SBBetSquareView *squareView = (SBBetSquareView *)[self viewWithTag:[tagStr intValue]];
        
        amount += squareView.theCurrentBet;
        
        tagStr = nil;
    }
    amount += currentBet;
    
    /*
    double amount = _betSquare1.theCurrentBet + _betSquare2.theCurrentBet + _betSquare3.theCurrentBet + _betSquare4.theCurrentBet + _betSquare5.theCurrentBet + _betSquare6.theCurrentBet + _betSquare7.theCurrentBet + _betSquare8.theCurrentBet + _betSquare9.theCurrentBet + _betSquare10.theCurrentBet + _betSquare11.theCurrentBet + _betSquare12.theCurrentBet + _betSquare13.theCurrentBet + _betSquare14.theCurrentBet + _betSquare15.theCurrentBet + _betSquare16.theCurrentBet + _betSquare17.theCurrentBet + _betSquare18.theCurrentBet + _betSquare19.theCurrentBet + _betSquare20.theCurrentBet + _betSquare21.theCurrentBet + _betSquare22.theCurrentBet + _betSquare23.theCurrentBet +_betSquare24.theCurrentBet + _betSquare25.theCurrentBet + _betSquare26.theCurrentBet + _betSquare27.theCurrentBet + _betSquare28.theCurrentBet + _betSquare29.theCurrentBet + _betSquare30.theCurrentBet + _betSquare31.theCurrentBet + _betSquare32.theCurrentBet + _betSquare33.theCurrentBet + _betSquare34.theCurrentBet + _betSquare35.theCurrentBet + _betSquare36.theCurrentBet + _betSquare37.theCurrentBet + _betSquare38.theCurrentBet + _betSquare39.theCurrentBet + _betSquare40.theCurrentBet + _betSquare41.theCurrentBet + _betSquare42.theCurrentBet + _betSquare43.theCurrentBet + _betSquare44.theCurrentBet + _betSquare45.theCurrentBet + _betSquare46.theCurrentBet + _betSquare47.theCurrentBet + _betSquare48.theCurrentBet + _betSquare49.theCurrentBet + _betSquare50.theCurrentBet + _betSquare51.theCurrentBet + _betSquare52.theCurrentBet + currentBet;
     */
    
    if([self isBetOverBalanceWithBetAmount:amount])
    {
        NSString *msg = NSLocalizedString(@"金额不足", @"金额不足");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", @"确定") otherButtonTitles: nil];
        [alertView show];
        
        return YES;
    }
    else
    {
        return NO;
    }
}

-(BOOL)BetSquareViewShouldBet:(BetSquareView *)betSquare
{
    if(selectedChip != nil)
    {
        if(selectedChip.chipValue > self.updateInfo.credit)
        {
            NSString *msg = NSLocalizedString(@"金额不足", @"金额不足");
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", @"确定") otherButtonTitles: nil];
            [alertView show];
            
            return NO;
        }
        else if(selectedChip.chipValue < self.userInfo.min)
        {
            NSString *msg = NSLocalizedString(@"低于最小下注金额", @"低于最小下注金额");
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", @"确定") otherButtonTitles: nil];
            [alertView show];
            
            return NO;
        }
        
        return YES;
    }
    else
    {
        NSString *title = NSLocalizedString(@"-警告-", @"-警告-");
        NSString *msg = NSLocalizedString(@"请选择下注筹码", @"请选择下注筹码");
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", @"确定") otherButtonTitles: nil];
        [alertView show];
        
        return NO;
    }
}

-(double)BetSquareViewValueToBet:(BetSquareView *)betSquare
{
    if(selectedChip != nil)
        return selectedChip.chipValue;
    else
        return 0;
}

-(void)BetSquareWillDoBet:(BetSquareView *)betSquare
{
    //before square procees bet we need to update max bet
    betSquare.maxBet = currentMaxBet;
}

-(void)BetSquareDoBet:(BetSquareView *)betSquare
{
    if(bettedSquares == nil)
        bettedSquares = [[NSMutableSet alloc] init];
    
    //add bet square to tracking list
    [bettedSquares addObject:betSquare];
    
    //update current max bet
    currentMaxBet = betSquare.maxBet;
    
    //need to update tracked bet square's maxbet
    [self changeAllBetSquaresMaxBetWithValue:betSquare.maxBet];
}

-(void)clearAllBetTemp
{
    for(int i = 1; i <= kNumberOfButton; i++)
    {
        NSString *tagStr = [NSString stringWithFormat:@"1%i", i];
        SBBetSquareView *squareView = (SBBetSquareView *)[self viewWithTag:[tagStr intValue]];
        
        [squareView clearTempBet];
        
        tagStr = nil;
    }
    /*
    [_betSquare1 clearTempBet];
    [_betSquare2 clearTempBet];
    [_betSquare3 clearTempBet];
    [_betSquare4 clearTempBet];
    [_betSquare5 clearTempBet];
    [_betSquare6 clearTempBet];
    [_betSquare7 clearTempBet];
    [_betSquare8 clearTempBet];
    [_betSquare9 clearTempBet];
    [_betSquare10 clearTempBet];
    [_betSquare11 clearTempBet];
    [_betSquare12 clearTempBet];
    [_betSquare13 clearTempBet];
    [_betSquare14 clearTempBet];
    [_betSquare15 clearTempBet];
    [_betSquare16 clearTempBet];
    [_betSquare17 clearTempBet];
    [_betSquare18 clearTempBet];
    [_betSquare19 clearTempBet];
    [_betSquare20 clearTempBet];
    [_betSquare21 clearTempBet];
    [_betSquare22 clearTempBet];
    [_betSquare23 clearTempBet];
    [_betSquare24 clearTempBet];
    [_betSquare25 clearTempBet];
    [_betSquare26 clearTempBet];
    [_betSquare27 clearTempBet];
    [_betSquare28 clearTempBet];
    [_betSquare29 clearTempBet];
    [_betSquare30 clearTempBet];
    [_betSquare31 clearTempBet];
    [_betSquare32 clearTempBet];
    [_betSquare33 clearTempBet];
    [_betSquare34 clearTempBet];
    [_betSquare35 clearTempBet];
    [_betSquare36 clearTempBet];
    [_betSquare37 clearTempBet];
    [_betSquare38 clearTempBet];
    [_betSquare39 clearTempBet];
    [_betSquare40 clearTempBet];
    [_betSquare41 clearTempBet];
    [_betSquare42 clearTempBet];
    [_betSquare43 clearTempBet];
    [_betSquare44 clearTempBet];
    [_betSquare45 clearTempBet];
    [_betSquare46 clearTempBet];
    [_betSquare47 clearTempBet];
    [_betSquare48 clearTempBet];
    [_betSquare49 clearTempBet];
    [_betSquare50 clearTempBet];
    [_betSquare51 clearTempBet];
    [_betSquare52 clearTempBet];
     */
}

-(void)disableAllBetSquares
{
    for(int i = 1; i <= kNumberOfButton; i++)
    {
        NSString *tagStr = [NSString stringWithFormat:@"1%i", i];
        SBBetSquareView *squareView = (SBBetSquareView *)[self viewWithTag:[tagStr intValue]];
        
        squareView.enabled = NO;
        
        tagStr = nil;
    }
}

-(void)enableAllBetSquares
{
    for(int i = 1; i <= kNumberOfButton; i++)
    {
        NSString *tagStr = [NSString stringWithFormat:@"1%i", i];
        SBBetSquareView *squareView = (SBBetSquareView *)[self viewWithTag:[tagStr intValue]];
        
        squareView.enabled = YES;
        
        tagStr = nil;
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

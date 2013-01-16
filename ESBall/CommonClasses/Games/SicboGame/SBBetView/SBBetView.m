//
//  SBBetView.m
//  ESBall
//
//  Created by Nelson on 1/7/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "SBBetView.h"

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
    return [super initWithCoder:aDecoder];
}

#pragma mark - internal
-(void)setupDelegate
{
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
}

#pragma mark - public interface
-(void)clearAllBetsWithHideInfo:(BOOL)yesOrNo
{
    [self clearBetsWithHideInfo:yesOrNo];
}

-(NSMutableArray *)collectBetInfo
{
    NSMutableArray *infos = [[NSMutableArray alloc] init];
    
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
    
    return infos;
}

-(void)displayPlayerBetResult
{
    //custom
}

-(void)clearBetsWithHideInfo:(BOOL)yesOrNo
{
    //custom
    /*
    [_betSquare1 resetCurrentBet];
    [_betSquare2 resetCurrentBet];
    [_betSquare3 resetCurrentBet];
    [_betSquare4 resetCurrentBet];
    [_betSquare5 resetCurrentBet];
    [_betSquare6 resetCurrentBet];
    [_betSquare7 resetCurrentBet];
    [_betSquare8 resetCurrentBet];
    [_betSquare9 resetCurrentBet];
    [_betSquare10 resetCurrentBet];
    [_betSquare11 resetCurrentBet];
    [_betSquare12 resetCurrentBet];
    [_betSquare13 resetCurrentBet];
    [_betSquare14 resetCurrentBet];
    [_betSquare15 resetCurrentBet];
    [_betSquare16 resetCurrentBet];
    [_betSquare17 resetCurrentBet];
    [_betSquare18 resetCurrentBet];
    [_betSquare19 resetCurrentBet];
    [_betSquare20 resetCurrentBet];
    [_betSquare21 resetCurrentBet];
    [_betSquare22 resetCurrentBet];
    [_betSquare23 resetCurrentBet];
    [_betSquare24 resetCurrentBet];
    [_betSquare25 resetCurrentBet];
    [_betSquare26 resetCurrentBet];
    [_betSquare27 resetCurrentBet];
    [_betSquare28 resetCurrentBet];
    [_betSquare29 resetCurrentBet];
    [_betSquare30 resetCurrentBet];
    [_betSquare31 resetCurrentBet];
    [_betSquare32 resetCurrentBet];
    [_betSquare33 resetCurrentBet];
    [_betSquare34 resetCurrentBet];
    [_betSquare35 resetCurrentBet];
    [_betSquare36 resetCurrentBet];
    [_betSquare37 resetCurrentBet];
    [_betSquare38 resetCurrentBet];
    [_betSquare39 resetCurrentBet];
    [_betSquare40 resetCurrentBet];
    [_betSquare41 resetCurrentBet];
    [_betSquare42 resetCurrentBet];
    [_betSquare43 resetCurrentBet];
    [_betSquare44 resetCurrentBet];
    [_betSquare45 resetCurrentBet];
    [_betSquare46 resetCurrentBet];
    [_betSquare47 resetCurrentBet];
    [_betSquare48 resetCurrentBet];
    [_betSquare49 resetCurrentBet];
    [_betSquare50 resetCurrentBet];
    [_betSquare51 resetCurrentBet];
    [_betSquare52 resetCurrentBet];
     */
}

-(void)setupBetSquare
{
    
}

-(BOOL)isBetOverBalanceWithBetAmount:(double)amount
{
    if(amount > self.updateInfo.credit)
        return YES;
    else
        return NO;
}

#pragma mark - Square result
-(void)showResult
{
    /**show result**/
    
    NSString *resultStr = [self getResultWithResultCode:self.updateInfo.result];
    if(resultStr)
        [self showResultWithString:resultStr];
    else
        NSLog(@"Bet view result is nil");
}

-(NSString *)getResultWithResultCode:(NSUInteger)result
{
    return @"";
}

-(void)showResultWithString:(NSString *)result
{
    
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
        [self setupBetSquare];
    }
    else if([self.updateInfo.status isEqualToString:GameStatusWaiting])
    {
        /*
        isDisplayPlayerBetResult = NO;
        
        [self showResult];
         */
    }
    
}

#pragma mark - BetSquareView delegate
-(BOOL)BetSquareViewIsTotalBetOverBalance:(BetSquareView *)betSquare withCurrentBet:(double)currentBet
{
    //calculate amount
    double amount = _betSquare1.theCurrentBet + _betSquare2.theCurrentBet + _betSquare3.theCurrentBet + _betSquare4.theCurrentBet + _betSquare5.theCurrentBet + _betSquare6.theCurrentBet + _betSquare7.theCurrentBet + _betSquare8.theCurrentBet + _betSquare9.theCurrentBet + _betSquare10.theCurrentBet + _betSquare11.theCurrentBet + _betSquare12.theCurrentBet + _betSquare13.theCurrentBet + _betSquare14.theCurrentBet + _betSquare15.theCurrentBet + _betSquare16.theCurrentBet + _betSquare17.theCurrentBet + _betSquare18.theCurrentBet + _betSquare19.theCurrentBet + _betSquare20.theCurrentBet + _betSquare21.theCurrentBet + _betSquare22.theCurrentBet + _betSquare23.theCurrentBet +_betSquare24.theCurrentBet + _betSquare25.theCurrentBet + _betSquare26.theCurrentBet + _betSquare27.theCurrentBet + _betSquare28.theCurrentBet + _betSquare29.theCurrentBet + _betSquare30.theCurrentBet + _betSquare31.theCurrentBet + _betSquare32.theCurrentBet + _betSquare33.theCurrentBet + _betSquare34.theCurrentBet + _betSquare35.theCurrentBet + _betSquare36.theCurrentBet + _betSquare37.theCurrentBet + _betSquare38.theCurrentBet + _betSquare39.theCurrentBet + _betSquare40.theCurrentBet + _betSquare41.theCurrentBet + _betSquare42.theCurrentBet + _betSquare43.theCurrentBet + _betSquare44.theCurrentBet + _betSquare45.theCurrentBet + _betSquare46.theCurrentBet + _betSquare47.theCurrentBet + _betSquare48.theCurrentBet + _betSquare49.theCurrentBet + _betSquare50.theCurrentBet + _betSquare51.theCurrentBet + _betSquare52.theCurrentBet + currentBet;
    
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

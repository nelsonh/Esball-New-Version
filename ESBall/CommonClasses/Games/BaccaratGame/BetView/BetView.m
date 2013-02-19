//
//  BetView.m
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "BetView.h"
#import "FileFinder.h"

@interface BetView ()


@end

@implementation BetView

@synthesize theBetViewDelegate = _theBetViewDelegate;

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

#pragma mark - public interface overridable
-(NSUInteger)numberOfRoundToDisableBetSquare
{
    //default 30 round
    return 30;
}

#pragma mark - public interface
-(void)clearBetsWithoutFinalSet
{
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
        
        if(hisYesOrNo)
        {
            [_betSquare1 clearBetHistory];
            [_betSquare2 clearBetHistory];
            [_betSquare3 clearBetHistory];
            [_betSquare4 clearBetHistory];
            [_betSquare5 clearBetHistory];
            [_betSquare6 clearBetHistory];
            [_betSquare7 clearBetHistory];
            [_betSquare8 clearBetHistory];
            [_betSquare9 clearBetHistory];
            [_betSquare10 clearBetHistory];
            [_betSquare11 clearBetHistory];
        }
        
        return;
    }
    
    
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
    
    if(hisYesOrNo)
    {
        [_betSquare1 clearBetHistory];
        [_betSquare2 clearBetHistory];
        [_betSquare3 clearBetHistory];
        [_betSquare4 clearBetHistory];
        [_betSquare5 clearBetHistory];
        [_betSquare6 clearBetHistory];
        [_betSquare7 clearBetHistory];
        [_betSquare8 clearBetHistory];
        [_betSquare9 clearBetHistory];
        [_betSquare10 clearBetHistory];
        [_betSquare11 clearBetHistory];
    }
}

-(void)restoreBetToLastState
{
    [_betSquare1 restoreLastBetState];
    [_betSquare2 restoreLastBetState];
    [_betSquare3 restoreLastBetState];
    [_betSquare4 restoreLastBetState];
    [_betSquare5 restoreLastBetState];
    [_betSquare6 restoreLastBetState];
    [_betSquare7 restoreLastBetState];
    [_betSquare8 restoreLastBetState];
    [_betSquare9 restoreLastBetState];
    [_betSquare10 restoreLastBetState];
    [_betSquare11 restoreLastBetState];
}

-(NSArray *)collectAllBetSqaures
{
    NSMutableArray *squares = [[NSMutableArray alloc] init];
    
    [squares addObject:_betSquare1];
    [squares addObject:_betSquare2];
    [squares addObject:_betSquare3];
    [squares addObject:_betSquare4];
    [squares addObject:_betSquare5];
    [squares addObject:_betSquare6];
    [squares addObject:_betSquare7];
    [squares addObject:_betSquare8];
    [squares addObject:_betSquare9];
    [squares addObject:_betSquare10];
    [squares addObject:_betSquare11];
    
    return squares;
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
    
    return infos;
}

-(NSMutableArray *)collectHistoryBetInfo
{
     NSMutableArray *infos = [[NSMutableArray alloc] init];
    
    [infos addObject:[NSNumber numberWithDouble:_betSquare1.betHistory]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare2.betHistory]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare3.betHistory]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare4.betHistory]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare5.betHistory]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare6.betHistory]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare7.betHistory]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare8.betHistory]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare9.betHistory]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare10.betHistory]];
    [infos addObject:[NSNumber numberWithDouble:_betSquare11.betHistory]];
    
    return infos;
}

-(void)displayPlayerBetResult
{
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
    
    isDisplayPlayerBetResult = YES;
}

-(void)displayPlayerHistoryBetResult
{
    [_betSquare1 displayHistoryBetResult];
    [_betSquare2 displayHistoryBetResult];
    [_betSquare3 displayHistoryBetResult];
    [_betSquare4 displayHistoryBetResult];
    [_betSquare5 displayHistoryBetResult];
    [_betSquare6 displayHistoryBetResult];
    [_betSquare7 displayHistoryBetResult];
    [_betSquare8 displayHistoryBetResult];
    [_betSquare9 displayHistoryBetResult];
    [_betSquare10 displayHistoryBetResult];
    [_betSquare11 displayHistoryBetResult];
    
    isDisplayPlayerBetResult = YES;
}

-(void)disableBetSquareByRound:(NSUInteger)round currentRound:(NSUInteger)curRound
{
    if(curRound > round)
    {
        _betSquare1.enabled = NO;
        _betSquare2.enabled = NO;
        _betSquare11.enabled = NO;
        _betSquare10.enabled = NO;
        _betSquare3.enabled = NO;
        _betSquare8.enabled = NO;
        
        if([_theBetViewDelegate respondsToSelector:@selector(BetViewGreaterThanCertainRound:round:)])
        {
            [_theBetViewDelegate BetViewGreaterThanCertainRound:self round:round];
        }

    }
    else
    {
        _betSquare1.enabled = YES;
        _betSquare2.enabled = YES;
        _betSquare11.enabled = YES;
        _betSquare10.enabled = YES;
        _betSquare3.enabled = YES;
        _betSquare8.enabled = YES;
        
        if([_theBetViewDelegate respondsToSelector:@selector(BetViewLessThanCertainRound:round:)])
        {
            [_theBetViewDelegate BetViewLessThanCertainRound:self round:round];
        }
    }
}



-(void)setupBetSquare
{
    /**assing value to BetSquare**/
    double maxBet = self.userInfo.max;
    double ou = self.userInfo.ou;
    double pair = self.userInfo.pair;
    double tie = self.userInfo.tie;
    
    
    //assign bet information
    _betSquare1.maxBet = maxBet;
    _betSquare2.maxBet = maxBet;
    _betSquare3.maxBet = ou;
    _betSquare4.maxBet = pair;
    _betSquare5.maxBet = maxBet;
    _betSquare6.maxBet = tie;
    _betSquare7.maxBet = maxBet;
    _betSquare8.maxBet = ou;
    _betSquare9.maxBet = pair;
    _betSquare10.maxBet = maxBet;
    _betSquare11.maxBet = maxBet;
    
    //make sure they do not appear
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
}

-(void)applyAllBets
{
    [_betSquare1 doBetApply];
    [_betSquare2 doBetApply];
    [_betSquare3 doBetApply];
    [_betSquare4 doBetApply];
    [_betSquare5 doBetApply];
    [_betSquare6 doBetApply];
    [_betSquare7 doBetApply];
    [_betSquare8 doBetApply];
    [_betSquare9 doBetApply];
    [_betSquare10 doBetApply];
    [_betSquare11 doBetApply];
}

-(void)clearAllBetTemp
{
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

//iphone need to override and change image name
-(void)showResultWithString:(NSString *)result
{
    
    NSString *resultdata = result;
    
    FileFinder *fileFinder = [FileFinder fileFinder];

    if ([resultdata rangeOfString:@"PO"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_P02s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_P02@2x.png"]];
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
    
    if ([resultdata rangeOfString:@"PE"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_P03s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_P03@2x.png"]];
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
    
    if ([resultdata rangeOfString:@"PP"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_P04s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_P04@2x.png"]];
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
    
    if ([resultdata rangeOfString:@"Tie"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_T01s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_T01@2x.png"]];
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
    
    if ([resultdata rangeOfString:@"BP"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_B02s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_B04@2x.png"]];
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
    if ([resultdata rangeOfString:@"BE"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_B03s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_B03@2x.png"]];
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
    
    if ([resultdata rangeOfString:@"BO"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_B04s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_B02@2x.png"]];
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
    
    if ([resultdata rangeOfString:@"Player"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_P01s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_P01@2x.png"]];
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
    
    if ([resultdata rangeOfString:@"Small"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_T02s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_T02@2x.png"]];
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
    
    if ([resultdata rangeOfString:@"BIG"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_T03s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_T03@2x.png"]];
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
    
    if ([resultdata rangeOfString:@"Banker"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"colorless.png"]];
        UIImage *img2= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_B01s.png"]];
        UIImage *img3= [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"area_B01@2x.png"]];
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
    }
     
    

}

-(NSString *)getResultWithResultCode:(NSUInteger)result
{
    
    int indexResult = result;
    NSString *returnStr ;
    
    if (indexResult>0)
    {
        bool Player=NO ;//0
        bool PO=NO;//1
        bool PE=NO;//2
        bool PP=NO;//3
        bool BP=NO;//4
        bool BE=NO;//5
        bool BO=NO;//6
        bool Banker=NO;//7
        bool BIG=NO;//8
        bool Tie=NO;//9
        bool Small=NO;//10
        
        if (indexResult<97)
        {
            switch(indexResult)
            {
                case(1):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    break;
                case(2):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BP=YES;
                    
                    break;
                case(3):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    
                    break;
                case(4):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BP=YES;
                    
                    break;
                case(5):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    Player = YES;//閒
                    
                    break;
                case(6):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BP=YES;
                    Player = YES;//閒
                    
                    break;
                case(7):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    Player = YES;//閒
                    
                    break;
                case(8):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BP=YES;
                    Player = YES;//閒
                    
                    break;
                case(9):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    Tie = YES;//平
                    break;
                case(10):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BP=YES;
                    Tie = YES;//平
                    
                    break;
                case(11):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    Tie = YES;//平
                    
                    break;
                case(12):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    
                    break;
                case(13):
                    Banker=YES;//莊
                    PO = YES;//閒單
                    BO=YES;//莊單
                    Small= YES;//小
                    
                    break;
                case(14):
                    Banker=YES;//莊
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BP=YES;
                    Small= YES;//小
                    
                    break;
                case(15):
                    Banker=YES;//莊
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    Small= YES;//小
                    
                    break;
                case(16):
                    Banker=YES;//莊
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BP=YES;
                    Small= YES;//小
                    
                    break;
                case(17):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    Player = YES;//閒
                    Small= YES;//小
                    
                    break;
                case(18):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BP=YES;
                    Player = YES;//閒
                    Small= YES;//小
                    
                    break;
                case(19):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    Player = YES;//閒
                    Small= YES;//小
                    
                    break;
                case(20):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BP=YES;
                    Player = YES;//閒
                    Small= YES;//小
                    
                    break;
                case(21):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    Tie = YES;//平
                    Small= YES;//小
                    
                    break;
                case(22):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    
                    break;
                case(23):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    Tie = YES;//平
                    Small= YES;//小
                    
                    break;
                case(24):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    
                    break;
                case(25):
                    Banker=YES;//莊
                    BIG=YES;//大
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(26):
                    Banker=YES;//莊
                    BIG=YES;//大
                    BP=YES;
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    break;
                case(27):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PP = YES;//閒對
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(28):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(29):
                    BIG=YES;//大
                    Player = YES;//閒
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(30):
                    BIG=YES;//大
                    BP=YES;
                    Player = YES;//閒
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(31):
                    BIG=YES;//大
                    PP = YES;//閒對
                    Player = YES;//閒
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(32):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    Player = YES;//閒
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(33):
                    BIG=YES;//大
                    Tie = YES;//平
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(34):
                    BIG=YES;//大
                    BP=YES;
                    Tie = YES;//平
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(35):
                    BIG=YES;//大
                    PP = YES;//閒對
                    Tie = YES;//平
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(36):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(37):
                    Banker=YES;//莊
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(38):
                    Banker=YES;//莊
                    BP=YES;
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(39):
                    Banker=YES;//莊
                    PP = YES;//閒對
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    Small= YES;//小
                    
                    break;
                case(40):
                    Banker=YES;//莊
                    PP = YES;//閒對
                    BP=YES;
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(41):
                    Player = YES;//閒
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(42):
                    BP=YES;
                    Player = YES;//閒
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(43):
                    PP = YES;//閒對
                    Player = YES;//閒
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(44):
                    PP = YES;//閒對
                    BP=YES;
                    Player = YES;//閒
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(45):
                    Tie = YES;//平
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(46):
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(47):
                    PP = YES;//閒對
                    Tie = YES;//平
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(48):
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(49):
                    Banker=YES;//莊
                    BIG=YES;//大
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(50):
                    Banker=YES;//莊
                    BIG=YES;//大
                    BP=YES;
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(51):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PP = YES;//閒對
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(52):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(53):
                    BIG=YES;//大
                    Player = YES;//閒
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(54):
                    BIG=YES;//大
                    BP=YES;
                    Player = YES;//閒
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(55):
                    BIG=YES;//大
                    PP = YES;//閒對
                    Player = YES;//閒
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(56):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    Player = YES;//閒
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(57):
                    BIG=YES;//大
                    Tie = YES;//平
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(58):
                    BIG=YES;//大
                    BP=YES;
                    Tie = YES;//平
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(59):
                    BIG=YES;//大
                    PP = YES;//閒對
                    Tie = YES;//平
                    BE = YES;
                    PO = YES;
                    
                    break;
                case(60):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    BE = YES;
                    PO = YES;
                    
                    break;
                case(61):
                    Banker=YES;//莊
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(62):
                    Banker=YES;//莊
                    BP=YES;
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(63):
                    Banker=YES;//莊
                    PP = YES;//閒對
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(64):
                    Banker=YES;//莊
                    PP = YES;//閒對
                    BP=YES;
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(65):
                    Player = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(66):
                    BP=YES;
                    Player = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(67):
                    PP = YES;//閒對
                    Player = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(68):
                    PP = YES;//閒對
                    BP=YES;
                    Player = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(69):
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(70):
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(71):
                    PP = YES;//閒對
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(72):
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(73):
                    Banker=YES;//莊
                    BIG=YES;//大
                    BE=YES;
                    PE = YES;//閒雙
                    
                    
                    break;
                case(74):
                    Banker=YES;//莊
                    BIG=YES;//大
                    BP=YES;
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(75):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PP = YES;//閒對
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(76):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(77):
                    BIG=YES;//大
                    Player = YES;//閒
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(78):
                    BIG=YES;//大
                    BP=YES;
                    Player = YES;//閒
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(79):
                    BIG=YES;//大
                    PP = YES;//閒對
                    Player = YES;//閒
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                    
                case(80):
                    PP = YES;//閒對
                    BP=YES;
                    BIG=YES;//大
                    Player = YES;//閒
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(81):
                    BIG=YES;//大
                    Tie = YES;//平
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(82):
                    BIG=YES;//大
                    BP=YES;
                    Tie = YES;//平
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(83):
                    BIG=YES;//大
                    PP = YES;//閒對
                    Tie = YES;//平
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(84):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(85):
                    Banker=YES;//莊
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(86):
                    Banker=YES;//莊
                    BP=YES;
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(87):
                    Banker=YES;//莊
                    PP = YES;//閒對
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(88):
                    Banker=YES;//莊
                    PP = YES;//閒對
                    BP=YES;
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(89):
                    Player = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(90):
                    BP=YES;
                    Player = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(91):
                    PP = YES;//閒對
                    Player = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(92):
                    PP = YES;//閒對
                    BP=YES;
                    Player = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(93):
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(94):
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(95):
                    PP = YES;//閒對
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(96):
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    break;
            }

            /*
            switch(indexResult)
            {
                case(1):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    break;
                case(2):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BP=YES;
                    
                    break;
                case(3):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    
                    break;
                case(4):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BP=YES;
                    
                    break;
                case(5):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BPlayer = YES;//閒
                    
                    break;
                case(6):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BP=YES;
                    BPlayer = YES;//閒
                    
                    break;
                case(7):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BPlayer = YES;//閒
                    
                    break;
                case(8):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BP=YES;
                    BPlayer = YES;//閒
                    
                    break;
                case(9):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    Tie = YES;//平
                    break;
                case(10):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BP=YES;
                    Tie = YES;//平
                    
                    break;
                case(11):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    Tie = YES;//平
                    
                    break;
                case(12):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    
                    break;
                case(13):
                    Banker=YES;//莊
                    PO = YES;//閒單
                    BO=YES;//莊單
                    Small= YES;//小
                    
                    break;
                case(14):
                    Banker=YES;//莊
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BP=YES;
                    Small= YES;//小
                    
                    break;
                case(15):
                    Banker=YES;//莊
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    Small= YES;//小
                    
                    break;
                case(16):
                    Banker=YES;//莊
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BP=YES;
                    Small= YES;//小
                    
                    break;
                case(17):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BPlayer = YES;//閒
                    Small= YES;//小
                    
                    break;
                case(18):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BP=YES;
                    BPlayer = YES;//閒
                    Small= YES;//小
                    
                    break;
                case(19):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BPlayer = YES;//閒
                    Small= YES;//小
                    
                    break;
                case(20):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BP=YES;
                    BPlayer = YES;//閒
                    Small= YES;//小
                    
                    break;
                case(21):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    Tie = YES;//平
                    Small= YES;//小
                    
                    break;
                case(22):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    
                    break;
                case(23):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    Tie = YES;//平
                    Small= YES;//小
                    
                    break;
                case(24):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    
                    break;
                case(25):
                    Banker=YES;//莊
                    BIG=YES;//大
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(26):
                    Banker=YES;//莊
                    BIG=YES;//大
                    BP=YES;
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    break;
                case(27):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PP = YES;//閒對
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(28):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(29):
                    BIG=YES;//大
                    BPlayer = YES;//閒
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(30):
                    BIG=YES;//大
                    BP=YES;
                    BPlayer = YES;//閒
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(31):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BPlayer = YES;//閒
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(32):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    BPlayer = YES;//閒
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(33):
                    BIG=YES;//大
                    Tie = YES;//平
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(34):
                    BIG=YES;//大
                    BP=YES;
                    Tie = YES;//平
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(35):
                    BIG=YES;//大
                    PP = YES;//閒對
                    Tie = YES;//平
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(36):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(37):
                    Banker=YES;//莊
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(38):
                    Banker=YES;//莊
                    BP=YES;
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(39):
                    Banker=YES;//莊
                    PP = YES;//閒對
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    Small= YES;//小
                    
                    break;
                case(40):
                    Banker=YES;//莊
                    PP = YES;//閒對
                    BP=YES;
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(41):
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(42):
                    BP=YES;
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(43):
                    PP = YES;//閒對
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(44):
                    PP = YES;//閒對
                    BP=YES;
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(45):
                    Tie = YES;//平
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(46):
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(47):
                    PP = YES;//閒對
                    Tie = YES;//平
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(48):
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(49):
                    Banker=YES;//莊
                    BIG=YES;//大
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(50):
                    Banker=YES;//莊
                    BIG=YES;//大
                    BP=YES;
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(51):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PP = YES;//閒對
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(52):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(53):
                    BIG=YES;//大
                    BPlayer = YES;//閒
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(54):
                    BIG=YES;//大
                    BP=YES;
                    BPlayer = YES;//閒
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(55):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BPlayer = YES;//閒
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(56):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    BPlayer = YES;//閒
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(57):
                    BIG=YES;//大
                    Tie = YES;//平
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(58):
                    BIG=YES;//大
                    BP=YES;
                    Tie = YES;//平
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(59):
                    BIG=YES;//大
                    PP = YES;//閒對
                    Tie = YES;//平
                    
                    
                    break;
                case(60):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    
                    break;
                case(61):
                    Banker=YES;//莊
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(62):
                    Banker=YES;//莊
                    BP=YES;
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(63):
                    Banker=YES;//莊
                    PP = YES;//閒對
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(64):
                    Banker=YES;//莊
                    PP = YES;//閒對
                    BP=YES;
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(65):
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(66):
                    BP=YES;
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(67):
                    PP = YES;//閒對
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(68):
                    PP = YES;//閒對
                    BP=YES;
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(69):
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(70):
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(71):
                    PP = YES;//閒對
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(72):
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(73):
                    Banker=YES;//莊
                    BIG=YES;//大
                    BE=YES;
                    PE = YES;//閒雙
                    
                    
                    break;
                case(74):
                    Banker=YES;//莊
                    BIG=YES;//大
                    BP=YES;
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(75):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PP = YES;//閒對
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(76):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(77):
                    BIG=YES;//大
                    BPlayer = YES;//閒
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(78):
                    BIG=YES;//大
                    BP=YES;
                    BPlayer = YES;//閒
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(79):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BPlayer = YES;//閒
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                    
                case(80):
                    PP = YES;//閒對
                    BP=YES;
                    BIG=YES;//大
                    BPlayer = YES;//閒
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(81):
                    BIG=YES;//大
                    Tie = YES;//平
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(82):
                    BIG=YES;//大
                    BP=YES;
                    Tie = YES;//平
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(83):
                    BIG=YES;//大
                    PP = YES;//閒對
                    Tie = YES;//平
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(84):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(85):
                    Banker=YES;//莊
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(86):
                    Banker=YES;//莊
                    BP=YES;
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(87):
                    Banker=YES;//莊
                    PP = YES;//閒對
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(88):
                    Banker=YES;//莊
                    PP = YES;//閒對
                    BP=YES;
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(89):
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(90):
                    BP=YES;
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(91):
                    PP = YES;//閒對
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(92):
                    PP = YES;//閒對
                    BP=YES;
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(93):
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(94):
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(95):
                    PP = YES;//閒對
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(96):
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    break;
            }
            */
            
        }/*else
        {
            if ((indexResult & 7) ==1)
                Banker=YES;
            
            if ((indexResult & 7) ==2)
                BPlayer=YES;
            
            if ((indexResult & 7) ==4)
                Tie=YES;
            
            if ((indexResult & 24) ==8)
                BE=YES;
            
            if ((indexResult & 24) ==16)
                BP=YES;
            
            if ((indexResult & 96) ==32)
                PE=YES;
            
            if ((indexResult & 96) ==64)
                PP=YES;
            
            if ((indexResult & 384) ==128)
                BO=YES;
            
            if ((indexResult & 384) ==256)
                BIG=YES;
            
            if ((indexResult & 1536) ==512)
                PO=YES;
            
            if ((indexResult & 1536) ==1024)
                Small=YES;
        }
          */
        
        returnStr=@"";
        if ( Player==YES )//0
            returnStr = [returnStr stringByAppendingString:@"Player,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];
        
        if ( PO==YES )//1
            returnStr = [returnStr stringByAppendingString:@"PO,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];
        
        if ( PE==YES )//2
            returnStr = [returnStr stringByAppendingString:@"PE,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];
        
        if ( PP==YES )//3
            returnStr = [returnStr stringByAppendingString:@"PP,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];
        
        if ( BP==YES )//4
            returnStr = [returnStr stringByAppendingString:@"BP,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];
        
        if ( BE==YES )//5
            returnStr = [returnStr stringByAppendingString:@"BE,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];
        
        if ( BO==YES )//6
            returnStr = [returnStr stringByAppendingString:@"BO,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];
        
        if ( Banker==YES )//7
            returnStr = [returnStr stringByAppendingString:@"Banker,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];
        
        if ( BIG==YES )//8
            returnStr = [returnStr stringByAppendingString:@"BIG,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];
        
        
        if ( Tie==YES )//9
            returnStr = [returnStr stringByAppendingString:@"Tie,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];
        
        
        if ( Small==YES )//10
            returnStr = [returnStr stringByAppendingString:@"Small,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];
        
        //NSLog(@"123abc",returnStr);
        
    }
    
    //NSLog(@"result:%@", returnStr);
    
    return returnStr;
}

#pragma mark - override methods
-(void)updateView
{
    [super updateView];
    
    //set delegate for BetSquare if needed
    if(!isBetSquareDelegateSet)
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
        
        isBetSquareDelegateSet = YES;
    }
    
    /**if greater equal to 30 round**/
    NSArray *roundInfo = [self.updateInfo.roundNumber componentsSeparatedByString:@"-"];
    NSString *roundStr = [roundInfo objectAtIndex:1];//round number is at first e.g 3-12
    [self disableBetSquareByRound:[self numberOfRoundToDisableBetSquare] currentRound:[roundStr intValue]];
    
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
            [self clearAllBetsWithHideInfo:YES WithHistory:YES];
            [self clearAllBetTemp];
        }
        else if (isDisplayPlayerBetResult == NO && lastGameStatus == GameStatusWaiting)
        {
            //player was not confirm bet and first enter betting status
            [self clearAllBetsWithHideInfo:YES WithHistory:YES];
            [self clearAllBetTemp];
        }
        
        lastGameStatus = GameStatusBetting;
        [self setupBetSquare];
    }
    else if([self.updateInfo.status isEqualToString:GameStatusWaiting])
    {
        lastGameStatus = GameStatusWaiting;
        
        /*
        isDisplayPlayerBetResult = NO;
        
        [self clearAllBetsWithHideInfo:YES];
         */
        
        [self showResult];
    }
    
}

#pragma mark - BetSquareView delegate
-(BOOL)BetSquareViewIsTotalBetOverBalance:(BetSquareView *)betSquare withCurrentBet:(double)currentBet
{
    //calculate amount, currentBet wasn't apply to bet square yet
    double amount = _betSquare1.theCurrentBet + _betSquare2.theCurrentBet + _betSquare3.theCurrentBet + _betSquare4.theCurrentBet + _betSquare5.theCurrentBet + _betSquare6.theCurrentBet + _betSquare7.theCurrentBet + _betSquare8.theCurrentBet + _betSquare9.theCurrentBet + _betSquare10.theCurrentBet + _betSquare11.theCurrentBet + currentBet;
    
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

-(BOOL)BetSquareViewShouldBet:(BetSquareView *)betSquare;
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
        /*
        else if(betSquare.theCurrentBet<= 0 && selectedChip.chipValue < self.userInfo.min)
        {
            NSString *msg = NSLocalizedString(@"低于最小下注金额", @"低于最小下注金额");
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", @"确定") otherButtonTitles: nil];
            [alertView show];
            
            return NO;
        }
         */
        
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

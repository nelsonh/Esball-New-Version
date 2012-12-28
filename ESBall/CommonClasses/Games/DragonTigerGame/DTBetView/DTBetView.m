//
//  DTBetView.m
//  ESBall
//
//  Created by Nelson on 12/18/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "DTBetView.h"

@interface DTBetView ()


@end

@implementation DTBetView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - override methods
-(void)updateView
{
    [super updateView];
}

-(NSString *)getResultWithResultCode:(NSUInteger)result
{
    int indexResult = result;
    NSString *returnStr ;
    
    if (indexResult>0)
    {
        bool BPlayer=NO ;//0
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
        
        returnStr=@"";
        if ( BPlayer==YES )//0
            returnStr = [returnStr stringByAppendingString:@"BPlayer,"];
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

-(void)disableBetSquareByRound:(NSUInteger)round currentRound:(NSUInteger)curRound
{
    if(curRound > round)
    {
        self.betSquare1.enabled = NO;
        self.betSquare2.enabled = NO;
        self.betSquare3.enabled = NO;
        self.betSquare4.enabled = NO;
        self.betSquare8.enabled = NO;
        self.betSquare9.enabled = NO;
        self.betSquare10.enabled = NO;
        self.betSquare11.enabled = NO;
        
        if([self.theBetViewDelegate respondsToSelector:@selector(BetViewGreaterThanThirtyRound:)])
        {
            [self.theBetViewDelegate BetViewGreaterThanThirtyRound:self];
        }
        
    }
    else
    {
        self.betSquare1.enabled = YES;
        self.betSquare2.enabled = YES;
        self.betSquare3.enabled = YES;
        self.betSquare4.enabled = YES;
        self.betSquare8.enabled = YES;
        self.betSquare9.enabled = YES;
        self.betSquare10.enabled = YES;
        self.betSquare11.enabled = YES;
        
        if([self.theBetViewDelegate respondsToSelector:@selector(BetViewLessThanThirtyRound:)])
        {
            [self.theBetViewDelegate BetViewLessThanThirtyRound:self];
        }
    }
}

-(void)setupBetSquare
{
    /**assing value to BetSquare**/
    double maxBet = self.userInfo.max;
    double tie = self.userInfo.tie;
    
    
    //assign bet information
    self.betSquare1.maxBet = maxBet;
    self.betSquare2.maxBet = maxBet;
    self.betSquare3.maxBet = maxBet;
    self.betSquare4.maxBet = maxBet;
    self.betSquare5.maxBet = maxBet;
    self.betSquare6.maxBet = tie;
    self.betSquare7.maxBet = maxBet;
    self.betSquare8.maxBet = maxBet;
    self.betSquare9.maxBet = maxBet;
    self.betSquare10.maxBet = maxBet;
    self.betSquare11.maxBet = maxBet;
    
    //make sure they do not appear
    self.square1Result.hidden = YES;
    self.square2Result.hidden = YES;
    self.square3Result.hidden = YES;
    self.square4Result.hidden = YES;
    self.square5Result.hidden = YES;
    self.square6Result.hidden = YES;
    self.square7Result.hidden = YES;
    self.square8Result.hidden = YES;
    self.square9Result.hidden = YES;
    self.square10Result.hidden = YES;
    self.square11Result.hidden = YES;
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

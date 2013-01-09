//
//  SBBetView.h
//  ESBall
//
//  Created by Nelson on 1/7/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "BetAreaView.h"
#import "BetSquareView.h"

@interface SBBetView : BetAreaView<BetSquareViewDelegate>{
    
    //player hit confirm this will be yes otherwise no
    BOOL isDisplayPlayerBetResult;
    
    BOOL isBetSquareDelegateSet;
}

@property (nonatomic, weak) IBOutlet BetSquareView *betSquare1;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare2;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare3;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare4;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare5;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare6;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare7;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare8;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare9;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare10;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare11;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare12;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare13;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare14;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare15;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare16;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare17;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare18;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare19;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare20;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare21;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare22;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare23;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare24;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare25;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare26;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare27;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare28;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare29;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare30;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare31;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare32;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare33;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare34;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare35;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare36;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare37;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare38;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare39;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare40;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare41;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare42;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare43;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare44;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare45;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare46;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare47;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare48;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare49;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare50;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare51;
@property (nonatomic, weak) IBOutlet BetSquareView *betSquare52;

-(void)clearBets;
-(void)showResult;
-(BOOL)isBetOverBalanceWithBetAmount:(double)amount;

-(void)clearAllBets;
-(NSMutableArray *)collectBetInfo;//return each signle bet in double as an array
-(void)displayPlayerBetResult;

-(NSString *)getResultWithResultCode:(NSUInteger)result;
-(void)showResultWithString:(NSString *)result;
-(void)setupBetSquare;
-(void)setupDelegate;

@end

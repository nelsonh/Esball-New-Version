//
//  SBBetView.h
//  ESBall
//
//  Created by Nelson on 1/7/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "BetAreaView.h"
#import "SBBetSquareView.h"

@interface SBBetView : BetAreaView<BetSquareViewDelegate>{
    
    //player hit confirm this will be yes otherwise no
    BOOL isDisplayPlayerBetResult;
    
    BOOL isBetSquareDelegateSet;
    
    BOOL isBetSquareMaxBetSet;
    
    NSString *lastGameStatus;
    
    double currentMaxBet;//tracking current max bet for all bet square
    
    NSMutableSet *bettedSquares;//tracking bet square we tapped
}

@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare1;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare2;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare3;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare4;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare5;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare6;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare7;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare8;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare9;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare10;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare11;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare12;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare13;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare14;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare15;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare16;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare17;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare18;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare19;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare20;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare21;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare22;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare23;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare24;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare25;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare26;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare27;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare28;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare29;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare30;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare31;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare32;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare33;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare34;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare35;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare36;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare37;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare38;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare39;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare40;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare41;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare42;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare43;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare44;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare45;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare46;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare47;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare48;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare49;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare50;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare51;
@property (nonatomic, weak) IBOutlet SBBetSquareView *betSquare52;

@property (nonatomic, weak) IBOutlet UIImageView *square1Result;
@property (nonatomic, weak) IBOutlet UIImageView *square2Result;
@property (nonatomic, weak) IBOutlet UIImageView *square3Result;
@property (nonatomic, weak) IBOutlet UIImageView *square4Result;
@property (nonatomic, weak) IBOutlet UIImageView *square5Result;
@property (nonatomic, weak) IBOutlet UIImageView *square6Result;
@property (nonatomic, weak) IBOutlet UIImageView *square7Result;
@property (nonatomic, weak) IBOutlet UIImageView *square8Result;
@property (nonatomic, weak) IBOutlet UIImageView *square9Result;
@property (nonatomic, weak) IBOutlet UIImageView *square10Result;
@property (nonatomic, weak) IBOutlet UIImageView *square11Result;
@property (nonatomic, weak) IBOutlet UIImageView *square12Result;
@property (nonatomic, weak) IBOutlet UIImageView *square13Result;
@property (nonatomic, weak) IBOutlet UIImageView *square14Result;
@property (nonatomic, weak) IBOutlet UIImageView *square15Result;
@property (nonatomic, weak) IBOutlet UIImageView *square16Result;
@property (nonatomic, weak) IBOutlet UIImageView *square17Result;
@property (nonatomic, weak) IBOutlet UIImageView *square18Result;
@property (nonatomic, weak) IBOutlet UIImageView *square19Result;
@property (nonatomic, weak) IBOutlet UIImageView *square20Result;
@property (nonatomic, weak) IBOutlet UIImageView *square21Result;
@property (nonatomic, weak) IBOutlet UIImageView *square22Result;
@property (nonatomic, weak) IBOutlet UIImageView *square23Result;
@property (nonatomic, weak) IBOutlet UIImageView *square24Result;
@property (nonatomic, weak) IBOutlet UIImageView *square25Result;
@property (nonatomic, weak) IBOutlet UIImageView *square26Result;
@property (nonatomic, weak) IBOutlet UIImageView *square27Result;
@property (nonatomic, weak) IBOutlet UIImageView *square28Result;
@property (nonatomic, weak) IBOutlet UIImageView *square29Result;
@property (nonatomic, weak) IBOutlet UIImageView *square30Result;
@property (nonatomic, weak) IBOutlet UIImageView *square31Result;
@property (nonatomic, weak) IBOutlet UIImageView *square32Result;
@property (nonatomic, weak) IBOutlet UIImageView *square33Result;
@property (nonatomic, weak) IBOutlet UIImageView *square34Result;
@property (nonatomic, weak) IBOutlet UIImageView *square35Result;
@property (nonatomic, weak) IBOutlet UIImageView *square36Result;
@property (nonatomic, weak) IBOutlet UIImageView *square37Result;
@property (nonatomic, weak) IBOutlet UIImageView *square38Result;
@property (nonatomic, weak) IBOutlet UIImageView *square39Result;
@property (nonatomic, weak) IBOutlet UIImageView *square40Result;
@property (nonatomic, weak) IBOutlet UIImageView *square41Result;
@property (nonatomic, weak) IBOutlet UIImageView *square42Result;
@property (nonatomic, weak) IBOutlet UIImageView *square43Result;
@property (nonatomic, weak) IBOutlet UIImageView *square44Result;
@property (nonatomic, weak) IBOutlet UIImageView *square45Result;
@property (nonatomic, weak) IBOutlet UIImageView *square46Result;
@property (nonatomic, weak) IBOutlet UIImageView *square47Result;
@property (nonatomic, weak) IBOutlet UIImageView *square48Result;
@property (nonatomic, weak) IBOutlet UIImageView *square49Result;
@property (nonatomic, weak) IBOutlet UIImageView *square50Result;
@property (nonatomic, weak) IBOutlet UIImageView *square51Result;
@property (nonatomic, weak) IBOutlet UIImageView *square52Result;

-(void)clearBetsWithoutFinalSet;
-(void)clearBetsWithHideInfo:(BOOL)yesOrNo;
-(void)showResult;
-(BOOL)isBetOverBalanceWithBetAmount:(double)amount;
-(void)showResultForFirstRow;
-(void)showResultForSecondRow;
-(void)showResultForThirdRow;
-(void)showResultForFourthRow;
-(void)showResultForFifthRow;

-(void)clearAllBetsWithHideInfo:(BOOL)yesOrNo;
-(NSMutableArray *)collectBetInfo;//return each signle bet in double as an array
-(void)displayPlayerBetResult;

//-(NSString *)getResultWithResultCode:(NSUInteger)result;
//-(void)showResultWithString:(NSString *)result;
-(void)setupBetSquare;
-(void)setupDelegate;
-(void)setupCurrentMaxBet;
-(void)changeAllBetSquaresMaxBetWithValue:(double)newMaxBet;

@end

//
//  BetView.h
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

/**
 this is responsible for bet but ChipView
 **/

//can be subclass

#import <UIKit/UIKit.h>
#import "BetAreaView.h"
#import "BetSquareView.h"

@class BetView;

@protocol BetViewDelegate <NSObject>

@optional

-(void)BetViewGreaterThanThirtyRound:(BetView *)betView;
-(void)BetViewLessThanThirtyRound:(BetView *)betView;

@end

@interface BetView : BetAreaView<BetSquareViewDelegate>{
    
    //player hit confirm this will be yes otherwise no
    BOOL isDisplayPlayerBetResult;
    
    BOOL isBetSquareDelegateSet;
}

@property (nonatomic, weak) id<BetViewDelegate> theBetViewDelegate;

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

@property (nonatomic , weak) IBOutlet UIImageView *square1Result;
@property (nonatomic , weak) IBOutlet UIImageView *square2Result;
@property (nonatomic , weak) IBOutlet UIImageView *square3Result;
@property (nonatomic , weak) IBOutlet UIImageView *square4Result;
@property (nonatomic , weak) IBOutlet UIImageView *square5Result;
@property (nonatomic , weak) IBOutlet UIImageView *square6Result;
@property (nonatomic , weak) IBOutlet UIImageView *square7Result;
@property (nonatomic , weak) IBOutlet UIImageView *square8Result;
@property (nonatomic , weak) IBOutlet UIImageView *square9Result;
@property (nonatomic , weak) IBOutlet UIImageView *square10Result;
@property (nonatomic , weak) IBOutlet UIImageView *square11Result;

-(void)clearBets;
-(void)showResult;
-(BOOL)isBetOverBalanceWithBetAmount:(double)amount;

-(void)clearAllBets;
-(NSMutableArray *)collectBetInfo;//return each signle bet in double as an array
-(void)displayPlayerBetResult;

-(NSString *)getResultWithResultCode:(NSUInteger)result;
-(void)showResultWithString:(NSString *)result;
-(void)disableBetSquareByRound:(NSUInteger)round currentRound:(NSUInteger)curRound;
-(void)setupBetSquare;

@end

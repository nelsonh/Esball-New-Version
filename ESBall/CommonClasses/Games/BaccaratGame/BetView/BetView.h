//
//  BetView.h
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//



//can be subclass

#import <UIKit/UIKit.h>
#import "BetAreaView.h"
#import "BetSquareView.h"

@class BetView;

/**
 * A protocol of BetView
 */
@protocol BetViewDelegate <NSObject>

@optional

/**
 * Fire when round greater than certain round
 */
-(void)BetViewGreaterThanCertainRound:(BetView *)betView round:(NSUInteger)round;

/**
 * Fire when round less than certain round
 */
-(void)BetViewLessThanCertainRound:(BetView *)betView round:(NSUInteger)round;

@end

/**
 * BetView subclass of BetAreaView
 * this is responsible for bet but ChipView
 */
@interface BetView : BetAreaView<BetSquareViewDelegate>{
    
    //player hit bet confirm this will be yes otherwise no
    BOOL isDisplayPlayerBetResult;
    
    //indeicate bet square's delegate is set or not
    BOOL isBetSquareDelegateSet;
    
    //game status
    NSString *lastGameStatus;
    

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

/**
 * A method clear bet but the final set
 * if betinfoview display final result it will not be cleared
 *
 * 清除所有的下注資訊, 除了以確定的
 */
-(void)clearBetsWithoutFinalSet;

/**
 * A method clear bets
 *
 * 清除所有的下注資訊
 * 
 * @param yesOrNo hide info view or not
 * @param hisYesOrNo clear bet history
 */
-(void)clearBetsWithHideInfo:(BOOL)yesOrNo WithHistory:(BOOL)hisYesOrNo;

/**
 * A method to show result
 * which square should be flash
 *
 * 顯示結果
 */
-(void)showResult;

/**
 * A method to check if all bet amount over player's credit
 *
 * 檢查下注是否超過玩家金額
 *
 * @param amount amount of bet squares
 * @return yes it is over no it is not
 */
-(BOOL)isBetOverBalanceWithBetAmount:(double)amount;

/**
 * A mehtod to restore every bet square to last state
 *
 * 回復上一次的狀態
 */
-(void)restoreBetToLastState;

/**
 * A method to clear all bet
 * directly call -(void)clearBetsWithHideInfo:(BOOL)yesOrNo WithHistory:(BOOL)hisYesOrNo;
 */
-(void)clearAllBetsWithHideInfo:(BOOL)yesOrNo WithHistory:(BOOL)hisYesOrNo;

/**
 * A method to collect all bet squares' bet
 * return each signle bet in double as an array
 *
 * 搜集所有的下注資訊
 *
 * @return array that contain NSNumber for each bet sqaures' bet
 */
-(NSMutableArray *)collectBetInfo;

/**
 * A method to collect all bet squares' history bet
 * return history bet in double as an array
 *
 * 搜集所有的歷史下注資訊
 *
 * @return array that contain NSNumber for each bet sqaures' history bet
 */
-(NSMutableArray *)collectHistoryBetInfo;

/**
 * A method to collect all bet squares
 *
 * 搜集所有的下注按鈕
 *
 * @return array contain UIButton for each bet square
 */
-(NSArray *)collectAllBetSqaures;

/**
 * A method to display bet result
 * every current bet
 *
 * 顯示玩家的下注結果
 */
-(void)displayPlayerBetResult;

/**
 * A method to display bet history
 * every bet accumulation for history
 *
 * 顯示玩家的歷史下注結果
 */
-(void)displayPlayerHistoryBetResult;

//result

/**
 * A method generate string contain info about which square should flash for result
 *
 * 產生字串包含哪個區塊要閃爍的資料
 *
 * @param result integer from server
 * @return string a specific format
 */
-(NSString *)getResultWithResultCode:(NSUInteger)result;

/**
 * A method to show flashing result
 * work with -(NSString *)getResultWithResultCode:(NSUInteger)result;
 *
 * @param result specific string format
 */
-(void)showResultWithString:(NSString *)result;

/**
 * A method to disable square by round
 *
 * 關閉特定的區塊在指定的局數
 *
 * @param round target round
 * @param curRound current round
 */
-(void)disableBetSquareByRound:(NSUInteger)round currentRound:(NSUInteger)curRound;

/**
 * A method to setup bet square
 * 
 * 設定區塊
 */
-(void)setupBetSquare;

/**
 * A method to apply all pending bet squares
 * pending bet info
 */
-(void)applyAllBets;

/**
 * A mehtod to clear all pending bet info
 * must call when clear bet or between round
 */
-(void)clearAllBetTemp;

/**
 * A method called when game ask how many round
 * certain bet square should be disabled
 * number of round to disable bet square or enable
 *
 * 回傳多少局要關閉特定的區域
 */
-(NSUInteger)numberOfRoundToDisableBetSquare;

/**
 * A method to disable all bet sqaures
 *
 * 關閉所有的下注按鈕
 */
-(void)disableAllBetSquares;

/**
 * A method to enable all bet sqaures
 *
 * 開啟所有的下注按鈕
 */
-(void)enableAllBetSquares;


@end

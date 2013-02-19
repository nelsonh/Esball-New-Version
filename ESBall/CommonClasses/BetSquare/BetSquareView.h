//
//  BetSquare.h
//  ESBall
//
//  Created by Nelson on 12/4/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

//can be subclass

#import <UIKit/UIKit.h>
#import "BetInfoView.h"


@class BetSquareView;

/**
 * A protocol of BetSquareView
 */
@protocol BetSquareViewDelegate <NSObject>

@required

/**
 * Fire when amount of bet is over credit
 */
-(BOOL)BetSquareViewIsTotalBetOverBalance:(BetSquareView *)betSquare withCurrentBet:(double)currentBet;

/**
 * Fire when asking this bet square should bet
 */
-(BOOL)BetSquareViewShouldBet:(BetSquareView *)betSquare;

/**
 * Fire when asking how much should bet
 */
-(double)BetSquareViewValueToBet:(BetSquareView *)betSquare;

@optional

/**
 * Fire when bet square is about to bet
 */
-(void)BetSquareWillDoBet:(BetSquareView *)betSquare;

/**
 * Fire when bet square did bet
 */
-(void)BetSquareDoBet:(BetSquareView *)betSquare;

@end

@interface BetSquareView : UIButton{
    
    double currentBet;//current bet
    double lastBet;//track last bet
    double tempBet;//temp store bet between each bet confirm hitten
    
}

@property (nonatomic, weak) id<BetSquareViewDelegate> theDelegate;
@property (nonatomic, assign) double maxBet;//limit
@property (nonatomic, readonly) double theCurrentBet;
@property (nonatomic, assign) double betHistory;
@property (nonatomic, weak) IBOutlet BetInfoView *betInfoView;

/**
 * A method to restore last bet state
 *
 * 回復前一次的狀態
 */
-(void)restoreLastBetState;

/**
 * A method to clear bet history info
 *
 * 清除歷史紀錄
 */
-(void)clearBetHistory;

/**
 * A method to hide info view
 *
 * 隱藏下注資訊
 */
-(void)hideBetInfoView;

/**
 * A method to show info view
 *
 * 顯示下注資訊
 */
-(void)showBetInfoView;

/**
 * A method to reset current bet
 * 
 * 重設目前下注
 *
 * @param yesOrNo should bet info view reset or not
 */
-(void)resetCurrentBetWithBetInfo:(BOOL)yesOrNo;

/**
 * A method to display confirm bet result
 *
 * 顯示目前下注結果
 */
-(void)displayCurrentBetResult;

/**
 * A method to display history bet result
 * display only if bet history is greater than 0
 *
 * 顯示歷史下注結果
 */
-(void)displayHistoryBetResult;

/**
 * A method to clear pending bet info
 * call when bet is not sucess
 */
-(void)clearTempBet;

/**
 * A method to apply pending bet info, add temp bet to history bet
 * call when you make sure bet is success
 */
-(void)doBetApply;

/**
 * A method to modify bet history
 * special use for directly mainpulate bet history
 *
 * @param betHistoryValue the value that bet history is going to be set
 */
-(void)applyBetHistoryWithValue:(double)betHistoryValue;

@end

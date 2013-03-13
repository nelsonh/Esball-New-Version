//
//  BaseGameViewController.h
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerInterface.h"
#import "UserInfo.h"
#import "UpdateInfo.h"
#import "MarqueeInfo.h"
#import "BetRespondInfo.h"
#import "FileFinder.h"
#import "Constant.h"
#import "SoundManager.h"
#import "AppDelegate.h"
#import "HelperMethods.h"


/*
//game status declare
extern NSString *GameStatusDealing;
extern NSString *GameStatusWaiting;
extern NSString *GameStatusBetting;
*/

@class BaseGameViewController;

/**
 * A protocol of BaseGameViewController
 */
@protocol BaseGameViewControllerDelegate <NSObject>

/**
 * Fire when this game is ready and for player to play
 */
-(void)BaseGameViewControllerIsReady:(BaseGameViewController *)controller;

/**
 * Fire when this game is close and dismiss
 */
-(void)BaseGameViewControllerDidDismiss:(BaseGameViewController *)controller;

@end

/**
 * BaseGameViewController subclass of UIViewController
 * responsible for communication between server interface and game, send, receieve
 * responsible for UpdateInfo, UserInfo's creation
 * hold UpdateInfo, UserInfo
 */
@interface BaseGameViewController : UIViewController<ServerInterfaceDelegate/*, UIAlertViewDelegate*/>{

    //hold user information
    UserInfo *userInfo; 
    
    //update information changed every time server announcing
    UpdateInfo *updateInfo;
    
    //marquee information
    MarqueeInfo *marqueeInfo;
    
    //bet respond information
    BetRespondInfo *betRespondInfo;
    
    //table to play
    //NSUInteger table;
    
    //indicate TableNumber is assigned
    BOOL isTableNumberSet;
    
    //indicate GameType is assigned
    BOOL isGameTypeSet;
    
    //indicate game is first time enter
    BOOL isFirstTime;
    
    //indicate login gametype command sent to server
    BOOL loginGameTypeCommandSent;
    
    //number of round we haven't betted reset to 0 if bet happen
    int noneBetRoundCount;
    
    //indicate player did not bet for 5 round alert show up
    BOOL isNoneBet5RoundAlertShowed;
    
    //indicate player did not bet for 10 round alert show up
    BOOL isNoneBet10RoundAlertShowed;
    
    //last game status
    NSString *lastGameStatus;
    
    //track none bet round alert view
    UIAlertView *noneBetRoundAlert;
    
}

@property (nonatomic, weak) id<BaseGameViewControllerDelegate> theDelegate;//delegate
@property (nonatomic, assign) NSUInteger tableNumber;//table number must given
@property (nonatomic, assign) NSUInteger gameType;//game type must given

/**
 * A boolean value indicate that game controller should pause game when game
 * view disappear or not.
 *
 * 讓遊戲自動暫停和回復
 *
 * Yes to let game controller take over control pause and resume
 * NO you are obligable to call pause and resume
 * default is NO
 */
@property (nonatomic, assign) BOOL autoPauseGameWhenDisappear;

/**
 * Return file name of plist file that contain sound file name.
 * plist file contain is a type of NSDictionary key and value where
 * key is pre-define string and value is sound file name.
 *
 * 回傳 plist 檔案名字, 檔案包含聲音的定義
 */
-(NSString *)soundEffectPlistFileName;

/**
 * A method to receive message as string and turn it in to a NSData,
 * then send that data to server through Serverinterface class.
 *
 * 將要傳到 Server的訊息做轉換並傳到 Server
 *
 * @param msg NSString the message you want to send to server
 */
-(void)sendMessageToServerWithMessage:(NSString *)msg;

/**
 * A point where to start game
 *
 * 開始遊戲
 */
-(void)playGame;

/**
 * A method that receive notification after XMLPaser complete XML parsing process
 * and generate a new UserInfo class instance which hold by NSNotification passed in parameter.
 *
 * 此方法將被呼叫,當 UserInfo 的 XML 資料被轉換成功
 *
 * @param notification receive from XML parser
 */
-(void)handleUserInfo:(NSNotification*)notification;

/**
 * A method that receive notification after XMLPaser complete XML parsing process
 * and generate a new UpdateInfo class instance which hold by NSNotification passed in parameter.
 *
 * 此方法將被呼叫,當 UpdateInfo 的 XML 資料被轉換成功
 *
 * @param notification receive from XML parser
 */
-(void)handleUpdateInfo:(NSNotification*)notification;

/**
 * A method that receive notification after XMLPaser complete XML parsing process
 * and generate a new MarqueeInfo class instance which hold by NSNotification passed in parameter.
 *
 * 此方法將被呼叫,當 Marquee 的 XML 資料被轉換成功
 *
 * @param notification receive from XML parser
 */
-(void)handleMarqueeInfo:(NSNotification*)notification;

/**
 * A method that receive notification after XMLPaser complete XML parsing process
 * and generate a new BetRespondInfo class instance which hold by NSNotification passed in parameter.
 * This notification received when player betted and server return information
 *
 * 此方法將被呼叫,當 BetRespondInfo 的 XML 資料被轉換成功
 *
 * @param notification receive from XML parser
 */
-(void)handleBetRespondInfo:(NSNotification*)notification;

/**
 * A method to check if game is idle too long specificly player did not bet for 5 and 10 rounds
 * and then show alert at mathch rounds
 *
 * 檢查是否太久沒下注
 */
-(void)checkIsIdleTooLong;

/**
 * A method to initialize game's background music
 *
 * 初始化背景音樂
 */
-(void)initBackgroundMusic;

/**
 * A method to play background music
 *
 * 播放被景音樂
 */
-(void)playBackgroundMusic;

/**
 * A method to initialize sound effect
 *
 * 初始化遊戲聲音
 */
-(void)initSoundEffects;

/**
 * A method to unload sound resource
 * Normally, call this method when game is about to close
 *
 * 釋放掉所有聲音的資源
 */
-(void)unloadSoundResource;

/**
 * A method return live video IP address
 *
 * 回傳要使用視訊串流的 IP
 *
 * @param shortName an abreviation of game name 
 * e.g Baccarat -> BC
 * @param tableNumber game's table number
 */
-(NSString *)videoIpAddressWithGameShortName:(NSString *)shortName withTableNumber:(int)tableNumber;

/**
 * A method to dismiss alert view which prompt when player idle too long
 *
 * 隱藏玩家太久沒下注時顯示的 alert view
 *
 * @param yesOrNoNumber type of NSNumber hold the boolean value that indicate game controller
 * should be close when alert view dismiss
 */
-(void)hideNoneBetRoundAlertWithDismiss:(NSNumber*)yesOrNoNumber;

/**
 * A method to close game
 *
 * 結束遊戲
 */
-(void)dismissGameController;

/**
 * A back button which is connected in Interface Builder
 * Trigger close game event
 *
 * 結束遊戲的事件
 */
-(IBAction)back:(id)sender;

/**
 * A back button which is connected in Interface Builder
 * Trigger show roadmap event
 *
 * 顯示 roadmap 事件
 */
-(IBAction)roadmap:(id)sender;

/**
 * A back button which is connected in Interface Builder
 * Trigger clear bet event
 *
 * 清除下注事件
 */
-(IBAction)clearBet:(id)sender;

/**
 * A back button which is connected in Interface Builder
 * Trigger bet confirm event
 *
 * 下注確認事件
 */
-(IBAction)betConfirm:(id)sender;

/**
 * A back button which is connected in Interface Builder
 * Trigger show detail event
 *
 * 開啓細節事件
 */
-(IBAction)detail:(id)sender;

/**
 * A back button which is connected in Interface Builder
 * Trigger show record event
 *
 * 開啟記錄事件
 */
-(IBAction)record:(id)sender;

/**
 * A method to pause game
 *
 * 暫停遊戲
 */
-(void)pauseGame;

/**
 * A method to resume game
 *
 * 回復遊戲
 */
-(void)resumeGame;

/**
 * A method get call when enter game and game received first UpdateInfo
 * This method is called only once
 *
 * 當第一個 UpdateInfo 資料接收到後呼叫此方法
 */
-(void)receiveFirstUpdateInfo;


@end

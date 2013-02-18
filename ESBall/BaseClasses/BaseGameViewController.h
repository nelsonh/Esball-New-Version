//
//  BaseGameViewController.h
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

/**
 BaseGameViewController
 responsible for communication between server interface and game, send, receieve
 responsible for UpdateInfo, UserInfo's creation
 hold UpdateInfo, UserInfo
 **/

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
 * Yes to let game controller take over control pause and resume
 * NO you are obligable to call pause and resume
 * default is NO
 */
@property (nonatomic, assign) BOOL autoPauseGameWhenDisappear;

/**
 * Return file name of plist file that contain sound file name.
 * plist file contain is a type of NSDictionary key and value where
 * key is pre-define string and value is sound file name.
 */
-(NSString *)soundEffectPlistFileName;

/**
 * A method to receive message as string and turn it in to a NSData,
 * then send that data to server through Serverinterface class.
 *
 * @param msg NSString the message you want to send to server
 */
-(void)sendMessageToServerWithMessage:(NSString *)msg;

/**
 * A point where to start game
 */
-(void)playGame;

/**
 * A method that receive notification after XMLPaser complete XML parsing process
 * and generate a new UserInfo class instance which hold by NSNotification passed in parameter.
 *
 * @param notification receive from XML parser
 */
-(void)handleUserInfo:(NSNotification*)notification;

/**
 * A method that receive notification after XMLPaser complete XML parsing process
 * and generate a new UpdateInfo class instance which hold by NSNotification passed in parameter.
 *
 * @param notification receive from XML parser
 */
-(void)handleUpdateInfo:(NSNotification*)notification;

/**
 * A method that receive notification after XMLPaser complete XML parsing process
 * and generate a new MarqueeInfo class instance which hold by NSNotification passed in parameter.
 *
 * @param notification receive from XML parser
 */
-(void)handleMarqueeInfo:(NSNotification*)notification;

/**
 * A method that receive notification after XMLPaser complete XML parsing process
 * and generate a new BetRespondInfo class instance which hold by NSNotification passed in parameter.
 * This notification received when player betted and server return information
 *
 * @param notification receive from XML parser
 */
-(void)handleBetRespondInfo:(NSNotification*)notification;

/**
 * A method to check if game is idle too long specificly player did not bet for 5 and 10 rounds
 * and then show alert at mathch rounds
 */
-(void)checkIsIdleTooLong;

/**
 * A method to initialize game's background music
 */
-(void)initBackgroundMusic;

/**
 * A method to play background music
 */
-(void)playBackgroundMusic;

/**
 * A method to initialize sound effect
 */
-(void)initSoundEffects;

/**
 * A method to unload sound resource
 * Normally, call this method when game is about to close
 */
-(void)unloadSoundResource;

/**
 * A method return live video IP address 
 *
 * @param shortName an abreviation of game name 
 * e.g Baccarat -> BC
 * @param tableNumber game's table number
 */
-(NSString *)videoIpAddressWithGameShortName:(NSString *)shortName withTableNumber:(int)tableNumber;

/**
 * A method to dismiss alert view which prompt when player idle too long
 *
 * @param yesOrNoNumber type of NSNumber hold the boolean value that indicate game controller
 * should be close when alert view dismiss
 */
-(void)hideNoneBetRoundAlertWithDismiss:(NSNumber*)yesOrNoNumber;

/**
 * A method to close game
 */
-(void)dismissGameController;

/**
 * A back button which is connected in Interface Builder
 * Trigger close game event
 */
-(IBAction)back:(id)sender;

/**
 * A back button which is connected in Interface Builder
 * Trigger show roadmap event
 */
-(IBAction)roadmap:(id)sender;

/**
 * A back button which is connected in Interface Builder
 * Trigger clear bet event
 */
-(IBAction)clearBet:(id)sender;

/**
 * A back button which is connected in Interface Builder
 * Trigger bet confirm event
 */
-(IBAction)betConfirm:(id)sender;

/**
 * A back button which is connected in Interface Builder
 * Trigger show detail event
 */
-(IBAction)detail:(id)sender;

/**
 * A back button which is connected in Interface Builder
 * Trigger show record event
 */
-(IBAction)record:(id)sender;

/**
 * A method to pause game
 */
-(void)pauseGame;

/**
 * A method to resume game
 */
-(void)resumeGame;

/**
 * A method get call when enter game and game received first UpdateInfo
 * This method is called only once
 */
-(void)receiveFirstUpdateInfo;


@end

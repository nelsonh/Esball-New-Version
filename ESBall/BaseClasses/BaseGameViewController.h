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
#import "FileFinder.h"
#import "Constant.h"


/*
//game status declare
extern NSString *GameStatusDealing;
extern NSString *GameStatusWaiting;
extern NSString *GameStatusBetting;
*/

@class BaseGameViewController;

@protocol BaseGameViewControllerDelegate <NSObject>

//game first time update
-(void)BaseGameViewControllerIsReady:(BaseGameViewController *)controller;
//may issue from subclass
-(void)BaseGameViewControllerDidDismiss:(BaseGameViewController *)controller;

@end

@interface BaseGameViewController : UIViewController<ServerInterfaceDelegate>{

    //hold user information
    UserInfo *userInfo;
    
    //update information changed every time server announcing
    UpdateInfo *updateInfo;
    
    //marquee information
    MarqueeInfo *marqueeInfo;
    
    //table to play
    //NSUInteger table;
    
    BOOL isTableNumberSet;
    BOOL isGameTypeSet;
    
    BOOL isFirstTime;
    
    BOOL loginGameTypeCommandSent;//indicate login gametype command sent to server
    
    NSUInteger noneBetRoundCount;//number of round we haven't betted reset to 0 if bet happen
    BOOL isNoneBet5RoundAlertShowed;
    BOOL isNoneBet10RoundAlertShowed;
    
    NSString *lastGameStatus;//last game status
    
}

@property (nonatomic, weak) id<BaseGameViewControllerDelegate> theDelegate;
@property (nonatomic, assign) NSUInteger tableNumber;//table number must given
@property (nonatomic, assign) NSUInteger gameType;//game type must given

//yes to let game controller take over control pause and resume
//no you are obligable to call pause and resume
//default is no
@property (nonatomic, assign) BOOL autoPauseGameWhenDisappear;

//internal
-(void)sendMessageToServerWithMessage:(NSString *)msg;
-(void)playGame;
-(void)handleUserInfo:(NSNotification*)notification;
-(void)handleUpdateInfo:(NSNotification*)notification;
-(void)handleMarqueeInfo:(NSNotification*)notification;
-(BOOL)isIdleTooLong;

-(IBAction)back:(id)sender;
-(IBAction)roadmap:(id)sender;
-(IBAction)clearBet:(id)sender;
-(IBAction)betConfirm:(id)sender;
-(IBAction)detail:(id)sender;
-(IBAction)record:(id)sender;
-(void)pause;
-(void)resume;


@end

//
//  CommonBaccaratGameViewController.h
//  ESBall
//
//  Created by Nelson on 12/26/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//
//Baccarat game skeleton
//game logic

#import "BaseGameViewController.h"
#import "PokerView.h"
#import "BetView.h"
#import "ImagePull.h"
#import "DetailViewController.h"
#import "GameDetailViewController.h"
#import "RoadmapView.h"
#import "PromptMessageView.h"

#define kDetailViewY 60 //hardcode value

//for ipad 
#define kChipSpaceWidth 12
#define kChipSpaceHeight 5
#define kChipSize 78

/**
 * CommonBaccaratGameViewController subclass of BaseGameViewController
 * Baccarat game
 */
@interface CommonBaccaratGameViewController : BaseGameViewController<NSURLConnectionDataDelegate, ImagePullDelegate, GameDetailViewControllerDelegate, BetViewDelegate>{
    
    //timer that continuous download video image
    NSTimer *timerForVideo;
    
    //NSMutableDictionary *cardPoints;
    
    //a class to download video image
    ImagePull *theImagePull;
    
    //temp storage of banker point
    NSUInteger bankerPointTemp;
    
    //temp storage of player point
    NSUInteger playerPointTemp;
    
    //indicate win or lose is showed or not
    BOOL winOrLosePromptShowed;
    
    //video ip where to get video image from
    NSString *videoIPStr;
    
    //determind if there is a bet confrim by player
    //must set yes if player do confirm bet
    BOOL isBetConfirm;
    
}

@property (nonatomic, weak) IBOutlet UILabel *userAccountLabel;
@property (nonatomic, weak) IBOutlet UILabel *gameNumberLabel;
@property (nonatomic, weak) IBOutlet UILabel *gameCodeNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *dealerNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *creditLabel;
@property (nonatomic, weak) IBOutlet UILabel *totalBetLabel;
@property (nonatomic, weak) IBOutlet UILabel *countDownLabel;
@property (nonatomic, weak) IBOutlet UIButton *roadmapButton;
@property (nonatomic, weak) IBOutlet UIButton *detailButton;
@property (nonatomic, weak) IBOutlet UIButton *recordButton;
@property (nonatomic, weak) IBOutlet UIButton *clearBetButton;
@property (nonatomic, weak) IBOutlet UIButton *betConfirmButton;
@property (nonatomic, weak) IBOutlet UIButton *backButton;
@property (nonatomic, weak) IBOutlet UIImageView *videoView;
@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic, weak) IBOutlet PokerView *pokerView;//poker view
@property (nonatomic, weak) IBOutlet BetView *betAreaView;//bet view
@property (nonatomic, weak) IBOutlet RoadmapView *roadmapView;//roadmap view
@property (nonatomic, weak) IBOutlet PromptMessageView *promptMsgView;//prompt message view

//subclass can override these method

/**
 * A method called when ViewDidLoad
 * Any init stuff can be done in this method
 *
 * 初始設定
 */
-(void)PostBeginSetup;

/**
 * A method called when roadmap button selected
 * Highlight button purpose
 *
 * 選擇 Roadmap
 */
-(void)doSelectRoadmap;

/**
 * A method called when roadmap button deselected
 * Unhighlight button purpose
 *
 * 反選擇 Roadmap
 */
-(void)doDeSelectRoadmap;

/**
 * A method called when detail button selected
 * Highlight button purpose
 *
 * 選擇 Detail
 */
-(void)doSelectDetail;

/**
 * A method called when detail button deselected
 * Unhighlight button purpose
 *
 * 反選擇 Detail
 */
-(void)doDeSelectDetail;

/**
 * A method called when record button selected
 * Highlight button purpose
 *
 * 選擇 Record
 */
-(void)doSelectRecord;

/**
 * A method called when record button deselected
 * Unhighlight button purpose
 *
 * 反選擇 Record
 */
-(void)doDeselectRecord;

/**
 * A method calculate amount of bet
 *
 * 計算所有的下注
 *
 * @param infos each bet, every elements in array is type of NSNumber
 * @return double for amount of bet
 */
-(double)totalBetWithInfos:(NSMutableArray *)infos;

/**
 * A method to start live video which is a continuous JEPG image 
 *
 * 開始下載視訊圖片
 */
-(void)loadVideoImage;

/**
 * A method called when game request the quality of live video
 * SD for ipod, iphone. HD for pad
 *
 * 回傳視訊品質
 *
 * @return string of sd or hd
 */
-(NSString *)sdOrhdForVideoImage;

//-(void)hidePokerView;

/**
 * A method to update poker which is a view area for display cards,
 * player and banker point
 *
 * 更新發牌區
 *
 * @param info an instance of UpdateInfo class
 */
-(void)updatePokerWithUpdateInfo:(UpdateInfo *)info;

/**
 * A method to show roadmap
 * roadmap itself will determind should appear or not
 * roadmap will update first time it appear
 *
 * 顯示 Roadmap
 */
-(void)showRoadmap;

/**
 * A method to show detail
 * detail itself will determind should appear or not
 *
 * 顯示 Detail
 */
-(void)showDetail;

/**
 * A method to show record
 * record itself will determind should appear or not
 *
 * 顯示 Record
 */
-(void)showRecord;

/**
 * A method to clear all bets in bet area
 *
 * 清除下注
 */
-(void)doClearBet;

/**
 * A method to confirm bet
 * also send all info of bet to server
 *
 * 確定下注
 */
-(void)doBetConfirm;

/**
 * A method to handle information of marquee
 * method called when there is a marquee
 *
 * 處理 Marquee 資料
 *
 * @param notification contain MarqueeInfo
 */
-(void)processMarqueeInfo:(NSNotification *)notification;

/**
 * A method to handle information of userinfo
 * method called when there is a userinfo
 *
 * 處理 UserInfo 資料
 *
 * @param notification contain UserInfo
 */
-(void)processUserInfo:(NSNotification *)notification;

/**
 * A method to handle information of updateinfo
 * method called when there is a updateinfo
 * game logic
 *
 * 處理 UpdateInfo 資料
 *
 * @param notification contain UpdateInfo
 */
-(void)processUpdateInfo:(NSNotification *)notification;

/**
 * A method to handle information of respond of bet
 * when bet info send to server it will return a info about success or fail
 * this method is responsible to handle it
 *
 * 處理 BetRespondInfo 資料
 *
 * @param notification contain BetRespondInfo
 */
-(void)processBetRespondInfo:(NSNotification *)notification;

/**
 * A method to genereate a string which contain bet information
 * the bet information that server can read
 *
 * 產生確認下注候的字串資料
 *
 * @param infos contain NSNumber in array for each bet, NSNumber has amount of bet
 * @return string that has specific format 
 */
-(NSString *)generateBetInfoMessageWithInfos:(NSMutableArray *)infos;

/**
 * A method to calculate point for banker base on cards
 *
 * 計算 Banker 分數
 *
 * @param cards contain string in array
 * @return integer for banker point
 */
-(NSUInteger)calculateCardPointForBanker:(NSArray *)cards;

/**
 * A method to calculate point for player base on cards
 *
 * 計算 Player 分數
 *
 * @param cards contain string in array
 * @return integer for player point
 */
-(NSUInteger)calculateCardPointForPlayer:(NSArray *)cards;

/**
 * A method to hide prompt message view
 *
 * 隱藏即時訊息
 */
-(void)hidePromptMsg;

/**
 * A method manage to show up prompt message view for start betting
 *
 * 顯示開始下注即時訊息
 */
-(void)promptStartBettingIndicator;

/**
 * A method manage to show up prompt message view for win or lose
 *
 * 顯示輸贏及時訊息
 *
 * @param info a UpdateInfo has result
 */
-(void)promptWinOrLoseIndicatorWithInfo:(UpdateInfo *)info;

/**
 * A method to save bet info as local data for each round
 * therefore these data can be restored and displayed when player
 * back to game again
 * this method called after bet info send to server and server respond success
 *
 * 儲存下注資訊
 */
-(void)saveBetInfo;

/**
 * A method to restore bet info from local data, if round
 * is not matched it will not be restored.
 * this method called when first time game received UpdateInfo
 *
 * 回復下注資訊
 */
-(void)recoverBetInfo;//recover bet info

//sound

/**
 * A method to play sound of score point for banker
 *
 * 播放 Banker 分數聲音
 */
-(void)playSoundOfFinalPointForBanker;

/**
 * A method to play sound of score point for player
 *
 * 播放 Player 分數聲音
 */
-(void)playSoundOfFinalPointForPlayer;

/*
 * A method to play sound of win,lose or tie
 *
 * 播放輸贏或平手聲音
 */
-(void)playSoundOfWinLoseOrTie;

//must override and implement

/**
 * Not used 
 */
-(NSString *)videoImageIPAddressForTableNumber:(NSUInteger)tableNumber;//ip for video image

/**
 * A method called when round is greater than certain round
 *
 * 回傳局數大於特定局數的背景圖檔名
 *
 * @param round current round
 * @return string of background image name
 */
-(NSString *)backgroundImageNameForGameGreaterThanCertainRound:(NSUInteger)round;

/**
 * A method called when round is less than certain round
 *
 * 回傳局數小於特定局數的背景圖檔名
 *
 * @param round current round
 * @return string of background image name
 */
-(NSString *)backgroundImageNameForGameLessThanCertainRound:(NSUInteger)round;

/**
 * A method called when game about to display chips
 * chip space width from border
 *
 * 回傳籌碼寬的間隔
 *
 * @return CGFloat for chip space width
 */
-(CGFloat)chipSpaceWidth;

/**
 * A method called when game about to display chips
 * chip space height from border
 *
 * 回傳籌碼高的間隔
 *
 * @return CGFloat for chip space height
 */
-(CGFloat)chipSpaceHeight;

/**
 * A method called when game about to display chips
 * chip size
 *
 * 回傳籌碼的大小
 *
 * @return CGFloat for chip size
 */
-(CGFloat)chipSize;

/**
 * A method called when game about to display detail view
 * Y position for detail view
 *
 * 回傳 Detail Y 的位置
 *
 * @return CGFloat for Y position
 */
-(CGFloat)detailViewPositionY;

@end

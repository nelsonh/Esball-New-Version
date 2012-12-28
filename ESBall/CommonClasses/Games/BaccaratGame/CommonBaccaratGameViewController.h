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
#import "GameDetailViewController.h"
#import "RoadmapView.h"

#define kDetailViewY 60 //hardcode value

//for ipad 
#define kChipSpaceWidth 12
#define kChipSpaceHeight 5
#define kChipSize 78

@interface CommonBaccaratGameViewController : BaseGameViewController<NSURLConnectionDataDelegate, ImagePullDelegate, GameDetailViewControllerDelegate, BetViewDelegate>{
    
    NSTimer *timerForVideo;
    NSMutableDictionary *cardPoints;
    ImagePull *theImagePull;
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
@property (nonatomic, weak) IBOutlet UIButton *clearBetButton;
@property (nonatomic, weak) IBOutlet UIButton *betConfirmButton;
@property (nonatomic, weak) IBOutlet UIButton *backButton;
@property (nonatomic, weak) IBOutlet UIImageView *videoView;
@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic, weak) IBOutlet PokerView *pokerView;
@property (nonatomic, weak) IBOutlet BetView *betAreaView;
@property (nonatomic, weak) IBOutlet RoadmapView *roadmapView;

//subclass can override these method
-(void)PostBeginSetup;
-(void)doSelectRoadmap;
-(void)doDeSelectRoadmap;
-(void)doSelectDetail;
-(void)doDeSelectDetail;
-(double)totalBetWithInfos:(NSMutableArray *)infos;
-(void)loadVideoImage;
-(void)hidePokerView;
-(void)updatePokerWithUpdateInfo:(UpdateInfo *)info;
-(void)showRoadmap;
-(void)showDetail;
-(void)doClearBet;
-(void)doBetConfirm;
-(void)processMarqueeInfo:(NSNotification *)notification;
-(void)processUserInfo:(NSNotification *)notification;
-(void)processUpdateInfo:(NSNotification *)notification;
-(NSString *)generateBetInfoMessageWithInfos:(NSMutableArray *)infos;
-(NSUInteger)calculateCardPointForBanker:(NSArray *)cards;
-(NSUInteger)calculateCardPointForPlayer:(NSArray *)cards;

//must override and implement 
-(NSString *)videoImageIPAddressForTableNumber:(NSUInteger)tableNumber;//ip for video image
-(NSString *)backgroundImageNameForGameGreaterThanThirtyRound;//background image when greater 30 round
-(NSString *)backgroundImageNameForGameLessThanThirtyRound;//background image when less than 30 round
-(CGFloat)chipSpaceWidth;//chip space width from border
-(CGFloat)chipSpaceHeight;//chip space height from border
-(CGFloat)chipSize;//chip size

@end

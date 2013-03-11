//
//  CommonSicboGameViewController.m
//  ESBall
//
//  Created by Nelson on 1/2/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "CommonSicboGameViewController.h"


@interface CommonSicboGameViewController ()

@end

@implementation CommonSicboGameViewController

@synthesize sbBetView = _sbBetView;
@synthesize sbRoadmap = _sbRoadmap;
@synthesize sbPokerView = _sbPokerView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - override
-(NSString *)soundEffectPlistFileName
{
    return @"GameSoundEffectList";
}

-(void)PostBeginSetup
{
    //Video IP
    int videoTableNumber = 1;
    videoIPStr = [self videoIpAddressWithGameShortName:@"SB" withTableNumber:videoTableNumber];
    
    //start to get video image
    [self loadVideoImage];
    
    /*
    self.betConfirmButton.enabled = NO;
    self.clearBetButton.enabled = NO;
    self.detailButton.enabled = NO;
    self.roadmapButton.enabled = NO;
    self.backButton.enabled = NO;
    */
    
    //_sbBetView.theBetViewDelegate = self;
    
    //assign properties to bet view for chip view befroe first update
    //phone need to change value
    _sbBetView.chipSpaceWidth = [self chipSpaceWidth];
    _sbBetView.chipSpaceHeight = [self chipSpaceHeight];
    _sbBetView.chipSize = [self chipSize];
    
}

-(void)showRoadmap
{
    if(_sbRoadmap.hidden)
    {
        [self performSelector:@selector(doSelectRoadmap) withObject:nil afterDelay:0.0];
    }
    else
    {
        [self performSelector:@selector(doDeSelectRoadmap) withObject:nil afterDelay:0.0];
    }
    
    _sbRoadmap.hidden = !_sbRoadmap.hidden;
    //isRouteDisplay = !_roadmapView.hidden;
    
    if(!_sbRoadmap.hidden)
    {
        if(updateInfo.roadmap != nil)
            _sbRoadmap.roadmapInfo = [NSArray arrayWithArray:updateInfo.roadmap];
        
        [_sbRoadmap updateView];
    }

}

-(void)loadVideoImage
{
    
    theImagePull = [[ImagePull alloc] init];
    theImagePull.theDelegate = self;
    
    int videoTableNumber = 1;
    
    NSString *videoQuality = [self sdOrhdForVideoImage];
    //NSString *ipStr = [self videoIpAddressWithGameShortName:@"SB" withTableNumber:videoTableNumber];
    //NSString *videoAddr = [NSString stringWithFormat:@"http://%@/sicbo%@%i/sd2.jpg", ipStr, videoQuality, videoTableNumber];
     NSString *videoAddr = [NSString stringWithFormat:@"http://%@/sicbo%@%i/sd2.jpg", videoIPStr, videoQuality, videoTableNumber];
    [theImagePull pullImageFrom:[NSURL URLWithString:[NSString stringWithFormat:@"%@", videoAddr]]];
    
    /*
     //video with 183.182.66.165
     [theImagePull pullImageFrom:[NSURL URLWithString:[NSString stringWithFormat:@"http://183.182.66.165:80/dragontigerhd%i/sd2.jpg", 1]]];
     */
    /*
    NSString *ipAddress = [self videoImageIPAddressForTableNumber:self.tableNumber];
    
    [theImagePull pullImageFrom:[NSURL URLWithString:ipAddress]];
     */
}

-(void)updatePokerWithUpdateInfo:(UpdateInfo *)info
{
    _sbPokerView.dicePoints = info.poker;
    
    [_sbPokerView updateView];
}

-(void)processUserInfo:(NSNotification *)notification
{
    UserInfo *info = notification.object;
    
    //initial user info related view
    self.userAccountLabel.text =info.userName;
    
    
    //give chips name array
    //NSLog(@"chiplist:%@", info.chipList);
    NSMutableArray *filtedChipList = [[NSMutableArray alloc] init];
    NSArray *chipFilter = [NSArray arrayWithArray:info.chipFilter];
    
#ifdef DEBUG
    NSLog(@"chip filter:%@", chipFilter);
#endif
    
    if(!chipFilter)
    {
#ifdef DEBUG
        InternalErrorAlert(self, @"Internal error", @"chip filter is nil");
#endif
    }
    
    for(NSString *chipValue in chipFilter)
    {
        /*
         #ifdef DEBUG
         NSLog(@"process chip");
         #endif
         */
        
        double value = [chipValue doubleValue];
        
        if(value <= info.max)
        {
            [filtedChipList addObject:[chipValue copy]];
        }
        else
        {
            break;
        }
    }
    
    if(filtedChipList.count > 5)
    {
        if(self.leftArrow && self.rightArrow)
        {
            self.leftArrow.hidden = NO;
            self.rightArrow.hidden = NO;
        }
        
    }
    else
    {
        if(self.leftArrow && self.rightArrow)
        {
            self.leftArrow.hidden = YES;
            self.rightArrow.hidden = YES;
        }
        
    }
    
    _sbBetView.chips = filtedChipList;
    _sbBetView.userInfo = info;
    
}

-(void)processMarqueeInfo:(NSNotification *)notification
{
    
}

-(void)processBetRespondInfo:(NSNotification *)notification
{
    BetRespondInfo *info = notification.object;
    
    SBBetView *betView = (SBBetView *)_sbBetView;
    //enable all bet squares
    [betView enableAllBetSquares];
    
    //if bet respond fail
    if(info.error!=nil)
    {
        NSString *msg = NSLocalizedString(@"下注失败", @"下注失败");
        UIAlertView *betFailAlertView = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", @"确定") otherButtonTitles: nil];
        [betFailAlertView show];
        
        //BetView *betView = (BetView *)_betAreaView;
        [betView clearBetsWithoutFinalSet];
        //[betView restoreBetToLastState];
        [betView clearAllBetTemp];
        
        [betView setupCurrentMaxBet];
        
        //bet respond back now it is safe to set bet confirm to no
        //we don't need to enable bet confirm button because UpdateInfo method
        //will handle it
        isBetConfirm = NO;
        
        return;
    }
    
    
    
    //apply pending bets
    [betView applyAllBets];
    
    //collect history bet information
    NSMutableArray *betInfos = [betView collectHistoryBetInfo];
    
    //display total bet this round
    double totalBet = [self totalBetWithInfos:betInfos];
    self.totalBetLabel.text = [NSString stringWithFormat:@"%.2f", totalBet];
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hidePromptMsg) object:nil];
    self.promptMsgView.hidden = NO;
    [self.promptMsgView updateWithMessage:[NSString stringWithFormat:NSLocalizedString(@"您共下注%.2f元", @"您共下注%.2f元"), totalBet]];
    [self performSelector:@selector(hidePromptMsg) withObject:nil afterDelay:3.0f];
    
    //display player accumulated bet result
    [betView displayPlayerHistoryBetResult];
    
    //save bet info
    [self saveBetInfo];
    
    //reset none bet round count
    noneBetRoundCount = 0;
    
    //bet respond back now it is safe to set bet confirm to no
    //we don't need to enable bet confirm button because UpdateInfo method
    //will handle it
    isBetConfirm = NO;
    
}

-(void)processUpdateInfo:(NSNotification *)notification
{
    SoundManager *soundManager = [SoundManager soundManager];
    
    //self.backButton.enabled = YES;
    
    UpdateInfo *info = notification.object;
    
    //NSLog(@"roundNumber:%@", info.roundNumber);
    
    //update information from server
    
    //game number
    NSString *gameNumber = [info.roundNumber stringByAppendingFormat:@" %@", info.roundSerial];
    self.gameNumberLabel.text = gameNumber;
    
    //game code name
    self.gameCodeNameLabel.text = info.gameCodeName;
    
    //dealer name
    //NSLog(@"dealer:%@", info.dealerName);
    self.dealerNameLabel.text = info.dealerName;
    
    //credit
    self.creditLabel.text = [NSString stringWithFormat:@"%.2f", info.credit];
    
    //count down
    int countDown = info.countDown;
    
    if(countDown >= 0)
    {
        self.countDownLabel.text = [NSString stringWithFormat:@"%i", info.countDown];
    }
    else
    {
        self.countDownLabel.text = @"0";
        countDown = 0;
    }
    
    if(countDown <= 5)
    {
         self.countDownLabel.textColor = [UIColor redColor];
    }
    else
    {
        self.countDownLabel.textColor = [UIColor blackColor];
    }
    
    if(info.countDown == 5)
    {
        [soundManager playSoundEffectWithKey:@"SE_CountDown"];
    }
    
    //new round
    if([lastGameStatus isEqualToString:GameStatusWaiting] && [info.status isEqualToString:GameStatusBetting])
    {
        //clean total bet
        self.totalBetLabel.text = @"0.00";
        
        //enable all bet squares
        [_sbBetView enableAllBetSquares];
        
        if(self.detailButton.highlighted == NO && self.recordButton.highlighted == NO)
        {
            //enable clear bet button
            self.clearBetButton.enabled = YES;
            
            //enable bet confirm button
            self.betConfirmButton.enabled = YES;
        }
        
        if(!_sbRoadmap.hidden)
        {
            if(updateInfo.roadmap != nil)
            {
                _sbRoadmap.roadmapInfo = [NSArray arrayWithArray:updateInfo.roadmap];
                [_sbRoadmap updateView];
            }
            
        }
    }
    
    //clear bet
    if([lastGameStatus isEqualToString:GameStatusBetting] && [info.status isEqualToString:GameStatusDealing])
    {
        //clear bet but confirm one
        [_sbBetView clearBetsWithoutFinalSet];
    }
    
    //update poker
    if([info.status isEqualToString:GameStatusWaiting])
    {
        _sbPokerView.visibility = YES;
        
        [self updatePokerWithUpdateInfo:info];
    }
    
    //win, lose or tie
    if([lastGameStatus isEqualToString:GameStatusDealing] && [info.status isEqualToString:GameStatusWaiting])
    {
        
    }
    
    
    
    //_pokerView.visibility = [info.status isEqualToString:@"dealing"]? YES:NO;
    
    //reset roadmap update count
    if([info.status isEqualToString:GameStatusWaiting] || [info.status isEqualToString:GameStatusDealing])
    {
        
        //_changeTableButton.enabled = NO;
        //_detailButton.enabled = NO;
        
        self.clearBetButton.enabled = NO;
        self.betConfirmButton.enabled = NO;
    }
    else if([info.status isEqualToString:GameStatusBetting])
    {
        _sbPokerView.visibility = NO;
        
        /*
        //update roadmapView
        if(!_sbRoadmap.hidden)
        {
            if(updateInfo.roadmap != nil)
                _sbRoadmap.roadmapInfo = [NSArray arrayWithArray:updateInfo.roadmap];
            [_sbRoadmap updateView];
        }
        */
        
        //_changeTableButton.enabled = YES;
        //_detailButton.enabled = YES;
        //self.clearBetButton.enabled = YES;
        //self.betConfirmButton.enabled = YES;
        
        //if isBetConfirm is NO then check if we need to enable buttons
        if(isBetConfirm == NO)
        {
            if(self.detailButton.highlighted == NO && self.recordButton.highlighted == NO)
            {
                self.clearBetButton.enabled = YES;
                self.betConfirmButton.enabled = YES;
            }
        }
        
    }
    
    //start betting indicator
    if([lastGameStatus isEqualToString:GameStatusWaiting] && [info.status isEqualToString:GameStatusBetting])
    {
        [self promptStartBettingIndicator];
        
        //play sound effect
        [soundManager playSoundEffectWithKey:@"SE_StartBet"];
    }
    
    if([lastGameStatus isEqualToString:GameStatusBetting] && [info.status isEqualToString:GameStatusDealing])
    {
        //play sound effect
        [soundManager playSoundEffectWithKey:@"SE_StopBet"];
    }

    
    /*
    if(!self.detailButton.enabled)
        self.detailButton.enabled = YES;
    if(!self.roadmapButton.enabled)
        self.roadmapButton.enabled = YES;
    */
    
    //give update information to bet area view
    //_betAreaView.updateInfo = info;
    _sbBetView.updateInfo = info;
    
    //update any necessary views
    //[_betAreaView updateView];
    [_sbBetView updateView];
}

-(void)doClearBet
{
    //make sure BetAreaView is a class of BetView before clear all bets
    if([_sbBetView isKindOfClass:[SBBetView class]])
    {
        SBBetView *betView = (SBBetView *)_sbBetView;
        //[betView clearAllBetsWithHideInfo:YES];
        [betView clearBetsWithoutFinalSet];
        [betView clearAllBetTemp];
        //reset max bet
        [betView setupCurrentMaxBet];
    }
}

-(void)doBetConfirm
{
    //make sure betview is a class of SBBetView before collect bet info
    if([_sbBetView isKindOfClass:[SBBetView class]])
    {
        SBBetView *betView = (SBBetView *)_sbBetView;
        
        //collect bet information
        NSMutableArray *betInfos = [betView collectBetInfo];
        
        //if any bet smaller than min
        for(NSNumber *num in betInfos)
        {
            double betNum = [num doubleValue];
            
            if(betNum == 0)
                continue;
            
            if(betNum < userInfo.min)
            {
                NSLog(@"A bet under bet min");
                
                NSString *msg = NSLocalizedString(@"低于最小下注金额", @"低于最小下注金额");
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", @"确定") otherButtonTitles: nil];
                [alertView show];
                
                //[betView clearAllBetsWithHideInfo:YES WithHistory:NO];
                [betView clearBetsWithoutFinalSet];
                [betView clearAllBetTemp];
                
                [betView setupCurrentMaxBet];
                
                return;
            }
        }
        
#ifdef SendRealBetInfo
        //prepare to bet
        NSString *response  = [NSString stringWithFormat:@"bet\n"];
        [self sendMessageToServerWithMessage:response];
        
        response = [NSString stringWithFormat:@"%i\n", userInfo.gameType];
        [self sendMessageToServerWithMessage:response];
        
        response = [NSString stringWithFormat:@"%i\n", userInfo.gameCode];
        [self sendMessageToServerWithMessage:response];
        
        //generate msg that contain bet info and sending to server
        response = [self generateBetInfoMessageWithInfos:betInfos];
        NSLog(@"\nbet confirm message:\n%@\n", response);
        //send bet info to server
        [self sendMessageToServerWithMessage:response];
#endif
        
        //clear bet
        [betView clearAllBetsWithHideInfo:NO WithHistory:NO];
        
        isBetConfirm = YES;
        self.betConfirmButton.enabled = NO;
        
        [betView disableAllBetSquares];
    }
}

-(NSString *)generateBetInfoMessageWithInfos:(NSMutableArray *)infos
{
    NSString *response  = [NSString stringWithFormat:@"%@", updateInfo.roundSerial];
    
    if ([[infos objectAtIndex:0] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b2:%.2f",response, [[infos objectAtIndex:0] doubleValue]];
    }
    
    if ([[infos objectAtIndex:1] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b52:%.2f",response, [[infos objectAtIndex:1] doubleValue]];
    }
    
    if ([[infos objectAtIndex:2] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b53:%.2f",response, [[infos objectAtIndex:2] doubleValue]];
    }
    
    if ([[infos objectAtIndex:3] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b1:%.2f",response, [[infos objectAtIndex:3] doubleValue]];
    }
    
    if ([[infos objectAtIndex:4] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b38:%.2f",response, [[infos objectAtIndex:4] doubleValue]];
    }
    
    if ([[infos objectAtIndex:5] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b37:%.2f",response, [[infos objectAtIndex:5] doubleValue]];
    }
    
    if ([[infos objectAtIndex:6] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b36:%.2f",response, [[infos objectAtIndex:6] doubleValue]];
    }
    
    if ([[infos objectAtIndex:7] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b35:%.2f",response, [[infos objectAtIndex:7] doubleValue]];
    }
    
    if ([[infos objectAtIndex:8] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b34:%.2f",response, [[infos objectAtIndex:8] doubleValue]];
    }
    
    if ([[infos objectAtIndex:9] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b33:%.2f",response, [[infos objectAtIndex:9] doubleValue]];
    }
    
    if ([[infos objectAtIndex:10] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b45:%.2f",response, [[infos objectAtIndex:10] doubleValue]];
    }
    
    if ([[infos objectAtIndex:11] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b44:%.2f",response, [[infos objectAtIndex:11] doubleValue]];
    }
    
    if ([[infos objectAtIndex:12] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b43:%.2f",response, [[infos objectAtIndex:12] doubleValue]];
    }
    
    if ([[infos objectAtIndex:13] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b42:%.2f",response, [[infos objectAtIndex:13] doubleValue]];
    }
    
    if ([[infos objectAtIndex:14] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b41:%.2f",response, [[infos objectAtIndex:14] doubleValue]];
    }
    
    if ([[infos objectAtIndex:15] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b40:%.2f",response, [[infos objectAtIndex:15] doubleValue]];
    }
    
    if ([[infos objectAtIndex:16] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b39:%.2f",response, [[infos objectAtIndex:16] doubleValue]];
    }
    
    if ([[infos objectAtIndex:17] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b17:%.2f",response, [[infos objectAtIndex:17] doubleValue]];
    }
    
    if ([[infos objectAtIndex:18] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b16:%.2f",response, [[infos objectAtIndex:18] doubleValue]];
    }
    
    if ([[infos objectAtIndex:19] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b15:%.2f",response, [[infos objectAtIndex:19] doubleValue]];
    }
    
    if ([[infos objectAtIndex:20] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b14:%.2f",response, [[infos objectAtIndex:20] doubleValue]];
    }
    
    if ([[infos objectAtIndex:21] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b13:%.2f",response, [[infos objectAtIndex:21] doubleValue]];
    }
    
    if ([[infos objectAtIndex:22] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b12:%.2f",response, [[infos objectAtIndex:22] doubleValue]];
    }
    
    if ([[infos objectAtIndex:23] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b11:%.2f",response, [[infos objectAtIndex:23] doubleValue]];
    }
    
    if ([[infos objectAtIndex:24] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b10:%.2f",response, [[infos objectAtIndex:24] doubleValue]];
    }
    
    if ([[infos objectAtIndex:25] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b9:%.2f",response, [[infos objectAtIndex:25] doubleValue]];
    }
    
    if ([[infos objectAtIndex:26] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b8:%.2f",response, [[infos objectAtIndex:26] doubleValue]];
    }
    
    if ([[infos objectAtIndex:27] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b7:%.2f",response, [[infos objectAtIndex:27] doubleValue]];
    }
    
    if ([[infos objectAtIndex:28] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b6:%.2f",response, [[infos objectAtIndex:28] doubleValue]];
    }
    
    if ([[infos objectAtIndex:29] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b5:%.2f",response, [[infos objectAtIndex:29] doubleValue]];
    }
    
    if ([[infos objectAtIndex:30] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b4:%.2f",response, [[infos objectAtIndex:30] doubleValue]];
    }
    
    if ([[infos objectAtIndex:31] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b32:%.2f",response, [[infos objectAtIndex:31] doubleValue]];
    }
    
    if ([[infos objectAtIndex:32] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b31:%.2f",response, [[infos objectAtIndex:32] doubleValue]];
    }
    
    if ([[infos objectAtIndex:33] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b30:%.2f",response, [[infos objectAtIndex:33] doubleValue]];
    }
    
    if ([[infos objectAtIndex:34] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b29:%.2f",response, [[infos objectAtIndex:34] doubleValue]];
    }
    
    if ([[infos objectAtIndex:35] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b28:%.2f",response, [[infos objectAtIndex:35] doubleValue]];
    }
    
    if ([[infos objectAtIndex:36] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b27:%.2f",response, [[infos objectAtIndex:36] doubleValue]];
    }
    
    if ([[infos objectAtIndex:37] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b26:%.2f",response, [[infos objectAtIndex:37] doubleValue]];
    }
    
    if ([[infos objectAtIndex:38] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b25:%.2f",response, [[infos objectAtIndex:38] doubleValue]];
    }
    
    if ([[infos objectAtIndex:39] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b24:%.2f",response, [[infos objectAtIndex:39] doubleValue]];
    }
    
    if ([[infos objectAtIndex:40] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b23:%.2f",response, [[infos objectAtIndex:40] doubleValue]];
    }
    
    if ([[infos objectAtIndex:41] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b22:%.2f",response, [[infos objectAtIndex:41] doubleValue]];
    }
    
    if ([[infos objectAtIndex:42] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b21:%.2f",response, [[infos objectAtIndex:42] doubleValue]];
    }
    
    if ([[infos objectAtIndex:43] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b20:%.2f",response, [[infos objectAtIndex:43] doubleValue]];
    }
    
    if ([[infos objectAtIndex:44] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b19:%.2f",response, [[infos objectAtIndex:44] doubleValue]];
    }
    
    if ([[infos objectAtIndex:45] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b18:%.2f",response, [[infos objectAtIndex:45] doubleValue]];
    }
    
    if ([[infos objectAtIndex:46] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b51:%.2f",response, [[infos objectAtIndex:46] doubleValue]];
    }
    
    if ([[infos objectAtIndex:47] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b50:%.2f",response, [[infos objectAtIndex:47] doubleValue]];
    }
    
    if ([[infos objectAtIndex:48] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b49:%.2f",response, [[infos objectAtIndex:48] doubleValue]];
    }
    
    if ([[infos objectAtIndex:49] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b48:%.2f",response, [[infos objectAtIndex:49] doubleValue]];
    }
    
    if ([[infos objectAtIndex:50] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b47:%.2f",response, [[infos objectAtIndex:50] doubleValue]];
    }
    
    if ([[infos objectAtIndex:51] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b46:%.2f",response, [[infos objectAtIndex:51] doubleValue]];
    }
    
    response  = [NSString stringWithFormat:@"%@\n",response];
    //NSLog(response,nil);
    
    return response;
}

-(void)showDetail
{
    DetailViewController *detailController = nil;
    
    for(id controller in self.childViewControllers)
    {
        if([controller isKindOfClass:[DetailViewController class]])
        {
            detailController = controller;
            
            break;
        }
    }
    
    if(detailController != nil)
    {
        //remove
        [detailController removeFromParentViewController];
        [self performSelector:@selector(doDeSelectDetail) withObject:nil afterDelay:0.0];
        
        
    }
    else
    {
        
        //add
        detailController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        
        if(!detailController)
        {
#ifdef DEBUG
            InternalErrorAlert(self, @"Internal error", @"can not find \"DetailViewController\" in storyboard");
#endif
            return;
        }
        
        detailController.theDelegate = self;
        
        //specify storyboard controller id
        detailController.videoSettingControllerID = @"VideoSettingViewController";
        detailController.gameBetLimitControllerID = @"SBGameBetLimitViewController";
        detailController.gameRuleControllerID = @"GameRulesViewController";
        detailController.historyControllerID = @"HistoryViewController";
        
        [detailController addToConrtoller:self inPosition:CGPointMake(0, [self detailViewPositionY])];
        
        [self performSelector:@selector(doSelectDetail) withObject:nil afterDelay:0.0];
        
        
    }
}

#pragma mark - GameDetailViewController delegate
-(NSString *)GameDetailViewControllerGameRuleWebAddress:(GameDetailViewController *)controller
{
    return @"https://es.esball-in.com/app/help.php?GameType=3008&lang=zh-cn&HALLID=6&State=0";
}

@end

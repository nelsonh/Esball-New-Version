//
//  CommonDragonTigerGameViewController.m
//  ESBall
//
//  Created by Nelson on 12/27/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "CommonDragonTigerGameViewController.h"


#define kPokerViewHideDelay 3.0


@interface CommonDragonTigerGameViewController ()

@end

@implementation CommonDragonTigerGameViewController

@synthesize dtBetView = _dtBetView;
@synthesize dtPokerView = _dtPokerView;
@synthesize dtRoadmap = _dtRoadmap;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc
{
    NSLog(@"game controller %@ dealloc", NSStringFromClass([self class]));
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hidePokerView) object:nil];
    
    //cancel connection if it is still loading
    if(theImagePull)
    {
        [theImagePull cancel];
        theImagePull = nil;
    }
    
    
    if(_dtRoadmap)
        [_dtRoadmap stopUpdate];
    
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

#pragma mark - calculate point
-(NSUInteger)calculateCardPointForDragon:(NSArray *)cards
{
    
    NSString *dragonCardName = [cards objectAtIndex:0];
    NSUInteger dragonCardPoint = 0;
    
    if(![dragonCardName isEqualToString:@""])
    {
        NSString *carPointStr = [[dragonCardName componentsSeparatedByString:@"."] objectAtIndex:1];
        dragonCardPoint = [carPointStr intValue];
    }
    
    return dragonCardPoint;
}

-(NSUInteger)calculateCardPointForTiger:(NSArray *)cards
{
    NSString *tigerCardName = [cards objectAtIndex:1];
    NSUInteger tigerCardPoint = 0;
    
    if(![tigerCardName isEqualToString:@""])
    {
        NSString *carPointStr = [[tigerCardName componentsSeparatedByString:@"."] objectAtIndex:1];
        tigerCardPoint = [carPointStr intValue];
    }
    
    return tigerCardPoint;
}

#pragma mark - override
-(NSString *)soundEffectPlistFileName
{
    return @"DTGameSoundEffectList";
}

-(void)PostBeginSetup
{
    
    [self loadVideoImage];
    
    /*
    self.betConfirmButton.enabled = NO;
    self.clearBetButton.enabled = NO;
    self.detailButton.enabled = NO;
    self.roadmapButton.enabled = NO;
    self.backButton.enabled = NO;
    */
    
    _dtBetView.theBetViewDelegate = self;
    
    //assign properties to bet view for chip view befroe first update
    //phone need to change value
    _dtBetView.chipSpaceWidth = [self chipSpaceWidth];
    _dtBetView.chipSpaceHeight = [self chipSpaceHeight];
    _dtBetView.chipSize = [self chipSize];
    /*
    _dtBetView.chipSpaceWidth = kChipSpaceWidth;
    _dtBetView.chipSpaceHeight = kChipSpaceHeight;
    _dtBetView.chipSize = kChipSize;
     */
    
    //Video IP
    int videoTableNumber = 1;
    videoIPStr = [self videoIpAddressWithGameShortName:@"DT" withTableNumber:videoTableNumber];
}

//phone need to override
-(void)loadVideoImage
{
    
    theImagePull = [[ImagePull alloc] init];
    theImagePull.theDelegate = self;
    
    /*
    //video with 183.182.66.165
    [theImagePull pullImageFrom:[NSURL URLWithString:[NSString stringWithFormat:@"http://183.182.66.165:80/dragontigerhd%i/sd2.jpg", 1]]];
    */

    /*
    NSString *ipAddress = [self videoImageIPAddressForTableNumber:self.tableNumber];

    [theImagePull pullImageFrom:[NSURL URLWithString:ipAddress]];
    */
    
    int videoTableNumber = 1;
    
    NSString *videoQuality = [self sdOrhdForVideoImage];
    //NSString *ipStr = [self videoIpAddressWithGameShortName:@"DT" withTableNumber:videoTableNumber];
    //NSString *videoAddr = [NSString stringWithFormat:@"http://%@/dragontiger%@%i/sd2.jpg", ipStr, videoQuality, videoTableNumber];
    NSString *videoAddr = [NSString stringWithFormat:@"http://%@/dragontiger%@%i/sd2.jpg", videoIPStr, videoQuality, videoTableNumber];
    [theImagePull pullImageFrom:[NSURL URLWithString:[NSString stringWithFormat:@"%@", videoAddr]]];
}
/*
-(void)hidePokerView
{
    _dtPokerView.visibility = NO;
}
*/
-(void)updatePokerWithUpdateInfo:(UpdateInfo *)info
{
    //assign information to poker view
    NSUInteger dragonPoint = 0;
    NSUInteger tigerPoint = 0;
    
    if(info.poker)
    {
        dragonPoint = [self calculateCardPointForDragon:info.poker];
        tigerPoint = [self calculateCardPointForTiger:info.poker];
    }
    _dtPokerView.dragonPoint = dragonPoint;
    _dtPokerView.tigerPoint = tigerPoint;
    _dtPokerView.cardImages = [NSArray arrayWithArray:info.poker];
    
    
    [_dtPokerView updateView];
}

-(void)showRoadmap
{
    if(_dtRoadmap.hidden)
    {
        [self performSelector:@selector(doSelectRoadmap) withObject:nil afterDelay:0.0];
    }
    else
    {
        [self performSelector:@selector(doDeSelectRoadmap) withObject:nil afterDelay:0.0];
    }
    
    _dtRoadmap.hidden = !_dtRoadmap.hidden;
    
    if(!_dtRoadmap.hidden)
    {
        _dtRoadmap.gameType = updateInfo.gameType;
        _dtRoadmap.gameCodeName = updateInfo.gameCodeName;
        [_dtRoadmap updateView];
    }

}

//phone need to override
//phone need to desgin it's own detail view
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
        detailController.videoSettingControllerID = @"VideoSettingViewController";//same as BaccaratGame
        detailController.gameBetLimitControllerID = @"DTGameBetLimitViewController";//give our customized one
        detailController.gameRuleControllerID = @"GameRulesViewController";//same as BaccaratGame
        detailController.historyControllerID = @"HistoryViewController";//same as BaccaratGame
        
        [detailController addToConrtoller:self inPosition:CGPointMake(0, [self detailViewPositionY])];
        
        [self performSelector:@selector(doSelectDetail) withObject:nil afterDelay:0.0];
    }
}

-(void)doClearBet
{
    //make sure BetAreaView is a class of BetView before clear all bets
    if([_dtBetView isKindOfClass:[BetView class]])
    {
        BetView *betView = (BetView *)_dtBetView;
        //[betView clearAllBetsWithHideInfo:YES];
        [betView clearBetsWithoutFinalSet];
        [betView clearAllBetTemp];
    }
}

-(void)doBetConfirm
{
    //make sure BetAreaView is a class of BetView before collect bet info
    if([_dtBetView isKindOfClass:[BetView class]])
    {
        BetView *betView = (BetView *)_dtBetView;
        
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
        
        /*
        //display total bet this round
        double totalBet = [self totalBetWithInfos:betInfos];
        self.totalBetLabel.text = [NSString stringWithFormat:@"%.2f", totalBet];
        
        //display player bet result
        [betView displayPlayerBetResult];
        
        [betView clearAllBetsWithHideInfo:NO];
        
        //reset none bet round count
        noneBetRoundCount = 0;
         */
    }
}

-(NSString *)generateBetInfoMessageWithInfos:(NSMutableArray *)infos
{
    
    NSString *response  = [NSString stringWithFormat:@"%@", updateInfo.roundSerial];
    
    if ([[infos objectAtIndex:0] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b6:%.2f",response, [[infos objectAtIndex:0] doubleValue]];
    }
    
    if ([[infos objectAtIndex:1] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b11:%.2f",response, [[infos objectAtIndex:1] doubleValue]];
    }
    
    if ([[infos objectAtIndex:3] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b10:%.2f",response, [[infos objectAtIndex:3] doubleValue]];
    }
    
    if ([[infos objectAtIndex:5] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b3:%.2f",response, [[infos objectAtIndex:5] doubleValue]];
    }
    
    if ([[infos objectAtIndex:8] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b8:%.2f",response, [[infos objectAtIndex:8] doubleValue]];
    }
    
    if ([[infos objectAtIndex:10] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b9:%.2f",response, [[infos objectAtIndex:10] doubleValue]];
    }
    
    if ([[infos objectAtIndex:9] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b4:%.2f",response, [[infos objectAtIndex:9] doubleValue]];
    }
    
    if ([[infos objectAtIndex:4] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b2:%.2f",response, [[infos objectAtIndex:4] doubleValue]];
    }
    
    if ([[infos objectAtIndex:2] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b7:%.2f",response, [[infos objectAtIndex:2] doubleValue]];
    }
    
    if ([[infos objectAtIndex:7] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b5:%.2f",response, [[infos objectAtIndex:7] doubleValue]];
    }
    
    if ([[infos objectAtIndex:6] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b1:%.2f",response, [[infos objectAtIndex:6] doubleValue]];
    }
    
    
    response  = [NSString stringWithFormat:@"%@\n",response];
    //NSLog(response,nil);
    
    return response;
}

-(void)processMarqueeInfo:(NSNotification *)notification
{
    [super processMarqueeInfo:notification];
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
    
    _dtBetView.chips = filtedChipList;
    _dtBetView.userInfo = info;

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
    self.countDownLabel.text = [NSString stringWithFormat:@"%i", info.countDown];
    if(info.countDown <= 5)
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
    
    if([lastGameStatus isEqualToString:GameStatusBetting] && [info.status isEqualToString:GameStatusDealing])
    {
        [_dtBetView clearBetsWithoutFinalSet];
    }

    
    
    if([info.status isEqualToString:GameStatusDealing]|| [info.status isEqualToString:GameStatusWaiting])
    {
        
        _dtPokerView.visibility = YES;
        
        [self updatePokerWithUpdateInfo:info];
        
    }
    /*
    else if([info.status isEqualToString:GameStatusWaiting])
    {
        if(_dtPokerView.visibility)
        {
            //last chance to update poker view
            [self updatePokerWithUpdateInfo:info];
            
            //hide poker view
            //[self performSelector:@selector(hidePokerView) withObject:nil afterDelay:kPokerViewHideDelay];
        }
    }
     */
    
    if([lastGameStatus isEqualToString:GameStatusDealing] && [info.status isEqualToString:GameStatusWaiting])
    {
        /*
        //play sound effect
        NSUInteger bankerPoint = [self calculateCardPointForDragon:info.poker];
        NSUInteger playerPoint = [self calculateCardPointForTiger:info.poker];
        
        if(bankerPoint > playerPoint)
        {
            [soundManager playSoundEffectWithKey:@"SE_BankerWin"];
        }
        else if(playerPoint > bankerPoint)
        {
            [soundManager playSoundEffectWithKey:@"SE_PlayerWin"];
        }
        else if(bankerPoint == playerPoint)
        {
            [soundManager playSoundEffectWithKey:@"SE_Tie"];
        }
         */
        
        dragonTempPoint = [self calculateCardPointForDragon:info.poker];
        tigerTempPoint = [self calculateCardPointForTiger:info.poker];
        
        //delay is order and important
        [self performSelector:@selector(playSoundOfFinalPointForDragon) withObject:nil afterDelay:0.0f];
        [self performSelector:@selector(playSoundOfFinalPointForTiger) withObject:nil afterDelay:3.0f];
        [self performSelector:@selector(playSoundOfWinLoseOrTie) withObject:nil afterDelay:6.0f];
    }
    
    //_dtPokerView.visibility = [info.status isEqualToString:@"dealing"]? YES:NO;
    
    
    if([info.status isEqualToString:GameStatusWaiting] || [info.status isEqualToString:GameStatusDealing])
    {
        
        [_dtRoadmap resetUpdateCount];
        

        
        //_changeTableButton.enabled = NO;
        //_detailButton.enabled = NO;
        self.clearBetButton.enabled = NO;
        self.betConfirmButton.enabled = NO;
    }
    else if([info.status isEqualToString:GameStatusBetting])
    {
        _dtPokerView.visibility = NO;
        
        
        //update roadmapView smooth
        if(!_dtRoadmap.hidden)
        {
            _dtRoadmap.gameType = updateInfo.gameType;
            _dtRoadmap.gameCodeName = updateInfo.gameCodeName;
            [_dtRoadmap updateView];
        }
        
        
        //_changeTableButton.enabled = YES;
        //_detailButton.enabled = YES;
        if(self.detailButton.highlighted == NO && self.recordButton.highlighted == NO)
        {
            self.clearBetButton.enabled = YES;
            self.betConfirmButton.enabled = YES;
        }
        
    }
    
    //new round
    if([lastGameStatus isEqualToString:GameStatusWaiting] && [info.status isEqualToString:GameStatusBetting])
    {
        //clean total bet
        self.totalBetLabel.text = @"0.00";
        
        //tell roadmap stop asking
        [_dtRoadmap stopAsking];
    }
    
    if([info.status isEqualToString:GameStatusBetting])
    {
        //reset
        winOrLosePromptShowed = NO;
    }
    
    //start betting indicator
    if([lastGameStatus isEqualToString:GameStatusWaiting] && [info.status isEqualToString:GameStatusBetting])
    {
        [self promptStartBettingIndicator];
        
        //play sound effect
        [soundManager playSoundEffectWithKey:@"SE_StartBet"];
    }
    
    //show win or lose
    if([info.status isEqualToString:GameStatusWaiting])
    {
        [self promptWinOrLoseIndicatorWithInfo:info];
    }
    
    if([lastGameStatus isEqualToString:GameStatusBetting] && [info.status isEqualToString:GameStatusDealing])
    {
        //play sound effect
        [soundManager playSoundEffectWithKey:@"SE_StopBet"];
    }
    
    /*
     if(!_dtRoadmap.hidden)
     {
        _dtRoadmap.gameType = updateInfo.gameType;
        _dtRoadmap.gameCodeName = updateInfo.gameCodeName;
        [_dtRoadmap updateView];
     }
     */
    
    /*
    if(!self.detailButton.enabled)
        self.detailButton.enabled = YES;
    if(!self.roadmapButton.enabled)
        self.roadmapButton.enabled = YES;
    */
    
    //give update information to bet area view
    _dtBetView.updateInfo = info;
    
    //update any necessary views
    [_dtBetView updateView];
    
}

-(void)processBetRespondInfo:(NSNotification *)notification
{
    BetRespondInfo *info = notification.object;
    
    if([info.error isEqualToString:@"BET_FAILED"] || [info.error isEqualToString:@"UNDER_MIN"])
    {
        NSString *msg = NSLocalizedString(@"下注失败", @"下注失败");
        UIAlertView *betFailAlertView = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", @"确定") otherButtonTitles: nil];
        [betFailAlertView show];
        
        BetView *betView = (BetView *)_dtBetView;
        [betView clearBetsWithoutFinalSet];
        //[betView restoreBetToLastState];
        [betView clearAllBetTemp];
        
        return;
    }
    
    BetView *betView = (BetView *)_dtBetView;
    
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
    
}

-(void)saveBetInfo
{
    //data store in app delegate
    AppDelegate *mainApp = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    BetView *betView = (BetView *)_dtBetView;
    
    //collect all BetSquares
    NSArray *squares = [betView collectAllBetSqaures];
    NSMutableDictionary *infos = [[NSMutableDictionary alloc] init];
    
    for(BetSquareView *square in squares)
    {
        //store each BetSqaure's bet history and tag as dictionary
        //tag is pre-define in interface builder
        NSString *squareTag = [NSString stringWithFormat:@"%i", square.tag];
        NSNumber *betHistory = [NSNumber numberWithDouble:square.betHistory];
        
        //tag as key bet history as value
        [infos setObject:betHistory forKey:squareTag];
    }
    
    NSString *serialNumber = [updateInfo.roundNumber stringByAppendingFormat:@" %@", updateInfo.roundSerial];
    
    //tag as key bet history as value
    [mainApp setRestoreBetInfo:infos WithGameType:self.gameType WithSerialNumber:serialNumber];
}

-(void)recoverBetInfo
{

    //data store in app delegate
    AppDelegate *mainApp = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    BetView *betView = (BetView *)_dtBetView;
    
    NSString *serialNumber = [updateInfo.roundNumber stringByAppendingFormat:@" %@", updateInfo.roundSerial];
    
    //retrieve data by gametype and serial number
    NSDictionary *dic = [mainApp restoreBetInfoWithGameType:self.gameType WithSerialNumber:serialNumber];
    
    if(dic == nil)
        return;
    
    //go through betview's subview find BetSquareView
    for(BetSquareView *square in betView.subviews)
    {
        if([square isKindOfClass:[BetSquareView class]])
        {
            NSNumber *betHistoryNumber = [dic objectForKey:[NSString stringWithFormat:@"%i", square.tag]];
            
            if(betHistoryNumber == nil)
                continue;
            
            double betHistory = [betHistoryNumber doubleValue];
            
            //assign bet history
            [square applyBetHistoryWithValue:betHistory];
            
            //show info if bet history is greater than 0
            if(betHistory > 0)
                [square showBetInfoView];
        }
    }
    
    //display them
    [betView displayPlayerHistoryBetResult];
}

//calculate total bet
-(double)totalBetWithInfos:(NSMutableArray *)infos
{
    double totalBet = 0.0;
    
    for(NSNumber *info in infos)
    {
        double singleBet = [info doubleValue];
        
        if(singleBet >= userInfo.min)
            totalBet += singleBet;
    }
    
    return totalBet;
}

#pragma mark - play sound override
-(void)playSoundOfWinLoseOrTie
{
    SoundManager *soundManager = [SoundManager soundManager];
    
    if(dragonTempPoint > tigerTempPoint)
    {
        [soundManager playSoundEffectWithKey:@"SE_DragonWin"];
    }
    else if(tigerTempPoint > dragonTempPoint)
    {
        [soundManager playSoundEffectWithKey:@"SE_TigerWin"];
    }
    else if(dragonTempPoint == tigerTempPoint)
    {
        [soundManager playSoundEffectWithKey:@"SE_Tie"];
    }
}

#pragma mark - public interface play sound
-(void)playSoundOfFinalPointForDragon
{
    SoundManager *soundManager = [SoundManager soundManager];
    
    NSString *soundKey = [NSString stringWithFormat:@"SE_DragonPoint%i", dragonTempPoint];
    
    [soundManager playSoundEffectWithKey:soundKey];
}

-(void)playSoundOfFinalPointForTiger
{
    SoundManager *soundManager = [SoundManager soundManager];
    
    NSString *soundKey = [NSString stringWithFormat:@"SE_TigerPoint%i", tigerTempPoint];
    
    [soundManager playSoundEffectWithKey:soundKey];
}

/*
-(void)playGame
{
    [super playGame];
}

-(void)handleMarqueeInfo:(NSNotification*)notification
{
    [super handleMarqueeInfo:notification];
}

-(void)handleUserInfo:(NSNotification*)notification
{
    [super handleUserInfo:notification];
}

-(void)handleUpdateInfo:(NSNotification*)notification
{
    
     //game update

    
    [super handleUpdateInfo:notification];
}

-(IBAction)back:(id)sender
{
    [super back:sender];
}

-(IBAction)roadmap:(id)sender
{
    [super roadmap:sender];
}

-(IBAction)detail:(id)sender
{
    [super detail:sender];
}

-(IBAction)clearBet:(id)sender
{
    [super clearBet:sender];
}

-(IBAction)betConfirm:(id)sender
{
    [super betConfirm:sender];
}
 */


//phone need to override and specify image name
#pragma mark - BetView delegate
/*
-(void)BetViewGreaterThanCertainRound:(BetView *)betView round:(NSUInteger)round
{
    FileFinder *fileFinder = [FileFinder fileFinder];
    

    
    NSString *imageName = [self backgroundImageNameForGameGreaterThanThirtyRound];
    self.backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:imageName]];
}

-(void)BetViewLessThanCertainRound:(BetView *)betView round:(NSUInteger)round;
{
    FileFinder *fileFinder = [FileFinder fileFinder];
    

    
    NSString *imageName = [self backgroundImageNameForGameLessThanThirtyRound];
    self.backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:imageName]];
}
 */

#pragma mark - GameDetailViewController delegate
-(NSString *)GameDetailViewControllerGameRuleWebAddress:(GameDetailViewController *)controller
{
    return @"https://es.esball-in.com/app/help.php?GameType=3003&lang=zh-cn&HALLID=6&State=0";
}


@end

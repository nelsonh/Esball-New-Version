//
//  CommonDragonTigerGameViewController.m
//  ESBall
//
//  Created by Nelson on 12/27/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "CommonDragonTigerGameViewController.h"
#import "DetailViewController.h"

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
-(void)PostBeginSetup
{
    
    [self loadVideoImage];
    
    self.betConfirmButton.enabled = NO;
    self.clearBetButton.enabled = NO;
    self.detailButton.enabled = NO;
    self.roadmapButton.enabled = NO;
    self.backButton.enabled = NO;
    
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

    NSString *ipAddress = [self videoImageIPAddressForTableNumber:self.tableNumber];

    [theImagePull pullImageFrom:[NSURL URLWithString:ipAddress]];
}

-(void)hidePokerView
{
    _dtPokerView.visibility = NO;
}

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
    _dtPokerView.cardImages = info.poker;
    
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
    
    _dtRoadmap.gameType = updateInfo.gameType;
    _dtRoadmap.gameCodeName = updateInfo.gameCodeName;
    [_dtRoadmap updateView];
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
        
        [detailController addToConrtoller:self inPosition:CGPointMake(0, kDetailViewY)];
        
        [self performSelector:@selector(doSelectDetail) withObject:nil afterDelay:0.0];
    }
}

-(void)doClearBet
{
    //make sure BetAreaView is a class of BetView before clear all bets
    if([_dtBetView isKindOfClass:[BetView class]])
    {
        BetView *betView = (BetView *)_dtBetView;
        [betView clearAllBets];
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
        
#ifdef SendRealBetInfo
        //prepare to bet
        NSString *response  = [NSString stringWithFormat:@"bet\n"];
        [self sendMessageToServerWithMessage:response];
        
        response = [NSString stringWithFormat:@"%i,%i\n", userInfo.gameType, userInfo.gameCode];
        
        //generate msg that contain bet info and sending to server
        response = [self generateBetInfoMessageWithInfos:betInfos];
        //NSLog(@"\nbet confirm message:\n%@\n", response);
        //send bet info to server
        //[self sendMessageToServerWithMessage:response];
#endif
        
        //display total bet this round
        double totalBet = [self totalBetWithInfos:betInfos];
        self.totalBetLabel.text = [NSString stringWithFormat:@"%.2f", totalBet];
        
        //display player bet result
        [betView displayPlayerBetResult];
    }
}

-(NSString *)generateBetInfoMessageWithInfos:(NSMutableArray *)infos
{
    
    NSString *response  = [NSString stringWithFormat:@"%@", updateInfo.roundSerial];
    
    if ([[infos objectAtIndex:0] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b10:%.2f",response, [[infos objectAtIndex:0] doubleValue]];
    }
    
    if ([[infos objectAtIndex:1] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b11:%.2f",response, [[infos objectAtIndex:1] doubleValue]];
    }
    
    if ([[infos objectAtIndex:2] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b5:%.2f",response, [[infos objectAtIndex:3] doubleValue]];
    }
    
    if ([[infos objectAtIndex:3] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b3:%.2f",response, [[infos objectAtIndex:5] doubleValue]];
    }
    
    if ([[infos objectAtIndex:4] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b4:%.2f",response, [[infos objectAtIndex:8] doubleValue]];
    }
    
    if ([[infos objectAtIndex:5] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b9:%.2f",response, [[infos objectAtIndex:10] doubleValue]];
    }
    
    if ([[infos objectAtIndex:6] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b8:%.2f",response, [[infos objectAtIndex:9] doubleValue]];
    }
    
    if ([[infos objectAtIndex:7] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b2:%.2f",response, [[infos objectAtIndex:4] doubleValue]];
    }
    
    if ([[infos objectAtIndex:8] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b7:%.2f",response, [[infos objectAtIndex:2] doubleValue]];
    }
    
    if ([[infos objectAtIndex:9] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b6:%.2f",response, [[infos objectAtIndex:7] doubleValue]];
    }
    
    if ([[infos objectAtIndex:10] doubleValue]>=userInfo.min)
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
    NSArray *chipFilter = [info.chipFilter copy];
    
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
    self.backButton.enabled = YES;
    
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
    
    
    if([info.status isEqualToString:GameStatusDealing])
    {
        
        _dtPokerView.visibility = YES;
        
        [self updatePokerWithUpdateInfo:info];
        
    }
    else if([info.status isEqualToString:GameStatusWaiting])
    {
        if(_dtPokerView.visibility)
        {
            //last chance to update poker view
            [self updatePokerWithUpdateInfo:info];
            
            //hide poker view
            [self performSelector:@selector(hidePokerView) withObject:nil afterDelay:kPokerViewHideDelay];
        }
    }
    //_dtPokerView.visibility = [info.status isEqualToString:@"dealing"]? YES:NO;
    
    
    if([info.status isEqualToString:GameStatusWaiting] || [info.status isEqualToString:GameStatusDealing])
    {
        
        [_dtRoadmap resetUpdateCount];
        
        //clean total bet
        self.totalBetLabel.text = @"0.00";
        
        //_changeTableButton.enabled = NO;
        //_detailButton.enabled = NO;
        self.clearBetButton.enabled = NO;
        self.betConfirmButton.enabled = NO;
    }
    else if([info.status isEqualToString:GameStatusBetting])
    {
        
        //update roadmapView
        if(!_dtRoadmap.hidden)
        {
            _dtRoadmap.gameType = updateInfo.gameType;
            _dtRoadmap.gameCodeName = updateInfo.gameCodeName;
            [_dtRoadmap updateView];
        }
        
        
        //_changeTableButton.enabled = YES;
        //_detailButton.enabled = YES;
        self.clearBetButton.enabled = YES;
        self.betConfirmButton.enabled = YES;
        
    }
    
    /*
     if(!_roadmapView.hidden)
     {
     _roadmapView.gameType = updateInfo.gameType;
     _roadmapView.gameCodeName = updateInfo.gameCodeName;
     [_roadmapView updateView];
     }
     */
    
    if(!self.detailButton.enabled)
        self.detailButton.enabled = YES;
    if(!self.roadmapButton.enabled)
        self.roadmapButton.enabled = YES;
    
    //give update information to bet area view
    _dtBetView.updateInfo = info;
    
    //update any necessary views
    [_dtBetView updateView];
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
    /**
     game update
     **/
    
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

//phone need to override and specify image name
#pragma mark - BetView delegate
-(void)BetViewGreaterThanThirtyRound:(BetView *)betView
{
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    /*
    self.backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"DTGame_bg2@2x.png"]];
     */
    
    NSString *imageName = [self backgroundImageNameForGameGreaterThanThirtyRound];
    self.backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:imageName]];
}

-(void)BetViewLessThanThirtyRound:(BetView *)betView
{
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    /*
    self.backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"DTGame_bg@2x.png"]];
     */
    
    NSString *imageName = [self backgroundImageNameForGameLessThanThirtyRound];
    self.backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:imageName]];
}

#pragma mark - GameDetailViewController delegate
-(NSString *)GameDetailViewControllerGameRuleWebAddress:(GameDetailViewController *)controller
{
    return @"https://es.esball-in.com/app/help.php?GameType=3003&lang=zh-cn&HALLID=6&State=0";
}


@end

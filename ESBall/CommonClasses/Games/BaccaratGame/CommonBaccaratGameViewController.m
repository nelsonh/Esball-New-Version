//
//  CommonBaccaratGameViewController.m
//  ESBall
//
//  Created by Nelson on 12/26/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "CommonBaccaratGameViewController.h"
#import "BetView.h"
#import "DetailViewController.h"

//#define kPokerViewHideDelay 3.0

@interface CommonBaccaratGameViewController ()

@end

@implementation CommonBaccaratGameViewController

@synthesize userAccountLabel = _userAccountLabel;
@synthesize gameNumberLabel = _gameNumberLabel;
@synthesize gameCodeNameLabel = _gameCodeNameLabel;
@synthesize dealerNameLabel = _dealerNameLabel;
@synthesize creditLabel = _creditLabel;
@synthesize totalBetLabel = _totalBetLabel;
@synthesize countDownLabel = _countDownLabel;
@synthesize roadmapButton = _roadmapButton;
@synthesize detailButton = _detailButton;
@synthesize recordButton = _recordButton;
@synthesize clearBetButton = _clearBetButton;
@synthesize betConfirmButton = _betConfirmButton;
@synthesize backButton = _backButton;
@synthesize pokerView = _pokerView;
@synthesize videoView = _videoView;
@synthesize roadmapView = _roadmapView;
@synthesize betAreaView = _betAreaView;
@synthesize backgroundImageView = _backgroundImageView;
@synthesize promptMsgView = _promptMsgView;


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
    
    if(_roadmapView)
        [_roadmapView stopUpdate];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self PostBeginSetup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - method for subclass to implement
//must override and implement
-(NSString *)videoImageIPAddressForTableNumber:(NSUInteger)tableNumber
{
    return @"";
}

-(NSString *)backgroundImageNameForGameGreaterThanThirtyRound
{
    return @"";
}

-(NSString *)backgroundImageNameForGameLessThanThirtyRound
{
    return @"";
}

-(CGFloat)chipSpaceWidth
{
    return 0.0;
}
-(CGFloat)chipSpaceHeight
{
    return 0.0;
}

-(CGFloat)chipSize
{
    return 0.0;
}

-(CGFloat)detailViewPositionY
{
    return kDetailViewY;
}

#pragma mark - override methods
-(void)resumeGame
{
    [super resumeGame];
    
    //resume video
    [self loadVideoImage];
}

-(void)pauseGame
{
    [super pauseGame];
    
    //stop video
    if(theImagePull)
    {
        [theImagePull cancel];
        theImagePull = nil;
    }
}

-(void)playGame
{
    [super playGame];
}

-(void)handleMarqueeInfo:(NSNotification*)notification
{
    [super handleMarqueeInfo:notification];
    
    [self processMarqueeInfo:notification];
}

-(void)handleUserInfo:(NSNotification*)notification
{
    [super handleUserInfo:notification];
    
    [self processUserInfo:notification];
    
}

-(void)handleUpdateInfo:(NSNotification*)notification
{
    /**
     game update
     **/
    [super handleUpdateInfo:notification];
    
    [self processUpdateInfo:notification];
    
    
}

-(IBAction)back:(id)sender
{
    [super back:sender];
}

-(IBAction)roadmap:(id)sender
{
    [super roadmap:sender];
    
    [self showRoadmap];
}

-(IBAction)detail:(id)sender
{
    [super detail:sender];
    
    [self showDetail];
}

-(IBAction)record:(id)sender
{
    [super record:sender];
    
    [self showRecord];
}

-(IBAction)clearBet:(id)sender
{
    [super clearBet:sender];
    
    [self doClearBet];
}

-(IBAction)betConfirm:(id)sender
{
    [super betConfirm:sender];
    
    [self doBetConfirm];
}

#pragma mark - public interface
//phone need to override
-(void)PostBeginSetup
{
    //start to get video image
    [self loadVideoImage];
    
    //any necessary button disable
    _betConfirmButton.enabled = NO;
    _clearBetButton.enabled = NO;
    _detailButton.enabled = NO;
    _roadmapButton.enabled = NO;
    _backButton.enabled = NO;
    
    //assign bet view delegate
    _betAreaView.theBetViewDelegate = self;
    
    //assign properties to bet view for chip view befroe first update
    _betAreaView.chipSpaceWidth = [self chipSpaceWidth];
    _betAreaView.chipSpaceHeight = [self chipSpaceHeight];
    _betAreaView.chipSize = [self chipSize];
    /*
    _betAreaView.chipSpaceWidth = kChipSpaceWidth;
    _betAreaView.chipSpaceHeight = kChipSpaceHeight;
    _betAreaView.chipSize = kChipSize;
     */
    
}

//phone need to override
-(void)loadVideoImage
{
    
    theImagePull = [[ImagePull alloc] init];
    theImagePull.theDelegate = self;
    
    if((self.tableNumber+1) >= 1 && (self.tableNumber+1) <= 3)
    {
        //A,B,C
        /*
        [theImagePull pullImageFrom:[NSURL URLWithString:[NSString stringWithFormat:@"http://183.182.66.164:80/baccarathd%i/sd2.jpg", self.tableNumber+1]]];
         */
        NSString *ipAddress = [self videoImageIPAddressForTableNumber:self.tableNumber];
        [theImagePull pullImageFrom:[NSURL URLWithString:[NSString stringWithFormat:@"%@", ipAddress]]];
    }
    else
    {
        //D,E
        /*
        [theImagePull pullImageFrom:[NSURL URLWithString:[NSString stringWithFormat:@"http://183.182.66.165:80/baccarathd%i/sd2.jpg", self.tableNumber+1]]];
         */
        NSString *ipAddress = [self videoImageIPAddressForTableNumber:self.tableNumber];
        [theImagePull pullImageFrom:[NSURL URLWithString:[NSString stringWithFormat:@"%@", ipAddress]]];
    }
    
}

-(void)doSelectRoadmap
{
    _roadmapButton.highlighted = YES;
}

-(void)doDeSelectRoadmap
{
    _roadmapButton.highlighted = NO;
}

-(void)doSelectDetail
{
    _detailButton.highlighted = YES;
}

-(void)doDeSelectDetail
{
    _detailButton.highlighted = NO;
}

-(void)doSelectRecord
{
    _recordButton.highlighted = YES;
}

-(void)doDeselectRecord
{
    _recordButton.highlighted = NO;
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
/*
-(void)hidePokerView
{
    _pokerView.visibility = NO;
}
*/
-(void)updatePokerWithUpdateInfo:(UpdateInfo *)info
{
    
    //assign information to poker view
    NSUInteger bankerPoint = 0;
    NSUInteger playerPoint = 0;
    
    if(info.poker)
    {
        bankerPoint = [self calculateCardPointForBanker:info.poker];
        playerPoint = [self calculateCardPointForPlayer:info.poker];
    }
    _pokerView.bankerPoint = bankerPoint;
    _pokerView.playerPoint = playerPoint;
    _pokerView.cardImages = info.poker;
    
    [_pokerView updateView];
}

-(void)showRoadmap
{
    if(_roadmapView.hidden)
    {
        [self performSelector:@selector(doSelectRoadmap) withObject:nil afterDelay:0.0];
    }
    else
    {
        [self performSelector:@selector(doDeSelectRoadmap) withObject:nil afterDelay:0.0];
    }
    
    _roadmapView.hidden = !_roadmapView.hidden;
    //isRouteDisplay = !_roadmapView.hidden;
    
    if(!_roadmapView.hidden)
    {
        _roadmapView.gameType = updateInfo.gameType;
        _roadmapView.gameCodeName = updateInfo.gameCodeName;
        [_roadmapView updateView];
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
        detailController.videoSettingControllerID = @"VideoSettingViewController";
        detailController.gameBetLimitControllerID = @"GameBetLimitViewController";
        detailController.gameRuleControllerID = @"GameRulesViewController";
        detailController.historyControllerID = @"HistoryViewController";
        
        [detailController addToConrtoller:self inPosition:CGPointMake(0, [self detailViewPositionY])];
        
        [self performSelector:@selector(doSelectDetail) withObject:nil afterDelay:0.0];
    }
}

-(void)showRecord
{
    //subclass and implement your own record view
}

-(void)doClearBet
{
    //make sure BetAreaView is a class of BetView before clear all bets
    if([_betAreaView isKindOfClass:[BetView class]])
    {
        BetView *betView = (BetView *)_betAreaView;
        [betView clearAllBetsWithHideInfo:YES];
    }
}

-(void)doBetConfirm
{
    //make sure BetAreaView is a class of BetView before collect bet info
    if([_betAreaView isKindOfClass:[BetView class]])
    {
        BetView *betView = (BetView *)_betAreaView;
        
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
        [self sendMessageToServerWithMessage:response];
#endif
        
        //display total bet this round
        double totalBet = [self totalBetWithInfos:betInfos];
        _totalBetLabel.text = [NSString stringWithFormat:@"%.2f", totalBet];
        
        //display player bet result
        [betView displayPlayerBetResult];
        
        //clear bet
        [betView clearAllBetsWithHideInfo:NO];
    }
}

-(NSString *)generateBetInfoMessageWithInfos:(NSMutableArray *)infos
{
    
    
    /*
     1, '百家樂 莊'
     2, '百家樂 閑'
     3, '百家樂 和'
     4, '百家樂 莊對'
     5, '百家樂 閑對'
     6, '百家樂 大'
     7, '百家樂 小'
     8 莊單
     9 莊雙
     10 閒單
     11 閒雙
     */
    
    
    
    NSString *response  = [NSString stringWithFormat:@"%@", updateInfo.roundSerial];
    
    if ([[infos objectAtIndex:0] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b10:%.2f",response, [[infos objectAtIndex:0] doubleValue]];
    }
    
    if ([[infos objectAtIndex:1] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b11:%.2f",response, [[infos objectAtIndex:1] doubleValue]];
    }
    
    if ([[infos objectAtIndex:3] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b5:%.2f",response, [[infos objectAtIndex:3] doubleValue]];
    }
    
    if ([[infos objectAtIndex:5] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b3:%.2f",response, [[infos objectAtIndex:5] doubleValue]];
    }
    
    if ([[infos objectAtIndex:8] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b4:%.2f",response, [[infos objectAtIndex:8] doubleValue]];
    }
    
    if ([[infos objectAtIndex:10] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b9:%.2f",response, [[infos objectAtIndex:10] doubleValue]];
    }
    
    if ([[infos objectAtIndex:9] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b8:%.2f",response, [[infos objectAtIndex:9] doubleValue]];
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
        response = [NSString stringWithFormat:@"%@,b6:%.2f",response, [[infos objectAtIndex:7] doubleValue]];
    }
    
    if ([[infos objectAtIndex:6] doubleValue]>=userInfo.min)
    {
        response = [NSString stringWithFormat:@"%@,b1:%.2f",response, [[infos objectAtIndex:6] doubleValue]];
    }
    
    
    response  = [NSString stringWithFormat:@"%@\n",response];
    //NSLog(response,nil);
    
    return response;
}

-(void)updatePromptMsgWithUpdateInfo:(UpdateInfo *)info
{
    if(info.payoff != 0)
    {
        _promptMsgView.hidden = NO;
        
        NSString *msg;
        
        if(info.payoff > 0)
        {
            msg = [NSString stringWithFormat:NSLocalizedString(@"您赢了: %.2f", @"您赢了: %.2f"), info.payoff];
            [_promptMsgView updateWithMessage:msg];
        }
        else if(info.payoff < 0)
        {
            msg = [NSString stringWithFormat:NSLocalizedString(@"您输了: %.2f", @"您输了: %.2f"), info.payoff*-1];
            [_promptMsgView updateWithMessage:msg];
        }
    }
    else
    {
        
        _promptMsgView.hidden = YES;
    }
        
}

-(void)processMarqueeInfo:(NSNotification *)notification
{
    
}

-(void)processUserInfo:(NSNotification *)notification
{
    UserInfo *info = notification.object;
    
    //initial user info related view
    _userAccountLabel.text =info.userName;
    
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

    _betAreaView.chips = filtedChipList;
    _betAreaView.userInfo = info;

}

-(void)processUpdateInfo:(NSNotification *)notification
{
    _backButton.enabled = YES;
    
    UpdateInfo *info = notification.object;
    
    //NSLog(@"roundNumber:%@", info.roundNumber);
    
    //update information from server
    
    //game number
    NSString *gameNumber = [info.roundNumber stringByAppendingFormat:@" %@", info.roundSerial];
    _gameNumberLabel.text = gameNumber;
    
    //game code name
    _gameCodeNameLabel.text = info.gameCodeName;
    
    //dealer name
    //NSLog(@"dealer:%@", info.dealerName);
    _dealerNameLabel.text = info.dealerName;
    
    //credit
    _creditLabel.text = [NSString stringWithFormat:@"%.2f", info.credit];
    
    //count down
    _countDownLabel.text = [NSString stringWithFormat:@"%i", info.countDown];
    
    
    
    if([info.status isEqualToString:GameStatusDealing])
    {
        _pokerView.visibility = YES;
        
        [self updatePokerWithUpdateInfo:info];
    }
    else if([info.status isEqualToString:GameStatusWaiting])
    {
        if(_pokerView.visibility)
        {
            //last chance to update poker view
            [self updatePokerWithUpdateInfo:info];
            
            //hide poker view
            //[self performSelector:@selector(hidePokerView) withObject:nil afterDelay:kPokerViewHideDelay];
        }
        
    }
    
    //_pokerView.visibility = [info.status isEqualToString:@"dealing"]? YES:NO;
    
    if([info.status isEqualToString:GameStatusWaiting] || [info.status isEqualToString:GameStatusDealing])
    {
        
        [_roadmapView resetUpdateCount];
        
        //clean total bet
        _totalBetLabel.text = @"0.00";
        
        //_changeTableButton.enabled = NO;
        //_detailButton.enabled = NO;
        _clearBetButton.enabled = NO;
        _betConfirmButton.enabled = NO;
    }
    else if([info.status isEqualToString:GameStatusBetting])
    {
        _pokerView.visibility = NO;
        
        
        //update roadmapView smooth
        if(!_roadmapView.hidden)
        {
            _roadmapView.gameType = updateInfo.gameType;
            _roadmapView.gameCodeName = updateInfo.gameCodeName;
            [_roadmapView updateView];
        }
        
        
        //_changeTableButton.enabled = YES;
        //_detailButton.enabled = YES;
        _clearBetButton.enabled = YES;
        _betConfirmButton.enabled = YES;
        
    }
    
    /*
     if(!_roadmapView.hidden)
     {
        _roadmapView.gameType = updateInfo.gameType;
        _roadmapView.gameCodeName = updateInfo.gameCodeName;
        [_roadmapView updateView];
     }
     */
    
    if(!_detailButton.enabled)
        _detailButton.enabled = YES;
    if(!_roadmapButton.enabled)
        _roadmapButton.enabled = YES;
    
    //give update information to bet area view
    _betAreaView.updateInfo = info;
    
    //update any necessary views
    [_betAreaView updateView];
    
    [self updatePromptMsgWithUpdateInfo:info];
}

#pragma mark - gameplay rule
-(NSUInteger)calculateCardPointForBanker:(NSArray *)cards
{
    NSString *cardName1 = [cards objectAtIndex:1];
    NSString *cardName2 = [cards objectAtIndex:3];
    NSString *cardName3 = [cards objectAtIndex:5];
    NSUInteger cardPoint1 = 0;
    NSUInteger cardPoint2 = 0;
    NSUInteger cardPoint3 = 0;
    NSUInteger total = 0;
    
    if(![cardName1 isEqualToString:@""])
    {
        NSString *carPointStr = [[cardName1 componentsSeparatedByString:@"."] objectAtIndex:1];
        cardPoint1 = ([carPointStr intValue]>=10)? 0:[carPointStr intValue];
    }
    
    if(![cardName2 isEqualToString:@""])
    {
        NSString *carPointStr = [[cardName2 componentsSeparatedByString:@"."] objectAtIndex:1];
        cardPoint2 = ([carPointStr intValue]>=10)? 0:[carPointStr intValue];
    }
    
    if(![cardName3 isEqualToString:@""])
    {
        NSString *carPointStr = [[cardName3 componentsSeparatedByString:@"."] objectAtIndex:1];
        cardPoint3 = ([carPointStr intValue]>=10)? 0:[carPointStr intValue];
    }
    
    total = (cardPoint1 + cardPoint2 + cardPoint3)%10;
    
    
    return total;
}

-(NSUInteger)calculateCardPointForPlayer:(NSArray *)cards
{
    NSString *cardName1 = [cards objectAtIndex:0];
    NSString *cardName2 = [cards objectAtIndex:2];
    NSString *cardName3 = [cards objectAtIndex:4];
    NSUInteger cardPoint1 = 0;
    NSUInteger cardPoint2 = 0;
    NSUInteger cardPoint3 = 0;
    NSUInteger total = 0;
    
    if(![cardName1 isEqualToString:@""])
    {
        NSString *carPointStr = [[cardName1 componentsSeparatedByString:@"."] objectAtIndex:1];
        cardPoint1 = ([carPointStr intValue]>=10)? 0:[carPointStr intValue];
    }
    
    if(![cardName2 isEqualToString:@""])
    {
        NSString *carPointStr = [[cardName2 componentsSeparatedByString:@"."] objectAtIndex:1];
        cardPoint2 = ([carPointStr intValue]>=10)? 0:[carPointStr intValue];
        
    }
    
    if(![cardName3 isEqualToString:@""])
    {
        NSString *carPointStr = [[cardName3 componentsSeparatedByString:@"."] objectAtIndex:1];
        cardPoint3 = ([carPointStr intValue]>=10)? 0:[carPointStr intValue];
        
    }
    
    total = (cardPoint1 + cardPoint2 + cardPoint3)%10;
    
    
    
    return total;
}

//phone need to override and specify image name
#pragma mark - BetView delegate
-(void)BetViewGreaterThanThirtyRound:(BetView *)betView
{
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    /*
    _backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"Game_bg2@2x.png"]];
     */
    
    NSString *imageName = [self backgroundImageNameForGameGreaterThanThirtyRound];
    _backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:imageName]];
                                  
}

-(void)BetViewLessThanThirtyRound:(BetView *)betView
{
    FileFinder *fileFinder = [FileFinder fileFinder];
    
    /*
    _backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"Game_bg@2x.png"]];
     */
    
    NSString *imageName = [self backgroundImageNameForGameLessThanThirtyRound];
    _backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:imageName]];
}

#pragma mark - ImagePull delegate
-(void)ImagePullDelegate:(ImagePull *)imagePull pullImageComplete:(UIImage *)image
{
    _videoView.image = image;
    
    [self performSelector:@selector(loadVideoImage) withObject:nil afterDelay:0.0];
    //[self loadVideoImage];
    
}

-(void)ImagePullDelegateFail:(ImagePull *)imagePull
{
    [self performSelector:@selector(loadVideoImage) withObject:nil afterDelay:0.0];
    //[self loadVideoImage];
    
}


#pragma mark - GameDetailViewController delegate
-(NSString *)GameDetailViewControllerNameForDealer:(GameDetailViewController *)controller
{
    return  [NSString stringWithString:updateInfo.dealerName];
}

-(NSString *)GameDetailViewControllerNameForTable:(GameDetailViewController *)controller
{
    return [NSString stringWithString:updateInfo.gameCodeName];
}

-(NSString *)GameDetailViewControllerNameForCurrency:(GameDetailViewController *)controller
{
    return [NSString stringWithString:userInfo.currency];
}

-(double)GameDetailViewControllerSmallBetLimit:(GameDetailViewController *)controller
{
    return userInfo.min;
}

-(double)GameDetailViewControllerSingleBetLimit:(GameDetailViewController *)controller
{
    return userInfo.max;
}

-(double)GameDetailViewControllerOUBetLimit:(GameDetailViewController *)controller
{
    return userInfo.ou;
}

-(double)GameDetailViewControllerPairBetLimit:(GameDetailViewController *)controller
{
    return userInfo.pair;
}

-(double)GameDetailViewControllerTieBetLimit:(GameDetailViewController *)controller
{
    return userInfo.tie;
}

-(NSString *)GameDetailViewControllerGameRuleWebAddress:(GameDetailViewController *)controller
{
    return @"https://es.esball-in.com/app/help.php?GameType=3001&lang=zh-cn&HALLID=6&State=0";
}

-(NSString *)GameDetailViewControllerHistoryMessage:(GameDetailViewController *)controller
{
    return marqueeInfo.marquee;
}

@end

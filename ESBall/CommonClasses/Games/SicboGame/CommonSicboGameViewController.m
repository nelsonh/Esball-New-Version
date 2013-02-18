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
    
    //Video IP
    int videoTableNumber = 1;
    videoIPStr = [self videoIpAddressWithGameShortName:@"SB" withTableNumber:videoTableNumber];
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
    
    _sbBetView.chips = filtedChipList;
    _sbBetView.userInfo = info;
    
}

-(void)processMarqueeInfo:(NSNotification *)notification
{
    
}

-(void)processUpdateInfo:(NSNotification *)notification
{
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
        self.countDownLabel.text = [NSString stringWithFormat:@"%i", info.countDown];
    else
        self.countDownLabel.text = @"0";
    
    
    
    if([info.status isEqualToString:GameStatusDealing])
    {
        //_pokerView.visibility = YES;
        
        [self updatePokerWithUpdateInfo:info];
    }
    else if([info.status isEqualToString:GameStatusWaiting])
    {
        /*
        if(_pokerView.visibility)
        {
            //last chance to update poker view
            [self updatePokerWithUpdateInfo:info];
            
            //hide poker view
            //[self performSelector:@selector(hidePokerView) withObject:nil afterDelay:kPokerViewHideDelay];
        }
        */
    }
    
    //_pokerView.visibility = [info.status isEqualToString:@"dealing"]? YES:NO;
    
    if([info.status isEqualToString:GameStatusWaiting] || [info.status isEqualToString:GameStatusDealing])
    {
        
        //[_roadmapView resetUpdateCount];
        
        //clean total bet
        self.totalBetLabel.text = @"0.00";
        
        //_changeTableButton.enabled = NO;
        //_detailButton.enabled = NO;
        self.clearBetButton.enabled = NO;
        self.betConfirmButton.enabled = NO;
    }
    else if([info.status isEqualToString:GameStatusBetting])
    {
        //_pokerView.visibility = NO;
        
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
        self.clearBetButton.enabled = YES;
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
    }
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

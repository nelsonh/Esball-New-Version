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

-(void)updatePokerWithUpdateInfo:(UpdateInfo *)info
{
    
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
    int countDown = info.countDown;
    
    if(countDown >= 0)
        self.countDownLabel.text = [NSString stringWithFormat:@"%i", info.countDown];
    
    
    
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
        if(!_roadmapView.hidden)
        {
            _roadmapView.gameType = updateInfo.gameType;
            _roadmapView.gameCodeName = updateInfo.gameCodeName;
            [_roadmapView updateView];
        }
        */
        
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
    //_betAreaView.updateInfo = info;
    
    //update any necessary views
    //[_betAreaView updateView];
}

@end

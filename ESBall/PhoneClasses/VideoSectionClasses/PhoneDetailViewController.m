//
//  PhoneDetailViewController.m
//  ESBall
//
//  Created by mobile on 13/1/15.
//  Copyright (c) 2013年 nelson. All rights reserved.
//

#import "PhoneDetailViewController.h"
#import "FileFinder.h"
#import "PhoneGameBetLimitViewController.h"
#import "PhoneGameRulesViewController.h"
#import "PhoneHistoryViewController.h"
@interface PhoneDetailViewController ()

@end

@implementation PhoneDetailViewController
@synthesize backgroundImageView = _backgroundImageView;

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
    
      FileFinder *fileFinder = [FileFinder fileFinder];
     _backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"detail_options.png"]];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)createVideoSetting
{

    VideoSettingViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:self.videoSettingControllerID];
    controller.theDelegate = self;
    [self presentViewController:controller animated:YES completion:nil];

}

-(void)createGameBetLimit
{
    PhoneGameBetLimitViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:self.gameBetLimitControllerID];
    controller.theDelegate = self;
    controller.gameBetDelegate = self;
 
    [self presentViewController:controller animated:YES completion:nil ];    
  
}

-(void)createGameRules
{
     PhoneGameRulesViewController  *controller = [self.storyboard instantiateViewControllerWithIdentifier:self.gameRuleControllerID];
    controller.theDelegate = self;
    controller.gameRuleDelegate = self;
    
    [self presentViewController:controller animated:YES completion:nil ];
    

}

-(void)createHistory
{
    PhoneHistoryViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:self.historyControllerID];
    controller.theDelegate = self;
    controller.historyDelegate = self;    
    [self presentViewController:controller animated:YES completion:nil ];
    
}


@end

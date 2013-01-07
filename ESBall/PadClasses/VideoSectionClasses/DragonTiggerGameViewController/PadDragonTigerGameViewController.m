//
//  DragonTiggerGameViewController.m
//  ESBall
//
//  Created by Nelson on 12/18/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "PadDragonTigerGameViewController.h"
#import "DetailViewController.h"

#define kPokerViewHideDelay 3.0

@interface PadDragonTigerGameViewController ()



@end

@implementation PadDragonTigerGameViewController


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


#pragma mark - override methods
//must implement
-(NSString *)videoImageIPAddressForTableNumber:(NSUInteger)tableNumber
{
    //dragon tiger table is 5 but video link is 1, so we don't use table number
    return [NSString stringWithFormat:@"http://183.182.66.165/dragontigerhd%i/sd2.jpg", 1];
}

-(NSString *)backgroundImageNameForGameGreaterThanThirtyRound
{
    return @"DTGame_bg2@2x.png";
}

-(NSString *)backgroundImageNameForGameLessThanThirtyRound
{
    return @"DTGame_bg@2x.png";
}

-(CGFloat)chipSpaceWidth
{
    return kChipSpaceWidth;
}

-(CGFloat)chipSpaceHeight
{
    return kChipSpaceHeight;
}

-(CGFloat)chipSize
{
    return kChipSize;
}

-(void)PostBeginSetup
{
    [super PostBeginSetup];
    
    //set background manually
    FileFinder *fileFinder = [FileFinder fileFinder];
    self.backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"DTGame_bg@2x.png"]];
    
    /*
    [self loadVideoImage];
    
    self.betConfirmButton.enabled = NO;
    self.clearBetButton.enabled = NO;
    self.detailButton.enabled = NO;
    self.roadmapButton.enabled = NO;
    self.backButton.enabled = NO;
    
    self.dtBetView.theBetViewDelegate = self;
    
    //assign properties to bet view for chip view befroe first update
    self.dtBetView.chipSpaceWidth = kChipSpaceWidth;
    self.dtBetView.chipSpaceHeight = kChipSpaceHeight;
    self.dtBetView.chipSize = kChipSize;
     */
}

/*
-(void)loadVideoImage
{

    theImagePull = [[ImagePull alloc] init];
    theImagePull.theDelegate = self;
    
    //video with 183.182.66.165 
    [theImagePull pullImageFrom:[NSURL URLWithString:[NSString stringWithFormat:@"http://183.182.66.165:80/dragontigerhd%i/sd2.jpg", 1]]];
    
}
 */

@end

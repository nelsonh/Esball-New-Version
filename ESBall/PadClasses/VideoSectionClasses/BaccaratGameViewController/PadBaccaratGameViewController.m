//
//  GameViewController.m
//  ESBall
//
//  Created by tomneo2004 on 12/11/27.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "PadBaccaratGameViewController.h"
#import "DetailViewController.h"



@interface PadBaccaratGameViewController ()


@end

@implementation PadBaccaratGameViewController


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

-(void)loadView
{
    [super loadView];
    
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
    if((tableNumber+1) >= 1 && (tableNumber+1) <= 3)
    {
        //A,B,C
        return [NSString stringWithFormat:@"http://183.182.66.165/baccarathd%i/sd2.jpg", tableNumber+1];
    }
    else
    {
        //D,E
        return [NSString stringWithFormat:@"http://183.182.66.165/baccarathd%i/sd2.jpg", tableNumber+1];
    }
}

-(NSString *)backgroundImageNameForGameGreaterThanThirtyRound
{
    return @"Game_bg2@2x.png";
}

-(NSString *)backgroundImageNameForGameLessThanThirtyRound
{
    return @"Game_bg@2x.png";
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
    
    //setup background
    FileFinder *fileFinder = [FileFinder fileFinder];
    self.backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"Game_bg@2x.png"]];
    
    /*
    //timerForVideo = [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(loadVideoImage) userInfo:nil repeats:YES];
    //[[NSRunLoop currentRunLoop] addTimer:timerForVideo forMode:NSRunLoopCommonModes];
    //start to get video image
    [self loadVideoImage];
    
    //any necessary button disable
    self.betConfirmButton.enabled = NO;
    self.clearBetButton.enabled = NO;
    self.detailButton.enabled = NO;
    self.roadmapButton.enabled = NO;
    self.backButton.enabled = NO;
    
    //assign bet view delegate
    self.betAreaView.theBetViewDelegate = self;
    //assign properties to bet view for chip view befroe first update
    self.betAreaView.chipSpaceWidth = kChipSpaceWidth;
    self.betAreaView.chipSpaceHeight = kChipSpaceHeight;
    self.betAreaView.chipSize = kChipSize;
     */
     
}

/*
-(void)loadVideoImage
{
    theImagePull = [[ImagePull alloc] init];
    theImagePull.theDelegate = self;
    
    if((self.tableNumber+1) >= 1 && (self.tableNumber+1) <= 3)
    {
        [theImagePull pullImageFrom:[NSURL URLWithString:[NSString stringWithFormat:@"http://183.182.66.164:80/baccarathd%i/sd2.jpg", self.tableNumber+1]]];
    }
    else
    {
        [theImagePull pullImageFrom:[NSURL URLWithString:[NSString stringWithFormat:@"http://183.182.66.165:80/baccarathd%i/sd2.jpg", self.tableNumber+1]]];
    }
}
*/

@end

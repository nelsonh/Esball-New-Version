//
//  PhoneBaccaratGameViewController.m
//  ESBall
//
//  Created by mobile on 12/12/27.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "PhoneBaccaratGameViewController.h"
#import "PhoneVideoSectionChangeControllerViewController.h"
#import "BaccaratBetRecordViewController.h"
#import "LoadingHUD.h"
@interface PhoneBaccaratGameViewController ()

@end

@implementation PhoneBaccaratGameViewController

@synthesize gameCodeNameLabel = _gameCodeNameLabel;
 LoadingHUD *loadingHUD;
bool firstLoading=NO;
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
    [self loadingView];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)videoImageIPAddressForTableNumber:(NSUInteger)tableNumber
{
    if((tableNumber+1) >= 1 && (tableNumber+1) <= 3)
    {
        //A,B,C
        return [NSString stringWithFormat:@"http://183.182.66.165/baccaratsd%i/sd2.jpg", tableNumber+1];
    }
    else
    {
        //D,E
        return [NSString stringWithFormat:@"http://183.182.66.165/baccaratsd%i/sd2.jpg", tableNumber+1];
    }
}

-(NSString *)backgroundImageNameForGameGreaterThanThirtyRound
{
    return @"Game_bg2s.png";
}

-(NSString *)backgroundImageNameForGameLessThanThirtyRound
{
    return @"Game_bgs.png";
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
    return 32.0;
}

-(CGFloat)detailViewPositionY
{
    return 40;
}
//james_13_0103
-(void)processUpdateInfo:(NSNotification *)notification
{
    [super processUpdateInfo:notification];
    
    UpdateInfo *info = notification.object;

    _gameCodeNameLabel.text = [NSString stringWithFormat:@"百家乐%@", info.gameCodeName];

    //game code name

}

-(IBAction)back:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
    /*
    PhoneVideoSectionChangeControllerViewController  *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"phoneVideoSectionChangeViewController"];
    
    [self presentViewController:controller animated:YES completion:nil];
     */

    //[self.view removeFromSuperview];
   // [self willMoveToParentViewController:nil];
  //  [self removeFromParentViewController];
    
   // PhoneVideoSectionChangeControllerViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"BaccaratGameViewController"];
    
   // controller.tableNumber = tableIndex-1;
   // controller.gameType = 3001;
 //   [self presentViewController:controller animated:YES completion:nil];

    
  //  if([self.theDelegate respondsToSelector:@selector(BaseGameViewControllerDidDismiss:)])
  //  {
  //      [self.theDelegate BaseGameViewControllerDidDismiss:self];
   // }
}

-(void)showRecord
{
    [super showRecord];
    
    BaccaratBetRecordViewController *betRecordController = nil;
    
    betRecordController = [self.storyboard instantiateViewControllerWithIdentifier:@"BaccaratBetRecordViewController"];
    
    //betRecordController.theDelegate = self;
    betRecordController.gameType = self.gameType;
    
    [self presentViewController:betRecordController animated:YES completion:nil];
    
    /*
    for(id controller in self.childViewControllers)
    {
        if([controller isKindOfClass:[BaccaratBetRecordViewController class]])
        {
            betRecordController = controller;
            
            break;
        }
    }
    
    if(betRecordController != nil)
    {
        //remove
        [betRecordController removeFromParentViewController];
        [self performSelector:@selector(doDeselectRecord) withObject:nil afterDelay:0.0];
    }
    else
    {
        
        //add
        betRecordController = [self.storyboard instantiateViewControllerWithIdentifier:@"BaccaratBetRecordViewController"];
        
        betRecordController.theDelegate = self;
        betRecordController.gameType = self.gameType;
        
        if(!betRecordController)
        {
#ifdef DEBUG
            InternalErrorAlert(self, @"Internal error", @"can not find \"BetRecordViewController\" in storyboard");
#endif
            return;
        }
        
        
        [betRecordController pre:self inPosition:CGPointMake(0, 0)];
        
        [self performSelector:@selector(doSelectRecord) withObject:nil afterDelay:0.0];
    }
     */
}

-(void)loadingView
{
    firstLoading=NO;
    NSString *animFilePath = [[NSBundle mainBundle] pathForResource:@"LoadingAnim" ofType:@"plist"];
    NSArray *animImageNames = [NSArray arrayWithContentsOfFile:animFilePath];
    NSMutableArray *animImages = [[NSMutableArray alloc] init];
    
    for(NSString *imageName in animImageNames)
    {
        FileFinder *fileFinder = [FileFinder fileFinder];
        UIImage *image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:imageName]];
        [animImages addObject:image];
    }
    
    loadingHUD = [[LoadingHUD alloc] initWithFrame:self.view.bounds loadingAnimImages:animImages];
    
    [self.view addSubview:loadingHUD];
}

-(void)dismissLoadingView
{
    if(loadingHUD)
    {
        [loadingHUD removeFromSuperview];
        loadingHUD = nil;
    }
}


-(void)handleUpdateInfo:(NSNotification*)notification
{
    [super handleUpdateInfo:notification];
    if( firstLoading==NO)
    {
        [self dismissLoadingView];
        firstLoading=YES;
    }
 }

@end

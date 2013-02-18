//
//  PhoneDragonTigertGameViewController.m
//  ESBall
//
//  Created by mobile on 13/1/22.
//  Copyright (c) 2013年 nelson. All rights reserved.
//

#import "PhoneDragonTigertGameViewController.h"
#import "DetailViewController.h"
#import "PhoneDragonTigerBetRecordViewController.h"


#define kPokerViewHideDelay 3.0
@interface PhoneDragonTigertGameViewController ()

@end

@implementation PhoneDragonTigertGameViewController




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

#pragma mark - override methods
//must implement
-(NSString *)videoImageIPAddressForTableNumber:(NSUInteger)tableNumber
{
    //dragon tiger table is 5 but video link is 1, so we don't use table number
    return [NSString stringWithFormat:@"http://183.182.66.165/dragontigersd%i/sd2.jpg", 1];
}

-(NSString *)sdOrhdForVideoImage
{
    return @"sd";
}

-(NSString *)backgroundImageNameForGameGreaterThanCertainRound:(NSUInteger)round
{
    return @"DTGame_bg2s.png";
}

-(NSString *)backgroundImageNameForGameLessThanCertainRound:(NSUInteger)round
{
    return @"DTGame_bgs.png";
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
    
    
    PhoneDragonTigerBetRecordViewController *betRecordController = nil;
    
    betRecordController = [self.storyboard instantiateViewControllerWithIdentifier:@"DragonTigerBetRecordViewController"];
    
    //betRecordController.theDelegate = self;
    betRecordController.gameType = self.gameType;
    
    [self presentViewController:betRecordController animated:YES completion:nil];
    
    /*
    DragonTigerBetRecordViewController *betRecordController = nil;
    
    for(id controller in self.childViewControllers)
    {
        if([controller isKindOfClass:[DragonTigerBetRecordViewController class]])
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
        betRecordController = [self.storyboard instantiateViewControllerWithIdentifier:@"DragonTigerBetRecordViewController"];
        
        betRecordController.theDelegate = self;
        betRecordController.gameType = self.gameType;
        
        if(!betRecordController)
        {
#ifdef DEBUG
            InternalErrorAlert(self, @"Internal error", @"can not find \"DragonTigerBetRecordViewController\" in storyboard");
#endif
            return;
        }
        
        
        [betRecordController addToConrtoller:self inPosition:CGPointMake(0, kDetailViewY)];
        
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

-(void)PostBeginSetup
{
    [super PostBeginSetup];
    
    //set background manually
    FileFinder *fileFinder = [FileFinder fileFinder];
    self.backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"DTGame_bgs.png"]];
}

-(void)processUpdateInfo:(NSNotification *)notification
{
    [super processUpdateInfo:notification];
    
    UpdateInfo *info = notification.object;
    
    self.gameCodeNameLabel.text = [NSString stringWithFormat:@"龙虎斗%@", info.gameCodeName];
    
    //game code name
    
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


#pragma mark - BetRecordViewController delegate
-(void)BetRecordViewControllerDidAddToParentController:(BetRecordViewController *)controller
{
    
}

-(void)BetRecordViewControllerDidRemoveFromParentController:(BetRecordViewController *)controller
{
    
}

@end

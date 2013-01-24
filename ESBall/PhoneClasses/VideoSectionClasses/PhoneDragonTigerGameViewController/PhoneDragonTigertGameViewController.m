//
//  PhoneDragonTigertGameViewController.m
//  ESBall
//
//  Created by mobile on 13/1/22.
//  Copyright (c) 2013年 nelson. All rights reserved.
//

#import "PhoneDragonTigertGameViewController.h"
#import "DetailViewController.h"

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

-(NSString *)backgroundImageNameForGameGreaterThanThirtyRound
{
    return @"DTGame_bg2s.png";
}

-(NSString *)backgroundImageNameForGameLessThanThirtyRound
{
    return @"DTGame_bgs.png";
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

-(void)showRecord
{
    [super showRecord];
    
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
}

-(void)PostBeginSetup
{
    [super PostBeginSetup];
    
    //set background manually
    FileFinder *fileFinder = [FileFinder fileFinder];
    self.backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"DTGame_bgs.png"]];
   }


#pragma mark - BetRecordViewController delegate
-(void)BetRecordViewControllerDidAddToParentController:(BetRecordViewController *)controller
{
    
}

-(void)BetRecordViewControllerDidRemoveFromParentController:(BetRecordViewController *)controller
{
    
}

@end

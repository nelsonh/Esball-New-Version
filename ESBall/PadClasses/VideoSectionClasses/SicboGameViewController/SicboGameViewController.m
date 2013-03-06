//
//  SicboGameViewController.m
//  ESBall
//
//  Created by Nelson on 1/2/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "SicboGameViewController.h"

@interface SicboGameViewController ()

@end

@implementation SicboGameViewController

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
    //sicbo table is 9 but video link is 1, so we don't use table number
    return [NSString stringWithFormat:@"http://183.182.66.164/sicbohd%i/sd2.jpg", 1];
}

-(NSString *)sdOrhdForVideoImage
{
    return @"hd";
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
    
    SicboBetRecordViewController *betRecordController = nil;
    
    for(id controller in self.childViewControllers)
    {
        if([controller isKindOfClass:[SicboBetRecordViewController class]])
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
        betRecordController = [self.storyboard instantiateViewControllerWithIdentifier:@"SicboBetRecordViewController"];
        
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

#pragma mark - BetRecordViewController delegate
-(void)BetRecordViewControllerDidAddToParentController:(BetRecordViewController *)controller
{
    
}

-(void)BetRecordViewControllerDidRemoveFromParentController:(BetRecordViewController *)controller
{
    
}

@end

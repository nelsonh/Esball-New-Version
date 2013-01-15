//
//  PhoneBaccaratGameViewController.m
//  ESBall
//
//  Created by mobile on 12/12/27.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "PhoneBaccaratGameViewController.h"
#import "PhoneVideoSectionChangeControllerViewController.h"
@interface PhoneBaccaratGameViewController ()

@end

@implementation PhoneBaccaratGameViewController

@synthesize gameCodeNameLabel = _gameCodeNameLabel;

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

-(NSString *)videoImageIPAddressForTableNumber:(NSUInteger)tableNumber
{
    return @"http://183.182.66.239/baccaratsd1/sd2.jpg";
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

@end

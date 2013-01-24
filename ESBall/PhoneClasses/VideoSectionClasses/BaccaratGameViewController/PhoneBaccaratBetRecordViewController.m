//
//  PhoneBaccaratBetRecordViewController.m
//  ESBall
//
//  Created by mobile on 13/1/18.
//  Copyright (c) 2013年 nelson. All rights reserved.
//

#import "PhoneBaccaratBetRecordViewController.h"
#import "PhoneBaccaratBetRecordDetailViewController.h"
@interface PhoneBaccaratBetRecordViewController ()

@end

@implementation PhoneBaccaratBetRecordViewController

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

-(IBAction)exit:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(void)showDetailRecordWithCID:(NSString *)cid withGameType:(NSString *)gameType
{
    //this is default subclass need implement
    
    //if there is one remove it
   /* for(id controller in self.childViewControllers)
    {
        if([controller isKindOfClass:[PhoneBaccaratBetRecordDetailViewController class]])
        {
            BaccaratBetRecordDetailViewController *detailController = controller;
            
            [detailController removeFromParentViewController];
            
            break;
        }
    }*/
    
    //add new one
    PhoneBaccaratBetRecordDetailViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"BaccaratBetRecordDetailViewController"];
    
    controller.cid = cid;
    controller.gameType = gameType;
    [self presentViewController:controller animated:YES completion:nil];
  
}
@end

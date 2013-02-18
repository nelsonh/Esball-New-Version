//
//  PhoneDragonTigerBetRecordViewController.m
//  ESBall
//
//  Created by Nelson on 1/28/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "PhoneDragonTigerBetRecordViewController.h"
#import "PhoneDragonTigerBetRecordDetailViewController.h"

@interface PhoneDragonTigerBetRecordViewController ()

@end

@implementation PhoneDragonTigerBetRecordViewController

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
    PhoneDragonTigerBetRecordDetailViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"DragonTigerBetRecordDetailViewController"];
    
    controller.cid = cid;
    controller.gameType = gameType;
    [self presentViewController:controller animated:YES completion:nil];
    
}

#pragma mark - override
-(BOOL)presentEmptyModelAtBeginning
{
    return NO;
}

-(CGFloat)cellWitdh
{
    return 340;
}

@end

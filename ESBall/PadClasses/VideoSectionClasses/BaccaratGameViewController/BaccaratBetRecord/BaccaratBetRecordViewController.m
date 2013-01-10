//
//  BaccaratBetRecordViewController.m
//  ESBall
//
//  Created by Nelson on 1/10/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "BaccaratBetRecordViewController.h"
#import "BaccaratBetRecordDetailViewController.h"

@interface BaccaratBetRecordViewController ()

@end

@implementation BaccaratBetRecordViewController

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

#pragma mark - override
-(BOOL)presentEmptyModelAtBeginning
{
    return YES;
}

-(NSUInteger)numberOfDataToPull
{
    return 150;
}

-(NSUInteger)sectionToPull
{
    return 1;
}

-(NSString *)cellBackgroundImageName
{
    return @"L_row_bet.png";
}

-(NSString *)cellSelectedBackgroundImageName
{
    return @"L_row_bet2.png";
}

-(CGFloat)tableViewHeaderHeight
{
    return 22.0f;
}

-(NSString *)tableViewHeaderBackgroundImageName
{
    return @"L_row_date.png";
}

-(CGFloat)tableViewTitleXPosition
{
    return 14.0f;
}

-(UIColor *)tableViewTitleColor
{
    return [UIColor darkGrayColor];
}

-(NSString *)cellIdentifier
{
    //must match cell id in IB
    return @"BetRecordCell";
}

-(void)showDetailRecordWithCID:(NSString *)cid withGameType:(NSString *)gameType
{
    //this is default subclass need implement
    
    //if there is one remove it
    for(id controller in self.childViewControllers)
    {
        if([controller isKindOfClass:[BaccaratBetRecordDetailViewController class]])
        {
            BaccaratBetRecordDetailViewController *detailController = controller;
            
            [detailController removeFromParentViewController];
            
            break;
        }
    }
    
    //add new one
    BaccaratBetRecordDetailViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"BaccaratBetRecordDetailViewController"];
    
    controller.cid = cid;
    controller.gameType = gameType;
    
    [controller addToConrtoller:self inFrame:self.referenceView.frame];
}

@end

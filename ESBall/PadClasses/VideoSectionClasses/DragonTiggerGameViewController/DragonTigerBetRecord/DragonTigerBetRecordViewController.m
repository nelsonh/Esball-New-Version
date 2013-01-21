//
//  DragonTigerBetRecordViewController.m
//  ESBall
//
//  Created by Nelson on 1/10/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "DragonTigerBetRecordViewController.h"
#import "DragonTigerBetRecordDetailViewController.h"

@interface DragonTigerBetRecordViewController ()

@end

@implementation DragonTigerBetRecordViewController

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

-(CGFloat)cellX
{
    return -8.0f;
}

-(CGFloat)cellWitdh
{
    return 300;
}

-(void)showDetailRecordWithCID:(NSString *)cid withGameType:(NSString *)gameType
{
    //this is default subclass need implement
    
    //if there is one remove it
    for(id controller in self.childViewControllers)
    {
        if([controller isKindOfClass:[DragonTigerBetRecordDetailViewController class]])
        {
            DragonTigerBetRecordDetailViewController *detailController = controller;
            
            [detailController removeFromParentViewController];
            
            break;
        }
    }
    
    //add new one
    DragonTigerBetRecordDetailViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"DragonTigerBetRecordDetailViewController"];
    
    controller.cid = cid;
    controller.gameType = gameType;
    
    [controller addToConrtoller:self inFrame:self.referenceView.frame];
     
}

@end

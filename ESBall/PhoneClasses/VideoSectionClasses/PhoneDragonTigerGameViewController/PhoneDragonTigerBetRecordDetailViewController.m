//
//  PhoneDragonTigerBetRecordDetailViewController.m
//  ESBall
//
//  Created by Nelson on 1/28/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "PhoneDragonTigerBetRecordDetailViewController.h"

@interface PhoneDragonTigerBetRecordDetailViewController ()

@end

@implementation PhoneDragonTigerBetRecordDetailViewController

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

#pragma mark - override
-(void)processData:(NSMutableDictionary *)dic
{
    //process common data not each row record data
    self.roundNumberLabel.text = [detailRecord objectForKey:@"RoundSerial"];
    
    NSArray *splited = [[detailRecord objectForKey:@"WagersDate"] componentsSeparatedByString:@" "];
    self.dateTimeLabel.text = [splited objectAtIndex:0];
    
    self.commentLabel.text = nil;
    
    NSString *tableName = [self gameCodeNameWithGameCode:[[detailRecord objectForKey:@"GameCode"] intValue]];
    self.tableNumberLabel.text = tableName;
    
}

@end

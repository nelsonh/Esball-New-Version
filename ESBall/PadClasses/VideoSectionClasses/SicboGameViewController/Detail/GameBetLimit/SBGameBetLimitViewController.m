//
//  SBGameBetLimitViewController.m
//  ESBall
//
//  Created by Nelson on 1/24/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "SBGameBetLimitViewController.h"

@interface SBGameBetLimitViewController ()

@end

@implementation SBGameBetLimitViewController

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
    
    self.view.backgroundColor = [UIColor clearColor];
    
    if([self.gameBetDelegate respondsToSelector:@selector(GameBetLimitViewControllerLimitForSmallBet:)])
    {
        int value = [self.gameBetDelegate GameBetLimitViewControllerLimitForSmallBet:self];
        
        self.smallBetLimitLabel.text = [NSString stringWithFormat:@"%i", value];
        
    }
    
    if([self.gameBetDelegate respondsToSelector:@selector(GameBetLimitViewControllerLimitForSingleBet:)])
    {
        int value = [self.gameBetDelegate GameBetLimitViewControllerLimitForSingleBet:self];
        
        self.singleBetLimitLabel.text = [NSString stringWithFormat:@"%i", value];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

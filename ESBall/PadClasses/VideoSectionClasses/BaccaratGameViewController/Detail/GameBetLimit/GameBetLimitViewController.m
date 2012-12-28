//
//  GameBetLimitViewController.m
//  ESBall
//
//  Created by Nelson on 12/10/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "GameBetLimitViewController.h"

@interface GameBetLimitViewController ()





@end

@implementation GameBetLimitViewController


@synthesize smallBetLimitLabel = _smallBetLimitLabel;
@synthesize singleBetLimitLabel = _singleBetLimitLabel;
@synthesize ouBetLimitLabel = _ouBetLimitLabel;
@synthesize pairBetLimitLabel = _pairBetLimitLabel;
 

@synthesize gameBetDelegate = _gameBetDelegate;

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
    
    if([_gameBetDelegate respondsToSelector:@selector(GameBetLimitViewControllerLimitForSmallBet:)])
    {
        int value = [_gameBetDelegate GameBetLimitViewControllerLimitForSmallBet:self];
        
        _smallBetLimitLabel.text = [NSString stringWithFormat:@"%i", value];
        
    }
    
    if([_gameBetDelegate respondsToSelector:@selector(GameBetLimitViewControllerLimitForSingleBet:)])
    {
        int value = [_gameBetDelegate GameBetLimitViewControllerLimitForSingleBet:self];
        
        _singleBetLimitLabel.text = [NSString stringWithFormat:@"%i", value];
    }
    
    if([_gameBetDelegate respondsToSelector:@selector(GameBetLimitViewControllerLimitForOUBet:)])
    {
        int value = [_gameBetDelegate GameBetLimitViewControllerLimitForOUBet:self];
        
        _ouBetLimitLabel.text = [NSString stringWithFormat:@"%i", value];
    }
    
    if([_gameBetDelegate respondsToSelector:@selector(GameBetLimitViewControllerLimitForPairBet:)])
    {
        int value = [_gameBetDelegate GameBetLimitViewControllerLimitForPairBet:self];
        
        _pairBetLimitLabel.text = [NSString stringWithFormat:@"%i", value];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end

//
//  GameRulesViewController.m
//  ESBall
//
//  Created by Nelson on 12/10/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "GameRulesViewController.h"

@interface GameRulesViewController ()



@end

@implementation GameRulesViewController

@synthesize gameRuleDelegate = _gameRuleDelegate;
@synthesize webView = _webView;

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
    
    if([_gameRuleDelegate respondsToSelector:@selector(GameRulesViewControllerRuleWebAddress:)])
    {
        NSURL *ruleURL = [_gameRuleDelegate GameRulesViewControllerRuleWebAddress:self];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:ruleURL];
        [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        
        [_webView loadRequest:request];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

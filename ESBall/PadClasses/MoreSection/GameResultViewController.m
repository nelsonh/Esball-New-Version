//
//  GameResultViewController.m
//  ESBall
//
//  Created by tomneo2004 on 12/11/18.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "GameResultViewController.h"

@interface GameResultViewController ()



@end

@implementation GameResultViewController


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
    
    NSString *urlStr = @"https://esball.com/cl/index.php?module=MGetGameResult&method=DisplayResultLottery";
    
    NSString *htmlStr = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlStr] encoding:NSUTF8StringEncoding error:nil];
    
    [self.infoView loadHTMLString:htmlStr baseURL:[NSURL URLWithString:urlStr]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  LotterySectionViewController.m
//  ESBall
//
//  Created by nelson on 12/11/16.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "LotterySectionViewController.h"
#import "ServerInterface.h"

@interface LotterySectionViewController ()

@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *loadingIndicator;
@property (nonatomic, weak) IBOutlet UIWebView *gameView;


@end

@implementation LotterySectionViewController

@synthesize loadingIndicator = _loadingIndicator;
@synthesize gameView = _gameView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc
{
    NSLog(@"lottery section dealloc");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _gameView.delegate = self;
    
    __block ServerInterface *interface = [ServerInterface serverInterface];
    
    [_loadingIndicator startAnimating];
    _loadingIndicator.hidden = NO;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
    
        NSString *urlStr = [NSString stringWithFormat:@"https://esball.net/app/member/main.php?uid=%@&langx=zh-tw&page_site=Lottery&L_GameType=BJK8", interface.theSID];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60.0];
        
        [_gameView loadRequest:request];
    });
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebView delegate
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [_loadingIndicator stopAnimating];
    _loadingIndicator.hidden = YES;
    NSLog(@"web loading error:%@", error);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_loadingIndicator stopAnimating];
    _loadingIndicator.hidden = YES;
    
    
}

@end

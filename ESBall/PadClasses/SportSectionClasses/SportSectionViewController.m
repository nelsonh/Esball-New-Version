//
//  SportSectionViewController.m
//  ESBall
//
//  Created by Nelson on 12/18/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "SportSectionViewController.h"
#import "ServerInterface.h"

@interface SportSectionViewController ()


@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *loadingIndicator;
@property (nonatomic, weak) IBOutlet UIWebView *browser;

@end

@implementation SportSectionViewController

@synthesize loadingIndicator = _loadingIndicator;
@synthesize browser = _browser;


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
    

    _browser.delegate = self;

    
    __block ServerInterface *interface = [ServerInterface serverInterface];
    
    [_loadingIndicator startAnimating];
    _loadingIndicator.hidden = NO;
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
    
        //browser
        NSString *browserURLStr = [NSString stringWithFormat:@"http://ts-m.vir888.com/app/member/BrowseSport/browse.php?gtype=FT&ptype=S&uid=%@", interface.theSID];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:browserURLStr] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60.0];
        
        [_browser loadRequest:request];
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

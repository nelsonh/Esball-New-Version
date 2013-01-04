//
//  PadLoginViewController.m
//  ESBall
//
//  Created by nelson on 12/11/15.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "PadLoginViewController.h"
#import "PadMainViewController.h"
#import "XMLParser.h"
#import "FileFinder.h"
#import <QuartzCore/QuartzCore.h>


@interface PadLoginViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic, weak) IBOutlet UIButton *loginButton;

@end

@implementation PadLoginViewController

@synthesize theDelegate = _theDelegate;
@synthesize backgroundImageView = _backgroundImageView;
@synthesize loginButton = _loginButton;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    

}

-(void)dealloc
{
    NSLog(@"login dealloc");
}

-(void)loadView
{
    [super loadView];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view
    
    FileFinder *fileFinder = [FileFinder fileFinder];
    _backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"Login_bg@2x.png"]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //only landscape
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

#pragma mark - override method
-(void)reserveSpotSuccess:(NSNotification *)notification
{
    [super reserveSpotSuccess:notification];
    
    //inform delegate
    if([_theDelegate respondsToSelector:@selector(PadLoginViewControllerDidLogin:)])
    {
        [_theDelegate PadLoginViewControllerDidLogin:self];
    }
}

-(IBAction)login:(id)sender
{
    [super login:sender];
    
}

/*
#pragma mark - AsyncSocket delegate
-(void)AsyncSocket:(AsyncSocket *)socket didLoginWithUsername:(NSString *)username andPassword:(NSString *)password
{
    [super AsyncSocket:socket didLoginWithUsername:username andPassword:password];
}
*/

#pragma mark ServerInterface delegate
-(void)ServerInterface:(ServerInterface *)interface didConnectToHost:(NSString *)hostname onPort:(uint16_t)port
{
    [super ServerInterface:interface didConnectToHost:hostname onPort:port];
    NSLog(@"did connect to host:%@ on Port:%u", hostname, port);
}

-(void)ServerInterface:(ServerInterface *)interface didLoginWithUsername:(NSString *)username andPassword:(NSString *)password
{
    [super ServerInterface:interface didLoginWithUsername:username andPassword:password];
    
    /*
    if([_theDelegate respondsToSelector:@selector(PadLoginViewControllerDidLogin:)])
    {
        [_theDelegate PadLoginViewControllerDidLogin:self];
    }
     */
    
    /*
    //go to main view
    PadLoginViewController *mainView = [self.storyboard instantiateViewControllerWithIdentifier:@"PadMainViewController"];
    [self presentViewController:mainView animated:YES completion:nil];
    */
    
    /*
    //test
    ServerInterface *theInterface = [ServerInterface serverInterface];
    NSString *getUserInfoMsg = @"userInfo\n";
    [theInterface sendDataToServerWithData:[getUserInfoMsg dataUsingEncoding:NSASCIIStringEncoding]];
     */
}

-(void)ServerInterface:(ServerInterface *)interface errorOccurredWithError:(NSString *)errorMsg
{
    [super ServerInterface:interface errorOccurredWithError:errorMsg];
    
    
}
    
/*
//override method from super class
-(void)LogMe
{
    NSLog(@"Pad log in class LogMe");
}
 */

@end

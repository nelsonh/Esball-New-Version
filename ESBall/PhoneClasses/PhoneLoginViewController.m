//
//  PhoneLoginViewController.m
//  ESBall
//
//  Created by nelson on 12/11/15.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "PhoneLoginViewController.h"
#import "PhoneMainViewController.h"
#import "XMLParser.h"
#import "FileFinder.h"

@interface PhoneLoginViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageView;

@end

@implementation PhoneLoginViewController

@synthesize theDelegate = _theDelegate;
@synthesize backgroundImageView = _backgroundImageView;


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
    
    FileFinder *fileFinder = [FileFinder fileFinder];
    _backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"Login_bgs.png"]];
    /*
#ifdef DEBUG
    self.accountTextFiled.text=@"james1";
    self.passwordTextField.text=@"pweptd11";
#endif
    */
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //except upside down
    //return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

//override method from super class
-(void)LogMe
{
    NSLog(@"Phone log in class LogMe");
}

#pragma mark - AsyncSocket delegate
-(void)AsyncSocket:(AsyncSocket *)socket didLoginWithUsername:(NSString *)username andPassword:(NSString *)password
{
    
    [super AsyncSocket:socket didLoginWithUsername:username andPassword:password];
}

#pragma mark ServerInterface delegate
-(void)ServerInterface:(ServerInterface *)interFace didConnectToHost:(NSString *)hostname onPort:(uint16_t)port
{
    NSLog(@"did connect to host:%@ on Port:%u", hostname, port);
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

-(void)ServerInterface:(ServerInterface *)interFace didLoginWithUsername:(NSString *)username andPassword:(NSString *)password
{
    [super ServerInterface:interFace didLoginWithUsername:username andPassword:password];
    
    /*if([_theDelegate respondsToSelector:@selector(PadLoginViewControllerDidLogin:)])
    {
        [_theDelegate PadLoginViewControllerDidLogin:self];
    }*/
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

@end

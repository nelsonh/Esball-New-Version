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
-(IBAction)login:(id)sender
{
    [super login:sender];
    
}

#pragma mark - AsyncSocket delegate
-(void)AsyncSocket:(AsyncSocket *)socket didLoginWithUsername:(NSString *)username andPassword:(NSString *)password
{
    [super AsyncSocket:socket didLoginWithUsername:username andPassword:password];
}

#pragma mark ServerInterface delegate
-(void)ServerInterface:(ServerInterface *)interface didConnectToHost:(NSString *)hostname onPort:(uint16_t)port
{
    NSLog(@"did connect to host:%@ on Port:%u", hostname, port);
}

-(void)ServerInterface:(ServerInterface *)interface didLoginWithUsername:(NSString *)username andPassword:(NSString *)password
{
    [super ServerInterface:interface didLoginWithUsername:username andPassword:password];
    
    
    if([_theDelegate respondsToSelector:@selector(PadLoginViewControllerDidLogin:)])
    {
        [_theDelegate PadLoginViewControllerDidLogin:self];
    }
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

//test delegate
-(void)ServerInterface:(ServerInterface *)interface didReceivedRespond:(NSString *)respondStr
{
    //NSLog(@"userinfo:\n%@\n\n", respondStr);

    //XMLParser *paser = [[XMLParser alloc] initXMLParser];
    //[paser paserXMLWithString:respondStr];
    
    /*
    NSData *data = [respondStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data options:0 error:&error];
    
    if(doc==nil)
    {
        NSLog(@"error:%@", error);
    }
     */
     
    /*
     //testfile.xml
    NSString *path = [[NSBundle mainBundle] pathForResource:@"testfile" ofType:@"xml"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data options:0 error:&error];
    
    if(doc == nil)
    {
        NSLog(@"error:%@", error);
    }
     */
}
    

/*
//override method from super class
-(void)LogMe
{
    NSLog(@"Pad log in class LogMe");
}
 */

@end

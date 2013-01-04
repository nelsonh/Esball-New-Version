//
//  ViewController.m
//  ESBall
//
//  Created by nelson on 12/11/14.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import "BaseLoginViewController.h"
#import "AsyncSocket.h"


@interface BaseLoginViewController ()

@end

@implementation BaseLoginViewController


@synthesize accountTextFiled = _accountTextFiled;
@synthesize passwordTextField = _passwordTextField;
@synthesize accountLabel = _accountLabel;
@synthesize passwordLabel = _passwordLabel;

-(void)loadView
{
    [super loadView];
    
    
    //ServerInterface establish connection
    ServerInterface *interface = [ServerInterface serverInterface];
    interface.theDelegate = self;
    
    isLogin = NO;
    reservingSpot= NO;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ReserveSpotSuccessNotification object:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    spaceLabelToTextfield = _accountTextFiled.frame.origin.x - (_accountLabel.frame.origin.x+_accountLabel.frame.size.width);
    
    //load last user login account
    NSString *account = [[NSUserDefaults standardUserDefaults] objectForKey:LastUserLoginAccount];
    _accountTextFiled.text = account;
    
    _accountTextFiled.delegate = self;
    _passwordTextField.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reserveSpotSuccess:) name:ReserveSpotSuccessNotification object:nil];
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //all orientation
    return YES;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration
{
    //tell label to scale width and height to fit the content
    [_accountLabel sizeToFit];
    [_passwordLabel sizeToFit];
    
    CGRect accountLabelFrame = _accountLabel.frame;
    CGRect passwordLabelFrame = _passwordLabel.frame;
    CGFloat accountTextField_X = _accountTextFiled.frame.origin.x;
    CGFloat passwordTextField_X = _passwordTextField.frame.origin.x;
    CGFloat accountLabelWidth = _accountLabel.frame.size.width;
    CGFloat passwordLabelWidth = _passwordLabel.frame.size.width;
    
    //new x position for label
    CGFloat xPosForAccountLabel = (accountTextField_X - spaceLabelToTextfield) - accountLabelWidth;
    CGFloat xPosForPasswordLabel = (passwordTextField_X - spaceLabelToTextfield) - passwordLabelWidth;
    
    //create new rect for label
    CGRect newFrameForAccountLabel = CGRectMake(xPosForAccountLabel, accountLabelFrame.origin.y, accountLabelFrame.size.width, accountLabelFrame.size.height);
    CGRect newFrameForPasswordLabel = CGRectMake(xPosForPasswordLabel, passwordLabelFrame.origin.y, passwordLabelFrame.size.width, passwordLabelFrame.size.height);
    
    //assign new frame to label
    _accountLabel.frame = newFrameForAccountLabel;
    _passwordLabel.frame = newFrameForPasswordLabel;
}

#pragma mark - public interface
-(IBAction)login:(id)sender
{
    if(isLogin)
        return;
    
    [_accountTextFiled resignFirstResponder];
    [_passwordTextField resignFirstResponder];
    
    if([_accountTextFiled.text isEqualToString:@""] || [_passwordTextField.text isEqualToString:@""])
    {
        NSString *title = NSLocalizedString(@"", @"");
        NSString *msg = NSLocalizedString(@"帐号或密码不得为空白", @"帐号或密码不得为空白");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:NSLocalizedString(@"确定", @"确定") otherButtonTitles: nil];
        [alertView show];
        
        return;
    }
    
    //ServerInterFace
    ServerInterface *interface = [ServerInterface serverInterface];
    [interface loginWithUserName:_accountTextFiled.text andPassword:_passwordTextField.text];
    
    _accountTextFiled.enabled = NO;
    _passwordTextField.enabled = NO;
    
    isLogin = YES;
    
    /*
    //AsyncSocket
    AsyncSocket *socket = [AsyncSocket asyncSocket];
    socket.theDelegate = self;
    [socket getID];
    sleep(1);
    [socket loginWithUsername:_accountTextFiled.text andPassword:_passwordTextField.text];
     */
    
    

     
}

-(void)reserveSpot
{
    //start point to reserve spot
    //reserving spot step 1
    ServerInterface *theInterface = [ServerInterface serverInterface];
    NSString *msg = @"turn\n";
    [theInterface sendDataToServerWithData:[msg dataUsingEncoding:NSASCIIStringEncoding]];
    
    msg = [NSString stringWithFormat:@"%i\n", 0];
    [theInterface sendDataToServerWithData:[msg dataUsingEncoding:NSASCIIStringEncoding]];
    reservingSpot = YES;
    
}

-(void)reserveSpotSuccess:(NSNotification *)notification
{
    //subclass must overried this method to receive reserving spot notification 
}

/*
#pragma mark - AsyncSocket delegate
-(void)AsyncSocket:(AsyncSocket *)socket didLoginWithUsername:(NSString *)username andPassword:(NSString *)password
{
 
    if(reservingSpot)
    {
        ServerInterface *theInterface = [ServerInterface serverInterface];
        //inform server we need user information
        NSString *getUserInfoMsg = @"login\n";
        [theInterface sendDataToServerWithData:[getUserInfoMsg dataUsingEncoding:NSASCIIStringEncoding]];
        
        
        getUserInfoMsg = [NSString stringWithFormat:@"%i\n", 3001];
        [theInterface sendDataToServerWithData:[getUserInfoMsg dataUsingEncoding:NSASCIIStringEncoding]];
    }
    else
    {
        NSLog(@"Login successful");
        
        NSString *account = self.accountTextFiled.text;
        
        //save user accout
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setValue:account forKey:LastUserLoginAccount];
        [userDefault synchronize];
    }

}
 */

#pragma mark ServerInterface delegate
-(void)ServerInterface:(ServerInterface *)interface didReceivedRespond:(NSString *)respondStr
{
    /**
     for reserving spot
     **/
    if([respondStr rangeOfString:@"onLogin"].length > 0)
    {
        //reserving spot step 3
        ServerInterface *theInterface = [ServerInterface serverInterface];
        NSString *tablelistMsg = @"tableList\n";
        [theInterface sendDataToServerWithData:[tablelistMsg dataUsingEncoding:NSASCIIStringEncoding]];
        
        tablelistMsg = [NSString stringWithFormat:@"%i\n", 3001];
        [theInterface sendDataToServerWithData:[tablelistMsg dataUsingEncoding:NSASCIIStringEncoding]];
    }
    else if([respondStr rangeOfString:@"onTableList"].length>0)
    {
        //reserving spot step 4
        ServerInterface *theInterface = [ServerInterface serverInterface];
        
        NSString *getUpdateMsg = @"videoLink\n";
        [theInterface sendDataToServerWithData:[getUpdateMsg dataUsingEncoding:NSASCIIStringEncoding]];
        
        getUpdateMsg = [NSString stringWithFormat:@"%i\n", 3001];
        [theInterface sendDataToServerWithData:[getUpdateMsg dataUsingEncoding:NSASCIIStringEncoding]];
        
        getUpdateMsg = [NSString stringWithFormat:@"%i\n", 0];
        [theInterface sendDataToServerWithData:[getUpdateMsg dataUsingEncoding:NSASCIIStringEncoding]];
    }
    else if([respondStr rangeOfString:@"onUpdate"].length>0)
    {
        //reserving spot step 5
        ServerInterface *theInterface = [ServerInterface serverInterface];
        theInterface.theDelegate= nil;
        
        //send notification that reserving spot success
        [[NSNotificationCenter defaultCenter] postNotificationName:ReserveSpotSuccessNotification object:nil];
    }
    
    
}

-(void)ServerInterface:(ServerInterface *)interface didConnectToHost:(NSString *)hostname onPort:(uint16_t)port
{
    
}

-(void)ServerInterface:(ServerInterface *)interface didLoginWithUsername:(NSString *)username andPassword:(NSString *)password
{
    //if we are reserving spot
    if(reservingSpot)
    {
        //reserving spot step 2
        ServerInterface *theInterface = [ServerInterface serverInterface];
        //inform server we need user information
        NSString *getUserInfoMsg = @"login\n";
        [theInterface sendDataToServerWithData:[getUserInfoMsg dataUsingEncoding:NSASCIIStringEncoding]];
        
        
        getUserInfoMsg = [NSString stringWithFormat:@"%i\n", 3001];
        [theInterface sendDataToServerWithData:[getUserInfoMsg dataUsingEncoding:NSASCIIStringEncoding]];
        
        return;
    }
    
    //Login
    NSLog(@"did login server");
    
    isLogin = NO;
    
    NSString *account = self.accountTextFiled.text;
    
    //save user accout
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setValue:account forKey:LastUserLoginAccount];
    [userDefault synchronize];
    
    _accountTextFiled.enabled = YES;
    _passwordTextField.enabled = YES;
    
    //if we are not reserving spot reserve one
    if(!reservingSpot)
        [self reserveSpot];
}

-(void)ServerInterface:(ServerInterface *)interface errorOccurredWithError:(NSString *)errorMsg
{
    
    isLogin = NO;
    
    _accountTextFiled.enabled = YES;
    _passwordTextField.enabled = YES;
    
}

#pragma mark - UITextField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_accountTextFiled resignFirstResponder];
    [_passwordTextField resignFirstResponder];
    
    return YES;
}


/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"segue id:%@", segue.identifier);
    
    [self LogMe];
}

-(void)LogMe
{
    NSLog(@"Base log in class LogMe");
}
 */

@end

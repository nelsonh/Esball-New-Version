//
//  ViewController.h
//  ESBall
//
//  Created by nelson on 12/11/14.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

/*
 * Login class
 */

#import <UIKit/UIKit.h>
#import "AsyncSocket.h"
#import "AppDelegate.h"
#import "ServerInterface.h"

/*
 * Pre-define string
 */
__unused static NSString *ReserveSpotSuccessNotification = @"ReserveSpotSuccess";

@interface BaseLoginViewController : UIViewController<AsyncSocketDelegate, ServerInterfaceDelegate, UITextFieldDelegate>{
    
    //used to adjust label
    CGFloat spaceLabelToTextfield;
    
    //indicate it is during the login or not
    BOOL isLogin;
    
    //indicate that it is reserving spot on host server or not
    BOOL reservingSpot;
}

@property (nonatomic, weak) IBOutlet UITextField *accountTextFiled;//textfield for input account
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;//textfield for input password
@property (nonatomic, weak) IBOutlet UILabel *accountLabel;
@property (nonatomic, weak) IBOutlet UILabel *passwordLabel;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicator;//spinning indicator
@property (nonatomic, weak) IBOutlet UILabel *loggingMsgLabel;

//base method override if needed
//-(void)LogMe;

/**
 * A back button which is connected in Interface Builder
 * Trigger login event
 */
-(IBAction)login:(id)sender;

/**
 * A method to reserve a spot on host server
 */
-(void)reserveSpot;

/**
 * A method get call when reserve spot on server success
 *
 * @param notification not use
 */
-(void)reserveSpotSuccess:(NSNotification *)notification;

/**
 * A method to show up login spin indicator and message
 */
-(void)showLoginIndicator;

/**
 * A method to hide login spin indicator and message
 */
-(void)hideLoginIndicator;

@end

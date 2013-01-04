//
//  ViewController.h
//  ESBall
//
//  Created by nelson on 12/11/14.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncSocket.h"
#import "AppDelegate.h"
#import "ServerInterface.h"

static NSString *ReserveSpotSuccessNotification = @"ReserveSpotSuccess";

@interface BaseLoginViewController : UIViewController<AsyncSocketDelegate, ServerInterfaceDelegate, UITextFieldDelegate>{
    
    CGFloat spaceLabelToTextfield;
    BOOL isLogin;
    BOOL reservingSpot;//indicate that it is reserving spot or not
}

@property (nonatomic, weak) IBOutlet UITextField *accountTextFiled;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet UILabel *accountLabel;
@property (nonatomic, weak) IBOutlet UILabel *passwordLabel;

//base method override if needed
//-(void)LogMe;

-(IBAction)login:(id)sender;
//to reserve a spot
-(void)reserveSpot;
//implement to receive reserving spot notification
-(void)reserveSpotSuccess:(NSNotification *)notification;

@end

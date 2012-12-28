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

@interface BaseLoginViewController : UIViewController<AsyncSocketDelegate, ServerInterfaceDelegate, UITextFieldDelegate>{
    
    CGFloat spaceLabelToTextfield;
    BOOL isLogin;
}

@property (nonatomic, weak) IBOutlet UITextField *accountTextFiled;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet UILabel *accountLabel;
@property (nonatomic, weak) IBOutlet UILabel *passwordLabel;

//base method override if needed
//-(void)LogMe;

-(IBAction)login:(id)sender;

@end

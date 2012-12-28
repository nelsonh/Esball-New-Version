//
//  BaseViewController.h
//  ESBall
//
//  Created by Nelson on 12/11/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerInterface.h"

@interface BaseViewController : UIViewController

-(void)connectionLost:(NSNotification *)notification;

@end

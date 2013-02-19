//
//  BaseViewController.h
//  ESBall
//
//  Created by Nelson on 12/11/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerInterface.h"

/**
 * BaseViewController subclass of UIViewController
 * a main view and very first controller after app has finish launched
 */
@interface BaseViewController : UIViewController

/**
 * A method get call when ServerInterface lost socket connection and post notification
 *
 * 當 ServerInterface 失去連線會呼叫此方法
 *
 * @param notification did not contain any information
 */
-(void)connectionLost:(NSNotification *)notification;

@end

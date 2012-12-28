//
//  PadViewController.h
//  ESBall
//
//  Created by Nelson on 12/11/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "BaseViewController.h"
#import "PadLoginViewController.h"
#import "PadMainViewController.h"

@interface PadViewController : BaseViewController<PadLoginViewControllerDelegate>{
    
    BOOL firstLaunch;
}

@end

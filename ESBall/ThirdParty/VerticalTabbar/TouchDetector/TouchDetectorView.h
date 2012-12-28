//
//  TouchDetectorView.h
//  ESBall
//
//  Created by Nelson on 12/14/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchDetector.h"

@class TouchDetectorView;

@protocol TouchDetectorViewDelegate <NSObject>

-(void)TouchDetectorViewDidReceiveTouchupInsideEvent:(TouchDetectorView *)view;

@end

@interface TouchDetectorView : UIView<TouchDetectorDelegate>

@property (nonatomic, weak) id<TouchDetectorViewDelegate> theDelegate;

@end

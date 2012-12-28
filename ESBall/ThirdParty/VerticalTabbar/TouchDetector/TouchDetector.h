//
//  TouchDetector.h
//  ESBall
//
//  Created by Nelson on 12/14/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TouchDetector;

@protocol TouchDetectorDelegate <NSObject>

-(void)TouchDetectorTouchEnd:(TouchDetector *)touchDetector;

@end

@interface TouchDetector : UIGestureRecognizer

@property (nonatomic, weak) id<TouchDetectorDelegate> theDelegate;

@end

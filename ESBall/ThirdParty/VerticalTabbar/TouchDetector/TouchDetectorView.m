//
//  TouchDetectorView.m
//  ESBall
//
//  Created by Nelson on 12/14/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "TouchDetectorView.h"

@implementation TouchDetectorView

@synthesize theDelegate = _theDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        TouchDetector *touchDetector = [[TouchDetector alloc] init];
        touchDetector.theDelegate = self;
        [self addGestureRecognizer:touchDetector];
    }
    return self;
}

#pragma mark - TouchDetector delegate
-(void)TouchDetectorTouchEnd:(TouchDetector *)touchDetector
{
    if([_theDelegate respondsToSelector:@selector(TouchDetectorViewDidReceiveTouchupInsideEvent:)])
    {
        [_theDelegate TouchDetectorViewDidReceiveTouchupInsideEvent:self];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

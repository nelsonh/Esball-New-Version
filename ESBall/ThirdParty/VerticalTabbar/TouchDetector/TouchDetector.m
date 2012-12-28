//
//  TouchDetector.m
//  ESBall
//
//  Created by Nelson on 12/14/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "TouchDetector.h"

@implementation TouchDetector

@synthesize theDelegate = _theDelegate;

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    /**check if only touch up inside the view**/
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    CGRect rect = self.view.bounds;
    
    //only inform if it is touch up inside
    if(CGRectContainsPoint(rect, location))
        [_theDelegate TouchDetectorTouchEnd:self];
}

@end

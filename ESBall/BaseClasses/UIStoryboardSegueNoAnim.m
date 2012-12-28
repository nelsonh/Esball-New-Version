//
//  UIStoryboardSegueNoAnim.m
//  ESBall
//
//  Created by Nelson on 12/11/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "UIStoryboardSegueNoAnim.h"

@implementation UIStoryboardSegueNoAnim

- (void)perform {
    
    [self.sourceViewController presentModalViewController:self.destinationViewController animated:NO];
}

@end

//
//  MiniInfoView.m
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "MiniInfoView.h"

@implementation MiniInfoView

@synthesize visibility = _visibility;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.hidden = YES;
    }
    return self;
}



-(void)updateView
{
    
}

#pragma mark - getter setter
-(void)setVisibility:(BOOL)visibility
{
    self.hidden = !visibility;
}

-(BOOL)visibility
{
    return !self.hidden;
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

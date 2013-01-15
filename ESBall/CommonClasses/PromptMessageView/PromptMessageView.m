//
//  PromptMessageView.m
//  ESBall
//
//  Created by Nelson on 1/15/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "PromptMessageView.h"

@implementation PromptMessageView

@synthesize promptMsgBackgroundView = _promptMsgBackgroundView;
@synthesize promptMsgLabel = _promptMsgLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)updateWithMessage:(NSString *)msg
{
    _promptMsgLabel.text = msg;
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

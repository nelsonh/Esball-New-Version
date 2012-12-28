//
//  PadDragonTigerPokerView.m
//  ESBall
//
//  Created by Nelson on 12/27/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "PadDragonTigerPokerView.h"

@implementation PadDragonTigerPokerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - override
-(void)awakeFromNib
{
    [super awakeFromNib];
    
    FileFinder *fileFinder = [FileFinder fileFinder];
    self.backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"DTdeal_bg@2x.png"]];
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

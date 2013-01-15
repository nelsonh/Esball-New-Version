//
//  PhoneBaccaratRoadmapView.m
//  ESBall
//
//  Created by mobile on 13/1/8.
//  Copyright (c) 2013年 nelson. All rights reserved.
//

#import "PhoneBaccaratRoadmapView.h"

@implementation PhoneBaccaratRoadmapView

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
    self.backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"Route_bgs.png"]];
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

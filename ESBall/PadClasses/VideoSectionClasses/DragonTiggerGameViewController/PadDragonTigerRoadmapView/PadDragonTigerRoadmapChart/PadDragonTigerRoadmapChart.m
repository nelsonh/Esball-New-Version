//
//  PadDragonTigerRoadmapChart.m
//  ESBall
//
//  Created by Nelson on 1/2/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "PadDragonTigerRoadmapChart.h"

@implementation PadDragonTigerRoadmapChart

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(CGFloat)roadmapChartWidth
{
    return kRoadmapWidth;
}

-(CGFloat)roadmapChartHeight
{
    return kRoadmapHeight;
}

-(NSString *)roadmapBaseImageName
{
    return @"Route_bg2@2x.png";
}

-(NSString *)playerImageName
{
    return @"rou_R_big.png";
}

-(NSString *)bankerImageName
{
    return @"rou_B_big.png";

}

-(NSString *)dtPlayerImageName
{
    return @"DTrou_Y_big.png";
}

-(NSString *)dtBankerImageName
{
    return @"DTrou_R_big.png";
}

-(NSString *)tie1ImageName
{
    return @"rou_Tie_01.png";
}

-(NSString *)tie2ImageName
{
    return @"rou_Tie_02.png";
}

-(NSString *)tie3ImageName
{
    return @"rou_Tie_03.png";
}

-(NSString *)smallPlayerImageName
{
    //return @"DTrou_Y_small2.png";
    return @"rou_R_small2.png";
}

-(NSString *)smallBankerImageName
{
    //return @"DTrou_R_small2.png";
    return @"rou_B_small2.png";
}

-(NSString *)zingPlayerImageName
{
    //return @"DTrou_Y_ob.png";
    return @"rou_R_ob.png";
}

-(NSString *)zingBankerImageName
{
    //return @"DTrou_R_ob.png";
    return @"rou_B_ob.png";
}

@end

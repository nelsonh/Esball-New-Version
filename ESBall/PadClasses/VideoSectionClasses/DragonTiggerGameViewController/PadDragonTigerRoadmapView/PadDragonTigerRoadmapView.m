//
//  PadDragonTigerRoadmapView.m
//  ESBall
//
//  Created by Nelson on 12/27/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "PadDragonTigerRoadmapView.h"

@implementation PadDragonTigerRoadmapView


#pragma mark - override
-(void)awakeFromNib
{
    [super awakeFromNib];
    
    FileFinder *fileFinder = [FileFinder fileFinder];
    self.backgroundImageView.image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"DTRoute_bg@2x.png"]];
}

@end

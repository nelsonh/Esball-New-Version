//
//  SBRoadmapCell.m
//  ESBall
//
//  Created by Nelson on 1/18/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "SBRoadmapCell.h"

@implementation SBRoadmapCell

@synthesize diceLabel = _diceLabel;
@synthesize sumLabel = _sumLabel;
@synthesize bigOrSmallLabel = _bigOrSmallLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithReuseIdentifier:(NSString *)identifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    if(self)
    {
        
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

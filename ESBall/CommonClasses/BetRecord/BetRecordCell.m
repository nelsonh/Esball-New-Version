//
//  BetRecordCell.m
//  ESBall
//
//  Created by Nelson on 1/8/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "BetRecordCell.h"
#import "FileFinder.h"

@implementation BetRecordCell

@synthesize roundSerialLabel = _roundSerialLabel;
@synthesize bankerPointLabel = _bankerPointLabel;
@synthesize playerPointLabel = _playerPointLabel;
@synthesize totalBetLabel = _totalBetLabel;
@synthesize totalPayoffLabel = _totalPayoffLabel;
@synthesize defaultBackgroundImageName = _defaultBackgroundImageName;
@synthesize cellX = _cellX;
@synthesize cellWidth = _cellWidth;


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
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    
    if(self)
    {
         // Initialization code
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
}

-(void)prepareForReuse
{
    
    [self setSelected:NO];
    [self setHighlighted:NO];
    self.selectedBackgroundView = nil;
    self.backgroundView = nil;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    CGRect newRect = self.frame;
    
    if(_cellX != 0.0f)
    {
        newRect.origin.x = _cellX;
    }
    
    if(_cellWidth != 0.0f)
    {
        newRect.size.width = _cellWidth;
    }
    
    
    self.frame= newRect;
}

@end

//
//  SBBetRecordCell.m
//  ESBall
//
//  Created by Nelson on 3/12/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "SBBetRecordCell.h"

@implementation SBBetRecordCell

@synthesize amountOfBetLabel = _amountOfBetLabel;
@synthesize diceStringLabel = _diceStringLabel;
@synthesize diceImageView = _diceImageView;

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

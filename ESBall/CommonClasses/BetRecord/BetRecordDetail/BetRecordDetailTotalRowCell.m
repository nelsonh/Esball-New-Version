//
//  BetRecordDetailTotalRowCell.m
//  ESBall
//
//  Created by Nelson on 1/9/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "BetRecordDetailTotalRowCell.h"

@implementation BetRecordDetailTotalRowCell

@synthesize totalbetLabel = _totalbetLabel;
@synthesize totalPayoffLabel = _totalPayoffLabel;

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

-(void)prepareForReuse
{
    //reset color
    _totalPayoffLabel.textColor = [UIColor blackColor];
}

@end

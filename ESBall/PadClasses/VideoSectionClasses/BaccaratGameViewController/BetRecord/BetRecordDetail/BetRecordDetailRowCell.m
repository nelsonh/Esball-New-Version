//
//  BetRecordDetailRowCell.m
//  ESBall
//
//  Created by Nelson on 1/9/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "BetRecordDetailRowCell.h"

@implementation BetRecordDetailRowCell

@synthesize characterTypeLabel = _characterTypeLabel;
@synthesize proportionLabel = _proportionLabel;
@synthesize totalBetLabel = _totalBetLabel;
@synthesize totalPayoffLabel = _totalPayoffLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

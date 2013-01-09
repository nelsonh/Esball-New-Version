//
//  BetRecordCell.m
//  ESBall
//
//  Created by Nelson on 1/8/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "BetRecordCell.h"

@implementation BetRecordCell

@synthesize theDelegate = _theDelegate;

@synthesize roundSerialLabel = _roundSerialLabel;
@synthesize bankerLabel = _bankerLabel;
@synthesize playerLabel = _playerLabel;
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
    //prevent call twice
    if(self.selected == selected)
        return;
    
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    if(selected)
    {
        if([_theDelegate respondsToSelector:@selector(BetRecordCellDidSelected:)])
        {
            [_theDelegate BetRecordCellDidSelected:self];
        }
    }
}

@end

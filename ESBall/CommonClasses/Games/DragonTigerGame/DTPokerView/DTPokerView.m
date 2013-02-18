//
//  DTPokerView.m
//  ESBall
//
//  Created by Nelson on 12/21/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "DTPokerView.h"

@interface DTPokerView ()



@end

@implementation DTPokerView

@synthesize dragonCard = _dragonCard;
@synthesize tigerCard = _tigerCard;
@synthesize dragonPoint = _dragonPoint;
@synthesize tigerPoint = _tigerPoint;
@synthesize backgroundImageView = _backgroundImageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
}

#pragma mark - override methods
-(void)updateView
{
    //clean text
    _tigerPointLabel.text = nil;
    _dragonPointLabel.text = nil;
    
    if(!_cardImages)
        return;
    
    //update card
    for (int i = 0; i < [_cardImages count]; i++)
    {
        
        NSString *cardName = [_cardImages objectAtIndex:i];
        NSString *cardImageName;
        UIImage *image;
        
        if([cardName isEqualToString:@""])
        {
            image = nil;
        }
        else
        {
            FileFinder *fileFinder = [FileFinder fileFinder];
            cardImageName = [NSString stringWithFormat:@"%@.png", cardName];
            image = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:cardImageName]];
        }
        
        switch (i)
        {
            case 0:
                _dragonCard.image = image;
                break;
            case 1:
                _tigerCard.image = image;
                break;
            default:
                break;
        }
    }
    
    //update point label
    if(_tigerPoint != 0)
        _tigerPointLabel.text = [NSString stringWithFormat:@"%i", _tigerPoint];
    if(_dragonPoint != 0)
        _dragonPointLabel.text = [NSString stringWithFormat:@"%i", _dragonPoint];
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

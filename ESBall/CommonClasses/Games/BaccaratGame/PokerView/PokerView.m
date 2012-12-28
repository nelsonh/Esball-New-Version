//
//  PokerView.m
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "PokerView.h"


@interface PokerView ()



@end

@implementation PokerView

@synthesize cardImages = _cardImages;
@synthesize topLeftCard = _topLeftCard;
@synthesize topMiddleCard = _topMiddleCard;
@synthesize topRightCard = _topRightCard;
@synthesize buttomLeftCard = _buttomLeftCard;
@synthesize buttomMiddleCard = _buttomMiddleCard;
@synthesize buttomRightCard = _buttomRightCard;
@synthesize bankerPoint = _bankerPoint;
@synthesize playerPoint = _playerPoint;
@synthesize backgroundImageView = _backgroundImageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)dealloc
{
    NSLog(@"poker view dealloc");
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
}

#pragma mark - override methods
-(void)updateView
{
    
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
                _buttomLeftCard.image = image;
                break;
            case 1:
                _topLeftCard.image = image;
                break;
            case 2:
                _buttomMiddleCard.image = image;
                break;
            case 3:
                _topMiddleCard.image = image;
                break;
            case 4:
                _buttomRightCard.image = image;
                break;
            case 5:
                _topRightCard.image = image;
                break;
            default:
                break;
        }
    }
    
    //update point label
    _bankerPointLabel.text = [NSString stringWithFormat:@"%i", _bankerPoint];
    _playerPointLabel.text = [NSString stringWithFormat:@"%i", _playerPoint];
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

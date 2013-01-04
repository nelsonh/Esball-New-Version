//
//  ChipView.m
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "ChipView.h"

/*
#define kSpaceWidth 12
#define kSpaceHeight 5
#define kChipSizeWidth 78
*/

@interface ChipView ()

-(void)createChips;
-(CGSize)findContentSize;

@end

@implementation ChipView

@synthesize theDelegate = _theDelegate;
@synthesize chips = _chips;
@synthesize chipSpaceWidth = _chipSpaceWidth;
@synthesize chipSpaceHeight = _chipSpaceHeight;
@synthesize chipSize = _chipSize;

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
    for(Chip *chip in chipList)
    {
        [chip removeFromSuperview];
    }
}



#pragma mark - create chip
-(void)createChips
{
    chipList = [[NSMutableArray alloc] init];
    
    for(NSString *chipName in _chips)
    {
        Chip *chip = [Chip buttonWithType:UIButtonTypeCustom andChipImageName:chipName];
        chip.theDelegate = self;
        chip.chipValue = [chipName floatValue];
        
        /*
        NSString *chipDownImageName = [NSString stringWithFormat:@"chip_%@_down.png", chipName];
        NSString *chipNoImageName = [NSString stringWithFormat:@"chip_%@_no.png", chipName];
        NSString *chipNormalImageName = [NSString stringWithFormat:@"chip_%@.png", chipName];
        UIImage *imageForDown = [UIImage imageNamed:chipDownImageName];
        UIImage *imageForNo = [UIImage imageNamed:chipNoImageName];
        UIImage *imageForNormal = [UIImage imageNamed:chipNormalImageName];
        
        [chip setImage:imageForDown forState:UIControlStateHighlighted];
        [chip setImage:imageForNo forState:UIControlStateDisabled];
        [chip setImage:imageForNormal forState:UIControlStateNormal];
        */
        
        [chipList addObject:chip];
        
    }
    
    isChipsEnabled = YES;
}

#pragma mark - chip display
-(CGSize)findContentSize
{
    /*
    //origin implement
    CGFloat contentWidth;
    CGFloat contentHeight;
    CGFloat viewHeight = self.frame.size.height-10;
    
    contentWidth = ([chipList count] * sizeOfChip) + (([chipList count] + 1) * spaceWidthOfChip);
    contentHeight = viewHeight + (2 * spaceHeightOfChip);
    
    return CGSizeMake(contentWidth, contentHeight);
    */
    
    CGFloat contentWidth;
    CGFloat contentHeight;
    CGFloat viewHeight = self.frame.size.height;
    
    contentWidth = ([chipList count] * viewHeight) + (([chipList count] + 1) * spaceWidthOfChip);
    contentHeight = viewHeight;
    
    return CGSizeMake(contentWidth, contentHeight);
}

-(BOOL)displayChips
{
    /**
     chip view creation logic
     **/
#ifdef DEBUG
    NSLog(@"chips:%@", _chips);
#endif
    
    if(!_chips)
    {
        return NO;
    }
    
    CGFloat viewHeight = self.frame.size.height;
    
    [self createChips];
    //[self findContentSize];
    
    self.contentSize = [self findContentSize];
    
    for(int i = 0; i < [chipList count]; i++)
    {
        Chip *theChip = [chipList objectAtIndex:i];
        CGRect newChipFrame;
        CGFloat xPos;
        CGFloat yPos;
        
        xPos = (i*viewHeight) + ((i+1)*spaceWidthOfChip);
        yPos = spaceHeightOfChip;
        
        //newChipFrame = CGRectMake(xPos, yPos, sizeOfChip, viewHeight);
        newChipFrame = CGRectMake(xPos, yPos, self.frame.size.height, viewHeight-2);
        
        theChip.frame = newChipFrame;
        
        [self addSubview:theChip];
    }
    
    return YES;
}

#pragma mark - chip disable enable
-(void)disableCips
{
    if(!isChipsEnabled)
        return;
    
    for(Chip *chip in chipList)
    {
        [chip setUserInteractionEnabled:NO];
        [chip disable];
    }
    
    isChipsEnabled = NO;
}

-(void)enableChips
{
    if(isChipsEnabled == YES)
        return;
    
    for(Chip *chip in chipList)
    {
        [chip setUserInteractionEnabled:YES];
        [chip enable];
    }
    
    isChipsEnabled = YES;
}

-(void)enableChipsWithSelectedChip:(Chip *)selectedChip
{
    if(isChipsEnabled == YES)
        return;
    
    for(Chip *chip in chipList)
    {
        [chip setUserInteractionEnabled:YES];
        [chip enable];
        
        if(chip == selectedChip)
        {
            [chip select];
        }
    }
    
    isChipsEnabled = YES;
}

#pragma mark - getter setter
-(void)setChipSpaceWidth:(CGFloat)chipSpaceWidth
{
    spaceWidthOfChip = chipSpaceWidth;
}

-(void)setChipSpaceHeight:(CGFloat)chipSpaceHeight
{
    spaceHeightOfChip = chipSpaceHeight;
}

-(void)setChipSize:(CGFloat)chipSize
{
    sizeOfChip = chipSize;
}

#pragma mark - Chip delegate
-(void)ChipDidTapped:(Chip *)chip
{
    if([_theDelegate respondsToSelector:@selector(ChipView:aChipTapped:)])
    {
        [_theDelegate ChipView:self aChipTapped:chip];
    }
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

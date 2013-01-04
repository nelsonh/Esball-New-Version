//
//  BetAreaView.m
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "BetAreaView.h"

@interface BetAreaView ()

-(void)setupChipView;

@end

@implementation BetAreaView

@synthesize chips = _chips;
@synthesize chipListView = _chipListView;
@synthesize updateInfo = _updateInfo;
@synthesize userInfo = _userInfo;
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
    if(selectedChip)
        selectedChip = nil;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    isChipViewSetup = NO;
    
    isSpaceWidthOfChipSet = NO;
    isSpaceHeightOfChipSet = NO;
    isSizeOfChipSet = NO;
    
    isInternalErrorShow = NO;
    
    return [super initWithCoder:aDecoder];
}

#pragma mark - internal
-(void)setupChipView
{
    if(isSpaceWidthOfChipSet && isSpaceHeightOfChipSet && isSizeOfChipSet)
    {
        //if chip view need to setup
        if(!isChipViewSetup)
        {
            _chipListView.theDelegate = self;
            
            //setup chip view
            _chipListView.chipSpaceWidth = _chipSpaceWidth;
            _chipListView.chipSpaceHeight = _chipSpaceHeight;
            _chipListView.chipSize = _chipSize;
            _chipListView.chips = self.chips;
            
            //dispaly chip view
            if([_chipListView displayChips])
            {
                //disable at first place
                [_chipListView disableCips];
                
                isChipViewSetup = YES;
            }
            else
            {
                isChipViewSetup = NO;
            }
        }
    }
    else
    {
#ifdef DEBUG
        if(isInternalErrorShow)
            return;
            
        InternalErrorAlert(self, @"Internal error", @"Unable to show chip view\n Property of ChipSpaceWidth or ChipSpaceHeight or ChipSize was not given");
        
        isInternalErrorShow = YES;
#endif
    }

}

#pragma mark - public interface
-(void)updateView
{
    [self setupChipView];
    
    //deal with chip view
    if([_updateInfo.status isEqualToString:@"dealing"] || [_updateInfo.status isEqualToString:@"waiting"])
    {
        [_chipListView disableCips];
        
        self.userInteractionEnabled = NO;
    }
    else if([_updateInfo.status isEqualToString:@"betting"])
    {
        if(selectedChip)
            [_chipListView enableChipsWithSelectedChip:selectedChip];
        else
            [_chipListView enableChips];
        
        self.userInteractionEnabled = YES;
    }
}

#pragma mark - getter setter
-(void)setChipSpaceWidth:(CGFloat)chipSpaceWidth
{
    _chipSpaceWidth = chipSpaceWidth;
    isSpaceWidthOfChipSet = YES;
}

-(void)setChipSpaceHeight:(CGFloat)chipSpaceHeight
{
    _chipSpaceHeight = chipSpaceHeight;
    isSpaceHeightOfChipSet = YES;
}

-(void)setChipSize:(CGFloat)chipSize
{
    _chipSize = chipSize;
    isSizeOfChipSet = YES;
}

#pragma mark - ChipView delegate
-(void)ChipView:(ChipView *)chipView aChipTapped:(Chip *)chip
{
    if(selectedChip && selectedChip != chip)
        [selectedChip deselect];
    
    selectedChip = chip;
    
    NSLog(@"chip value:%f", selectedChip.chipValue);
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

//
//  ChipView.h
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

/**
 ChipView
 responsible for chips' display, enable, disable
 hold number of chip object
 
**/

#import <UIKit/UIKit.h>
#import "Chip.h"

@class ChipView;

@protocol ChipViewDelegate <NSObject>

@optional
-(void)ChipView:(ChipView *)chipView aChipTapped:(Chip *)chip;

@end
@interface ChipView : UIScrollView<ChipDelegate>{
    
    //hold chips object
    NSMutableArray *chipList;
    BOOL isChipsEnabled;
    
    //chip space width from border, chip space hieght from border, chip size
    CGFloat spaceWidthOfChip;
    CGFloat spaceHeightOfChip;
    CGFloat sizeOfChip;

    
}

@property (nonatomic, weak) id<ChipViewDelegate> theDelegate;
//hold chips name must assign before call display chip
@property (nonatomic, copy) NSArray *chips;
@property (nonatomic, readwrite) CGFloat chipSpaceWidth;
@property (nonatomic, readwrite) CGFloat chipSpaceHeight;
@property (nonatomic, readwrite) CGFloat chipSize;

-(BOOL)displayChips;
-(void)disableCips;
-(void)enableChips;
-(void)enableChipsWithSelectedChip:(Chip *)selectedChip;

@end

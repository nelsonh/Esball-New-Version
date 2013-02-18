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

/*
 * A protocol of ChipView
 */
@protocol ChipViewDelegate <NSObject>

@optional

/*
 * Fire when any of chip tapped
 */
-(void)ChipView:(ChipView *)chipView aChipTapped:(Chip *)chip;

@end
@interface ChipView : UIScrollView<ChipDelegate>{
    
    //hold chips objects
    NSMutableArray *chipList;
    
    //indicate chip enable or not
    BOOL isChipsEnabled;
    
    //chip space width from border, chip space hieght from border, chip size
    CGFloat spaceWidthOfChip;
    CGFloat spaceHeightOfChip;
    CGFloat sizeOfChip;

    
}

@property (nonatomic, weak) id<ChipViewDelegate> theDelegate;//delegate
//hold chips name must assign before call display chip
@property (nonatomic, copy) NSArray *chips;
@property (nonatomic, readwrite) CGFloat chipSpaceWidth;
@property (nonatomic, readwrite) CGFloat chipSpaceHeight;
@property (nonatomic, readwrite) CGFloat chipSize;

/*
 * A method to display chips
 *
 * @return Yes display success
 * @return No display fail
 */
-(BOOL)displayChips;

/*
 * A method to disable all chips
 */
-(void)disableCips;

/*
 * A method to enable all chips
 */
-(void)enableChips;

/*
 * A method to enable all chips and selected chip will be selected
 *
 * @param selectedChip chip that was selected 
 */
-(void)enableChipsWithSelectedChip:(Chip *)selectedChip;

@end

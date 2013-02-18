//
//  BetAreaView.h
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

/**
 BetAreaView
 respond to ChipView's delegate
 responsible for chip view setup, disable, enable
 responsible for selected chip
 Hold UpdateInfo, UserInfo
 
 **/

#import <UIKit/UIKit.h>
#import "ChipView.h"
#import "UpdateInfo.h"
#import "UserInfo.h"
#import "Constant.h"


@interface BetAreaView : UIView<ChipViewDelegate>{
    
    //selected chip
    __weak Chip *selectedChip;
    
    //indicate chip view is setup or not
    BOOL isChipViewSetup;
    
    //indicate chip space width is set or not
    BOOL isSpaceWidthOfChipSet;
    
    //indicate chip space height is set or not
    BOOL isSpaceHeightOfChipSet;
    
    //indicate chip size is set or not
    BOOL isSizeOfChipSet;
    
    //debug use purpose
    BOOL isInternalErrorShow;
}

@property (nonatomic, copy) NSArray *chips;//hold chip name
@property (nonatomic, weak) IBOutlet ChipView *chipListView;//connect chip view in Interface Builder
@property (nonatomic, strong) UpdateInfo *updateInfo;//UpdateInfo instance
@property (nonatomic, strong) UserInfo *userInfo;//UserInfo instance

//must set to to display proper chip view
@property (nonatomic, assign) CGFloat chipSpaceWidth;
@property (nonatomic, assign) CGFloat chipSpaceHeight;
@property (nonatomic, assign) CGFloat chipSize;

/*
 * A method to update view and logic 
 */
-(void)updateView;


@end

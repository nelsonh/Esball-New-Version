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
    
    __weak Chip *selectedChip;
    BOOL isChipViewSetup;
    BOOL isSpaceWidthOfChipSet;
    BOOL isSpaceHeightOfChipSet;
    BOOL isSizeOfChipSet;
    BOOL isInternalErrorShow;
}

@property (nonatomic, copy) NSArray *chips;//hold chip name
@property (nonatomic, weak) IBOutlet ChipView *chipListView;//connect chip view in IB
@property (nonatomic, weak) UpdateInfo *updateInfo;
@property (nonatomic, weak) UserInfo *userInfo;

//must set to to display proper chip view
@property (nonatomic, assign) CGFloat chipSpaceWidth;
@property (nonatomic, assign) CGFloat chipSpaceHeight;
@property (nonatomic, assign) CGFloat chipSize;

-(void)updateView;


@end

//
//  MiniInfoView.h
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//



#import <UIKit/UIKit.h>

/**
 * MiniInfoView subclass of UIView
 * responsible for visibility of view
 */
@interface MiniInfoView : UIView

@property (nonatomic, readwrite) BOOL visibility;//getter setter for visibility

/**
 * A method to update view and logic
 */
-(void)updateView;

@end

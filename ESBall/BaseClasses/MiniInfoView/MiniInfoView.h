//
//  MiniInfoView.h
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

/**
 responsible for visibility of view 
 **/

#import <UIKit/UIKit.h>

@interface MiniInfoView : UIView

@property (nonatomic, readwrite) BOOL visibility;//getter setter for visibility

/*
 * A method to update view and logic 
 */
-(void)updateView;

@end

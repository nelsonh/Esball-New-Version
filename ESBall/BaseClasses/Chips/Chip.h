//
//  Chips.h
//  ESBall
//
//  Created by Nelson on 12/3/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

/**
 Chip object
 responsible for chip status transition
 **/

#import <UIKit/UIKit.h>

@class Chip;

/*
 * A protocol of Chip
 */
@protocol ChipDelegate <NSObject>

@optional
/*
 * Fire when this chip tapped by player
 */
-(void)ChipDidTapped:(Chip *)chip;

@end

@interface Chip : UIButton{
    
}

@property (nonatomic, weak) id<ChipDelegate> theDelegate;//delegate
@property (nonatomic, assign) double chipValue;//money of this chip

/*
 * A method to create chip button
 *
 * @param buttonType the button type system provide
 * @param chipName string of image file name for chip, no file extension
 */
+(id)buttonWithType:(UIButtonType)buttonType andChipImageName:(NSString *)chipName;

/*
 * A method tell chip to select
 */
-(void)select;

/*
 * A method tell chip to deselect
 */
-(void)deselect;

/*
 * A method tell chip to disable
 */
-(void)disable;

/*
 * A method tell chip to enable
 */
-(void)enable;

@end

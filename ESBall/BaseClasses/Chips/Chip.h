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

@protocol ChipDelegate <NSObject>

@optional
-(void)ChipDidTapped:(Chip *)chip;

@end

@interface Chip : UIButton{
    
}

@property (nonatomic, weak) id<ChipDelegate> theDelegate;
@property (nonatomic, assign) double chipValue;

+(id)buttonWithType:(UIButtonType)buttonType andChipImageName:(NSString *)chipName;
-(void)select;
-(void)deselect;
-(void)disable;
-(void)enable;

@end

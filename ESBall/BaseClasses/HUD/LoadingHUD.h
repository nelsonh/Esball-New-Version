//
//  LoadingHUD.h
//  ESBall
//
//  Created by Nelson on 12/12/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kIconSize 120//Icon size

@interface LoadingHUD : UIView{
    
    //loading animation 
    UIImageView *loadingAnimView;
}

/**
 * A method to create loading HUD
 *
 * @param frame the frame for loading HUD 
 * @param animImages a set of animation images
 */
- (id)initWithFrame:(CGRect)frame loadingAnimImages:(NSArray *)animImages;

@end

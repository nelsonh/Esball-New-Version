//
//  HeaderView.h
//  ESBall
//
//  Created by Nelson on 1/9/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * HeaderView subclass of UIView.
 * A custom header for table
 */
@interface HeaderView : UIView

/**
 * A method to initialze header for table view
 *
 * 初始化 table view group 的標頭 view
 * 
 * @param frame rect
 * @param title title string
 * @param titleXPos title string x position
 * @param titleColor title string color
 * @param imageName background image name for title
 * @return header view
 */
-(id)initWithFrame:(CGRect)frame withTitleName:(NSString *)title withTitleXPosition:(CGFloat)titleXPos withTitleColor:(UIColor *)titleColor withBackgroundImageName:(NSString *)imageName;

@end

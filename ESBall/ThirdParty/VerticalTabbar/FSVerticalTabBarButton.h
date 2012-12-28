//
//  FSVerticalTabBarButton.h
//  iOS-Platform
//
//  Created by Błażej Biesiada on 4/8/12.
//  Copyright (c) 2012 Future Simple. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FSVerticalTabBar.h"
#import "TouchDetectorView.h"
#import "FSVerticalTabBarController.h"


@interface FSVerticalTabBarButton : UITableViewCell<TouchDetectorViewDelegate>



@property (nonatomic, readwrite, assign) UIColor *selectedImageTintColor;
@property (nonatomic, readwrite, strong) UIImage *iconImage;

//add
@property (nonatomic, weak) FSVerticalTabBar *tabbar;
@property (nonatomic, weak) FSVerticalTabBarController *fscontroller;



@end

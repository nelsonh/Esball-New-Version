//
//  ItemDropdownViewController.h
//  ESBall
//
//  Created by tomneo2004 on 12/11/26.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemDropdownViewController;

/**
 * A protocol of ItemDropdownViewController
 */
@protocol ItemDropdownViewControllerDelegate <NSObject>

/**
 * Fire when controller dismiss
 */
-(void)ItemDropdownViewControllerDidDismiss:(ItemDropdownViewController *)item;

@end

@interface ItemDropdownViewController : UIViewController{
    
    UIImage *logoImage;
}

@property (nonatomic, weak) id<ItemDropdownViewControllerDelegate>theDelegate;
@property (nonatomic, readwrite) UIImage *imageForMain;
@property (nonatomic, assign) int index;

@end

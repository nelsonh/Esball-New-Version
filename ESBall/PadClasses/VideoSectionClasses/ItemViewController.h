//
//  ItemViewController.h
//  ESBall
//
//  Created by tomneo2004 on 12/11/23.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ListScrollView;
@class ItemViewController;

@protocol ItemViewControllerDelegate <NSObject>


-(void)ItemViewControllerDidSelected:(ItemViewController *)item;
-(void)ItemViewControllerDidDropdown:(ItemViewController *)item;

@end

@interface ItemViewController : UIViewController{
    
    UIImage *imageNormal;
    UIImage *imageDown;
}

@property (nonatomic, weak) id<ItemViewControllerDelegate> theDelegate;
@property (nonatomic, weak) ListScrollView *scrollView;
@property (nonatomic, readwrite) UIImage *imageForNormal;
@property (nonatomic, readwrite) UIImage *imageForDown;
@property (nonatomic, assign) int index;
@property (nonatomic, assign) int tableNumber;
@property (nonatomic, assign) int gameType;
@property (nonatomic, copy) NSString *storyboardControllerID;

@end

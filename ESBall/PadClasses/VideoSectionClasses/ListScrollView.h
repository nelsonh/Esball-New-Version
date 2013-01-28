//
//  ListScrollView.h
//  ESBall
//
//  Created by tomneo2004 on 12/11/23.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemViewController.h"

@class ListScrollView;
@class ItemViewController;

@protocol ListScrollViewDelegate <NSObject>

@required
/**
 Data source
 **/
-(NSUInteger)ListScrollViewNumberOfItem:(ListScrollView *)scrollView;
-(ItemViewController *)ListScrollView:(ListScrollView *)scrollView itemForIndex:(NSUInteger)itemIndex;

@optional
/**
 When item selected, dropdown tapped
 **/
-(void)ListScrollView:(ListScrollView *)scrollView didSelectItemAtIndex:(NSUInteger)itemIndex;
-(void)ListScrollView:(ListScrollView *)scrollView didDropdownItemWithItem:(ItemViewController *)item;

@end

@interface ListScrollView : UIScrollView<UIScrollViewDelegate, ItemViewControllerDelegate>{
    
    //ItemViewContorller objects
    NSMutableArray *itemViewControlllers;
    int numberOfItem;
    int selectedItemIndex;
}

@property (nonatomic, weak) id<ListScrollViewDelegate> theDelegate;
@property (nonatomic, readonly) int itemCount;

-(void)initWithDelegate:(id<ListScrollViewDelegate>)delegate;
-(void)reloadData;
-(ItemViewController *)itemViewControllerByIndex:(NSUInteger)index;

@end

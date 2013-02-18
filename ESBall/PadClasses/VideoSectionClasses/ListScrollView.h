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

/*
 * A protocol of ListScrollView
 */
@protocol ListScrollViewDelegate <NSObject>

@required
/**
 Data source
 **/

/*
 * Fire when ask number of item to display
 */
-(NSUInteger)ListScrollViewNumberOfItem:(ListScrollView *)scrollView;

/*
 * Fire when need a specific item to dispaly
 */
-(ItemViewController *)ListScrollView:(ListScrollView *)scrollView itemForIndex:(NSUInteger)itemIndex;

@optional
/**
 When item selected, dropdown tapped
 **/

/*
 * Fire when an item selected
 */
-(void)ListScrollView:(ListScrollView *)scrollView didSelectItemAtIndex:(NSUInteger)itemIndex;

/*
 * Fire when tapped drop down on an item
 */
-(void)ListScrollView:(ListScrollView *)scrollView didDropdownItemWithItem:(ItemViewController *)item;

@end

@interface ListScrollView : UIScrollView<UIScrollViewDelegate, ItemViewControllerDelegate>{
    
    //ItemViewContorller objects
    NSMutableArray *itemViewControlllers;
    
    //track number of item
    int numberOfItem;
    
    //track index of selected item
    int selectedItemIndex;
}

@property (nonatomic, weak) id<ListScrollViewDelegate> theDelegate;
@property (nonatomic, readonly) int itemCount;

/*
 * A method to initialize 
 *
 * @param delegate the delegate 
 */
-(void)initWithDelegate:(id<ListScrollViewDelegate>)delegate;

/*
 * A method to reload data
 */
-(void)reloadData;

/*
 * A method return item by given index
 *
 * @param index index of item
 * @return item
 */
-(ItemViewController *)itemViewControllerByIndex:(NSUInteger)index;

@end

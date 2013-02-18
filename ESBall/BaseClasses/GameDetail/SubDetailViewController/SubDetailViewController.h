//
//  SubDetailViewController.h
//  ESBall
//
//  Created by Nelson on 12/10/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SubDetailViewController;

/**
 * A protocol of SubDetailViewController
 */
@protocol SubDetailViewControllerDelegate <NSObject>

@optional

/**
 * Fire when SubDetailViewController add to parent controller
 */
-(void)SubDetailViewControllerDidAddToParentController:(SubDetailViewController *)controller;

/**
 * Fire when SubDetailViewController remove from parent controller
 */

-(void)SubDetailViewControllerDidRemoveFromParentController:(SubDetailViewController *)controller;

@end

@interface SubDetailViewController : UIViewController

@property (nonatomic, weak) id<SubDetailViewControllerDelegate> theDelegate;//delegate

/**
 * A method to add this controller to another controller
 *
 * @param parentController this controller will added to
 * @param newRect the rect in parent controller's view
 */
-(void)addToController:(UIViewController *)parentController inRect:(CGRect)newRect;

@end

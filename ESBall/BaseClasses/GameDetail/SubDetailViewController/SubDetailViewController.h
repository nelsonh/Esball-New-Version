//
//  SubDetailViewController.h
//  ESBall
//
//  Created by Nelson on 12/10/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SubDetailViewController;

@protocol SubDetailViewControllerDelegate <NSObject>

@optional

-(void)SubDetailViewControllerDidAddToParentController:(SubDetailViewController *)controller;
-(void)SubDetailViewControllerDidRemoveFromParentController:(SubDetailViewController *)controller;

@end

@interface SubDetailViewController : UIViewController

@property (nonatomic, weak) id<SubDetailViewControllerDelegate> theDelegate;

-(void)addToController:(UIViewController *)parentController inRect:(CGRect)newRect;

@end

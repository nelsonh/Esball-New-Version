//
//  ItemViewController.h
//  ESBall
//
//  Created by tomneo2004 on 12/11/23.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

//ItemViewController generic class

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@class ListScrollView;
@class ItemViewController;

@protocol ItemViewControllerDelegate <NSObject>


-(void)ItemViewControllerDidSelected:(ItemViewController *)item;
-(void)ItemViewControllerDidDropdown:(ItemViewController *)item;

@end

@interface ItemViewController : UIViewController<NSURLConnectionDelegate>{
    
    UIImage *imageNormal;
    UIImage *imageDown;
    
    BOOL isSelected;//indicate this item is selected or not
    
    NSTimer *roadmapDataTimer;
    NSMutableData *roadmapData;
    NSURLConnection *roadmapDataConnection;
    //__weak UIImageView *roadmapImageView;
}

@property (nonatomic, weak) id<ItemViewControllerDelegate> theDelegate;
@property (nonatomic, weak) ListScrollView *scrollView;
@property (nonatomic, readwrite) UIImage *imageForNormal;//image for none press
@property (nonatomic, readwrite) UIImage *imageForDown;//image for press
@property (nonatomic, assign) int index;
@property (nonatomic, assign) int tableNumber;//table number for game
@property (nonatomic, assign) int infoTableNumber;//table number for retriving data
@property (nonatomic, assign) int gameType;
@property (nonatomic, copy) NSString *tableName;
@property (nonatomic, copy) NSString *storyboardControllerID;

@property (nonatomic, weak) IBOutlet UILabel *timeLabel;
//@property (nonatomic, weak) IBOutlet UIView *roadmapRefView;

-(void)deselectItem;//tell this item to not select
-(void)updateTimeWithTime:(NSUInteger)time;


-(void)startRoadmapUpdate;
-(void)stopRoadmapUpdate;
-(void)doPullRoadmapData;
//need to implement by subclass
-(void)displayRoadmap;

@end

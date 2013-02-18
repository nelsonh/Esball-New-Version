//
//  SportSectionViewController.h
//  ESBall
//
//  Created by nelson on 12/11/15.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListScrollView.h"
#import "ItemDropdownViewController.h"
#import "BaseGameViewController.h"
#import "LoadingHUD.h"

@class ItemViewController;

@interface VideoSectionViewController : UIViewController<ListScrollViewDelegate, ItemDropdownViewControllerDelegate, BaseGameViewControllerDelegate, ServerInterfaceDelegate, NSURLConnectionDelegate>{

    //hold initial ListScrollView's rect
    CGRect rectForListScrollView;
    
    //hold initial ItemViewControllers perticulary for order
    NSMutableArray *itemsDataOrigin;
    
    //hold ItemViewControllers
    NSMutableArray *itemsData;
    
    //hold removed item data index
    NSMutableArray *removedItemDataIndex;
    
    //temporary data store
    //indicate it is changing table
    //BOOL isChangingTable;
    int tableNumberToChange;
    int gameTypeNumberToChange;
    NSString *storyboardControllerID;
    
    LoadingHUD *loadingHUD;
    
    double roadmapUpdateInterval;
    
    __weak ItemViewController *selectedItem;//track item we current selected
    NSTimer *pullCountDownDataTimer;
    NSMutableData *countDownData;
    NSURLConnection *countDownDataConnection;
}

/*
 * A enter game button which is connected in Interface Builder
 * Trigger enter game event
 */
-(IBAction)enterGameBtnTapped:(id)sender;

/*
 * A logout button which is connected in Interface Builder
 * Trigger logout event
 */
-(IBAction)logout:(id)sender;

//stop resume update related

/*
 * A method stop any update
 */
-(void)stopAnyUpdate;

/*
 * A method start update
 */
-(void)startUpdate;

//time count down related

/*
 * A method start download data for count down
 */
-(void)startPullDataForCountDown;

/*
 * A method stop download data for count down
 */
-(void)stopPullDataForCounDown;

/*
 * A method download data for count down
 */
-(void)doPullDataForCountDown;

/*
 * A method to update count down 
 */
-(void)updateCountDownTime;

/*
 * A method to parse count down data to a organize array
 *
 * @param data data to be parse
 * @return array organized data
 */
-(NSArray *)parseCountDownTimeDataWithData:(NSData *)data;

@end

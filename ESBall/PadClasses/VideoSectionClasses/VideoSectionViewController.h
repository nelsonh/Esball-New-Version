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
    
    
    
    __weak ItemViewController *selectedItem;//track item we current selected
    NSTimer *pullCountDownDataTimer;
    NSMutableData *countDownData;
    NSURLConnection *countDownDataConnection;
}

-(IBAction)enterGameBtnTapped:(id)sender;

//stop resume update related
-(void)stopAnyUpdate;
-(void)startUpdate;

//time count down related 
-(void)startPullDataForCountDown;
-(void)stopPullDataForCounDown;
-(void)doPullDataForCountDown;
-(void)updateCountDownTime;
-(NSArray *)parseCountDownTimeDataWithData:(NSData *)data;

@end

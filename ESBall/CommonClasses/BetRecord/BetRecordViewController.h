//
//  BetRecordViewController.h
//  ESBall
//
//  Created by Nelson on 1/8/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

//need to subclass

#import <UIKit/UIKit.h>
#import "BetRecordCell.h"

@class BetRecordViewController;

/**
 * A protocol of BetRecordViewController
 */
@protocol BetRecordViewControllerDelegate <NSObject>

@optional

/**
 * Fire when this controller added to another controller
 */
-(void)BetRecordViewControllerDidAddToParentController:(BetRecordViewController *)controller;

/**
 * Fire when this controller remove from parent controller
 */
-(void)BetRecordViewControllerDidRemoveFromParentController:(BetRecordViewController *)controller;

@end

/**
 * Record data class subclass of NSObject
 * This class is used to contain information for each
 * bet record, subclass to extend your own.
 */
@interface RecordData : NSObject

@property (nonatomic, strong) NSString *cid;
@property (nonatomic, strong) NSString *roundSerial;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *banker;
@property (nonatomic, strong) NSString *player;
@property (nonatomic, strong) NSString *totalBet;
@property (nonatomic, strong) NSString *totalPayoff;

@end

/**
 * BetRecordViewController subclass of UIViewController.
 * This class is a foundation and need to be extend
 * The class manage to present a table view for each record data.
 * The class also manage to download record data and organize record data.
 * The class responsible to tell which record data's detail will be present.
 */
@interface BetRecordViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, NSURLConnectionDelegate>{
    
    NSMutableDictionary *recordDatas;//info of all records
    NSURLConnection *urlConnection;//connection instance
    NSMutableData *pendingData;//appendable data for async download
    
    BOOL isPullingDataFail;//if data download fail this will be no
    
    NSIndexPath *lastSelectedIndex;//select index 
}

@property (nonatomic, weak) IBOutlet UIView *referenceView;

@property (nonatomic, weak) id<BetRecordViewControllerDelegate> theDelegate;
@property (nonatomic, assign) NSUInteger gameType;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

//need to implement subclass

/**
 * A method ask should present a empty model when controller show up
 * ipod iphone no, ipad yes
 *
 * 是否需要顯示一個空的 model
 *
 * @return yes to present a empty model, no don't present
 */
-(BOOL)presentEmptyModelAtBeginning;

/**
 * A method ask how many data should download at a time
 *
 * 一次要下載多少筆資料
 *
 * @return integer number of data to download
 */
-(NSUInteger)numberOfDataToPull;

/**
 * A method ask how many section to download
 *
 * @return integer number of section;
 */
-(NSUInteger)sectionToPull;

/**
 * A method ask image name for cell background
 *
 * 回傳 cell 背景圖的檔名
 *
 * @return string image name
 */
-(NSString *)cellBackgroundImageName;

/**
 * A method ask image name for cell background when selected
 *
 * 回傳 cell 選擇時的背景圖檔名
 *
 * @return string image name
 */
-(NSString *)cellSelectedBackgroundImageName;

/**
 * A method ask section header height in table view
 *
 * Table view 標頭的高
 *
 * @return CGFloat height for header
 */
-(CGFloat)tableViewHeaderHeight;

/**
 * A method ask image name for table header's background
 *
 * Table view 標頭的背景圖檔名
 *
 * @return string image name
 */
-(NSString *)tableViewHeaderBackgroundImageName;

/**
 * A method ask title string position on x
 *
 * Table view 標頭文字 x 的位置
 *
 * @retun CGFloat value for x position
 */
-(CGFloat)tableViewTitleXPosition;

/**
 * A method ask color for title string
 *
 * Table view 標頭文字的顏色
 *
 * @return UIColor for title string
 */
-(UIColor *)tableViewTitleColor;

/**
 * A method ask cell identifier
 *
 * 回傳 cell 的 id
 *
 * @return string cell identififer
 */
-(NSString *)cellIdentifier;

/**
 * A method to show detail record controller
 *
 * 顯示 detail record controller
 *
 * @param cid string of cid
 * @param gameType string of gametype
 */
-(void)showDetailRecordWithCID:(NSString *)cid withGameType:(NSString *)gameType;//for transition

/**
 * A method ask for cell's x position
 *
 * 回傳 cell 的 x 位置
 *
 * @return CGFloat value of x position
 */
-(CGFloat)cellX;

/**
 * A method ask for cell's width
 *
 * 回傳 cell 的寬
 * 
 * @return CGFloat value of width for cell
 */
-(CGFloat)cellWitdh;

/**
 * A method to download record data
 *
 * 下載記錄資料
 */
-(void)pullRecordData;

/**
 * A method to convert data from string
 *
 * 轉換字串資料
 * 
 * @param dataStr data as string
 * @return dictionary that contain data that had been converted
 */
-(NSMutableDictionary *)convertDataWithString:(NSString *)dataStr;

/**
 * A method to configure cell
 *
 * 設定 cell
 *
 * @param cell is about to be configured
 * @param indexPath index of cell and data
 * @return configured cell
 */
-(BetRecordCell *)configureCell:(BetRecordCell *)cell withIndexPath:(NSIndexPath *)indexPath;

/**
 * A method to sort data decending
 *
 * 排序資料
 *
 * @param unsortedArray array that has not yet sorted 
 */
-(NSArray *)sortArrayDecendingWithArray:(NSArray *)unsortedArray;

/**
 * A method to add this controller to another controller as child
 *
 * @param parentController the controller this controller will be add to
 * @param pos position in parent controller 
 */
-(void)addToConrtoller:(UIViewController *)parentController inPosition:(CGPoint)pos;

@end

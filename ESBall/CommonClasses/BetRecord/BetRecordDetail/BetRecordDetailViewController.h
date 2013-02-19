//
//  BetRecordDetailViewController.h
//  ESBall
//
//  Created by Nelson on 1/9/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

//record is dictionary format is below example
/*
 {
    Cards = "C.7,D.8,CID,C.1,C.9,D.12";
    GameCode = 1;
    Point = "5,CID,0";
    Records =     (
                        {
                            Bet = "5.00";
                            Odds = "1:11";
                            Payoff = "-5.00";
                            SerialType = 4;
                        },
 
                        {
                            Bet = "5.00";
                            Odds = "1:0.92";
                            Payoff = "4.60";
                            SerialType = 8;
                        }
                );
    Result = 25;
    RoundSerial = 27460544;
    TotalBet = "10.00";
    TotalPayoff = "-0.40";
    WagersDate = "2012-12-05 03:31:25";
 }
 */

#import <UIKit/UIKit.h>
#import "BetRecordDetailRowCell.h"
#import "BetRecordDetailTotalRowCell.h"

@interface BetRecordDetailViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, NSURLConnectionDelegate>{
    
    NSMutableDictionary *detailRecord;// info for a record format look top example
    NSURLConnection *urlConnection;//instance connection
    NSMutableData *pendingData;//record data
    
    //indicate download record data fail
    BOOL isPullingDataFail;
}

@property (nonatomic, weak) IBOutlet UILabel *roundNumberLabel;
@property (nonatomic, weak) IBOutlet UILabel *tableNumberLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateTimeLabel;
@property (nonatomic, weak) IBOutlet UILabel *commentLabel;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSString *cid;
@property (nonatomic, strong) NSString *gameType;

//subclass need to implement thier own if needed

/**
 * A method ask cell identifier
 *
 * 回傳 cell 的 id
 *
 * @return cell id string
 */
-(NSString *)cellIdentifier;

/**
 * A method ask total bet cell identifier
 *
 * 回傳 total bet cell 的 id
 *
 * @retun total bet cell id string
 */
-(NSString *)cellIdentifierForTotalBet;

/**
 * A method to present poker record
 *
 * 顯示開牌的紀錄
 */
-(void)showPokerRecord;

/**
 * A method to download specific detail record data
 *
 * 下載某一筆記錄的資料
 */
-(void)pullDetailRecordData;

/**
 * A method to convert json data to a dictionary
 *
 * 將 jason 資料轉換
 *
 * @param jsonData a jason format data
 * @return dictionary that contain record data
 */
-(NSMutableDictionary *)convertDataWithJasonData:(NSData *)jsonData;

/**
 * A method to process common data
 * not each row record data
 *
 * 處理基本共同的資料
 *
 * @param dic dictionary that contain record data which converted from jason data
 */
-(void)processData:(NSMutableDictionary *)dic;

/**
 * A method to check if given string is digital exclusively
 *
 * 檢查字串裡是否都是數字
 *
 * @param str string that is going to be checked
 * @return boolean yes string contain only digital otherwise no
 */
-(BOOL)isAllDigitals:(NSString *)str;

/**
 * A method to find game code name by game code number
 *
 * 尋找 game code 名字
 *
 * @param gameCode integer game code number
 * @return string game code name
 */
-(NSString *)gameCodeNameWithGameCode:(NSUInteger)gameCode;

/**
 * A method to configure cell
 *
 * 設定 cell
 *
 * @param cell the cell is going to be configured
 * @param indexPath index of cell and data
 * @return configured cell
 */
-(BetRecordDetailRowCell*)configureCell:(BetRecordDetailRowCell *)cell withIndexPath:(NSIndexPath *)indexPath;

/**
 * A method to configure total bet cell
 *
 * 設定 total bet cell
 *
 * @param cell the cell is going to be configured
 */
-(BetRecordDetailTotalRowCell *)configureCellForBetTotal:(BetRecordDetailTotalRowCell *)cell;

/**
 * A method to find bet type by bet type number
 *
 * 尋找下注的種類
 *
 * @param betType number of bet type
 * @return string of bet type
 */
-(NSString *)betTypeWithTypeNumber:(NSUInteger)betType;


/**
 * A method to add this controller to another controller
 *
 * @param parentController the controller this controller will be added to
 * @param frame rect in parentController
 */
-(void)addToConrtoller:(UIViewController *)parentController inFrame:(CGRect)frame;

@end

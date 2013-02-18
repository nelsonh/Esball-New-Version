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

/*
 * A method ask cell identifier
 *
 * @return cell id string
 */
-(NSString *)cellIdentifier;

/*
 * A method ask total bet cell identifier
 *
 * @retun total bet cell id string
 */
-(NSString *)cellIdentifierForTotalBet;

/*
 * A method to present poker record
 */
-(void)showPokerRecord;

/*
 * A method to download specific detail record data 
 */
-(void)pullDetailRecordData;

/*
 * A method to convert json data to a dictionary
 *
 * @param jsonData a jason format data
 * @return dictionary that contain record data
 */
-(NSMutableDictionary *)convertDataWithJasonData:(NSData *)jsonData;

/*
 * A method to process common data
 * not each row record data
 *
 * @param dic dictionary that contain record data which converted from jason data
 */
-(void)processData:(NSMutableDictionary *)dic;

/*
 * A method to check if given string is digital exclusively
 *
 * @param str string that is going to be checked
 * @return boolean yes string contain only digital otherwise no
 */
-(BOOL)isAllDigitals:(NSString *)str;

/*
 * A method to find game code name by game code number
 *
 * @param gameCode integer game code number
 * @return string game code name
 */
-(NSString *)gameCodeNameWithGameCode:(NSUInteger)gameCode;

/*
 * A method to configure cell
 *
 * @param cell the cell is going to be configured
 * @param indexPath index of cell and data
 * @return configured cell
 */
-(BetRecordDetailRowCell*)configureCell:(BetRecordDetailRowCell *)cell withIndexPath:(NSIndexPath *)indexPath;

/*
 * A method to configure total bet cell
 *
 * @param cell the cell is going to be configured
 */
-(BetRecordDetailTotalRowCell *)configureCellForBetTotal:(BetRecordDetailTotalRowCell *)cell;

/*
 * A method to find bet type by bet type number
 *
 * @param betType number of bet type
 * @return string of bet type
 */
-(NSString *)betTypeWithTypeNumber:(NSUInteger)betType;


/*
 * A method to add this controller to another controller
 *
 * @param parentController the controller this controller will be added to
 * @param frame rect in parentController
 */
-(void)addToConrtoller:(UIViewController *)parentController inFrame:(CGRect)frame;

@end

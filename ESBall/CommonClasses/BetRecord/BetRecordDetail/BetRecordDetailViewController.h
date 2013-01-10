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
    NSURLConnection *urlConnection;
    NSMutableData *pendingData;
    
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
-(NSString *)cellIdentifier;
-(NSString *)cellIdentifierForTotalBet;
-(void)showPokerRecord;

-(void)pullDetailRecordData;
-(NSMutableDictionary *)convertDataWithJasonData:(NSData *)jsonData;
-(void)processData:(NSMutableDictionary *)dic;
-(BOOL)isAllDigitals:(NSString *)str;
-(NSString *)gameCodeNameWithGameCode:(NSUInteger)gameCode;
-(BetRecordDetailRowCell*)configureCell:(BetRecordDetailRowCell *)cell withIndexPath:(NSIndexPath *)indexPath;
-(BetRecordDetailTotalRowCell *)configureCellForBetTotal:(BetRecordDetailTotalRowCell *)cell;
-(NSString *)betTypeWithTypeNumber:(NSUInteger)betType;

-(void)addToConrtoller:(UIViewController *)parentController inFrame:(CGRect)frame;

@end

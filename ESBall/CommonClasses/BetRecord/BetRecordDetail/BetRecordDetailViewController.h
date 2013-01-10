//
//  BetRecordDetailViewController.h
//  ESBall
//
//  Created by Nelson on 1/9/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BetRecordDetailRowCell.h"
#import "BetRecordDetailTotalRowCell.h"

@interface BetRecordDetailViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, NSURLConnectionDelegate>{
    
    NSMutableDictionary *detailRecord;
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

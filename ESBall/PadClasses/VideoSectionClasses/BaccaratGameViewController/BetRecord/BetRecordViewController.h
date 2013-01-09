//
//  BetRecordViewController.h
//  ESBall
//
//  Created by Nelson on 1/8/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BetRecordCell.h"

@class BetRecordViewController;


@protocol BetRecordViewControllerDelegate <NSObject>

@optional
-(void)BetRecordViewControllerDidAddToParentController:(BetRecordViewController *)controller;
-(void)BetRecordViewControllerDidRemoveFromParentController:(BetRecordViewController *)controller;

@end

@interface BetRecordViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, BetRecordCellDelegate, NSURLConnectionDelegate>{
    
    NSMutableDictionary *recordDatas;
    NSURLConnection *urlConnection;
    NSMutableData *pendingData;
    
    BOOL isPullingDataFail;
}

@property (nonatomic, weak) id<BetRecordViewControllerDelegate> theDelegate;
@property (nonatomic, assign) NSUInteger gameType;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

-(NSUInteger)numberOfDataToPull;
-(NSUInteger)sectionToPull;
-(NSString *)cellBackgroundImageName;
-(NSString *)cellSelectedBackgroundImageName;
-(CGFloat)tableViewHeaderHeight;
-(NSString *)tableViewHeaderBackgroundImageName;
-(CGFloat)tableViewTitleXPosition;
-(UIColor *)tableViewTitleColor;

-(void)pullRecordData;
-(NSMutableDictionary *)convertDataWithString:(NSString *)dataStr;
-(BetRecordCell *)configureCell:(BetRecordCell *)cell withIndexPath:(NSIndexPath *)indexPath;

-(void)addToConrtoller:(UIViewController *)parentController inPosition:(CGPoint)pos;

@end

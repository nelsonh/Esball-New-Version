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


@protocol BetRecordViewControllerDelegate <NSObject>

@optional
-(void)BetRecordViewControllerDidAddToParentController:(BetRecordViewController *)controller;
-(void)BetRecordViewControllerDidRemoveFromParentController:(BetRecordViewController *)controller;

@end

@interface BetRecordViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, NSURLConnectionDelegate>{
    
    NSMutableDictionary *recordDatas;//info of all records
    NSURLConnection *urlConnection;
    NSMutableData *pendingData;
    
    BOOL isPullingDataFail;
}

@property (nonatomic, weak) IBOutlet UIView *referenceView;

@property (nonatomic, weak) id<BetRecordViewControllerDelegate> theDelegate;
@property (nonatomic, assign) NSUInteger gameType;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

//need to implement subclass
-(BOOL)presentEmptyModelAtBeginning;
-(NSUInteger)numberOfDataToPull;
-(NSUInteger)sectionToPull;
-(NSString *)cellBackgroundImageName;
-(NSString *)cellSelectedBackgroundImageName;
-(CGFloat)tableViewHeaderHeight;
-(NSString *)tableViewHeaderBackgroundImageName;
-(CGFloat)tableViewTitleXPosition;
-(UIColor *)tableViewTitleColor;
-(NSString *)cellIdentifier;
-(void)showDetailRecordWithCID:(NSString *)cid withGameType:(NSString *)gameType;//for transition

-(void)pullRecordData;
-(NSMutableDictionary *)convertDataWithString:(NSString *)dataStr;
-(BetRecordCell *)configureCell:(BetRecordCell *)cell withIndexPath:(NSIndexPath *)indexPath;

-(void)addToConrtoller:(UIViewController *)parentController inPosition:(CGPoint)pos;

@end

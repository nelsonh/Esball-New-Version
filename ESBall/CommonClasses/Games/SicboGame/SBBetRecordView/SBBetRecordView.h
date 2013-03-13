//
//  SBBetRecordView.h
//  ESBall
//
//  Created by Nelson on 3/12/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBBetRecordCell.h"

@interface SBBetRecordView : UIView<UITableViewDataSource, UITableViewDelegate>{
    
    //contain each bet record data
    NSArray *betRecords;
}

@property (nonatomic, weak) IBOutlet UITableView *tableView;

/**
 * A method to refresh bet records and display them
 * this method simply replace old betRecords with new one
 * and reload data
 *
 * @param betRecords the new bet records which is going to replace old one
 */
-(void)refreshBetRecordWithNewBetRecords:(NSArray *)theBetRecords;

/**
 * A method to clear all bet records
 */
-(void)clearBetRecordsWithRefreshDisplay:(BOOL)yesOrNo;

/**
 * A method to configure cell
 *
 * @param cell the cell will be configured
 * @param indexPath the indexPath that associate with cell
 * @return SBBetRecordCell cell that is SBBetRecordCell and configured
 */
-(SBBetRecordCell *)configureCellWithCell:(SBBetRecordCell *)cell withIndexPath:(NSIndexPath *)indexPath;

@end

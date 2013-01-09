//
//  BetRecordDetailRowCell.h
//  ESBall
//
//  Created by Nelson on 1/9/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BetRecordDetailRowCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *characterTypeLabel;
@property (nonatomic, weak) IBOutlet UILabel *proportionLabel;
@property (nonatomic, weak) IBOutlet UILabel *totalBetLabel;
@property (nonatomic, weak) IBOutlet UILabel *totalPayoffLabel;

@end

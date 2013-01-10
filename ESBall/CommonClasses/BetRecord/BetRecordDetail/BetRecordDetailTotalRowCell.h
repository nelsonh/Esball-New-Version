//
//  BetRecordDetailTotalRowCell.h
//  ESBall
//
//  Created by Nelson on 1/9/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BetRecordDetailTotalRowCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *totalbetLabel;
@property (nonatomic, weak) IBOutlet UILabel *totalPayoffLabel;

-(id)initWithReuseIdentifier:(NSString *)identifier;

@end

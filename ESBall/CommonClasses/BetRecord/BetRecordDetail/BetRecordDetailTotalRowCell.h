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

/**
 * A method to initialize total bet cell
 *
 * 初始化 total bet cell
 *
 * @param identifier string of cell id
 * @return total bet cell
 */
-(id)initWithReuseIdentifier:(NSString *)identifier;

@end

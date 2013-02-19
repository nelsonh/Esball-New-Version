//
//  BetRecordCell.h
//  ESBall
//
//  Created by Nelson on 1/8/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BetRecordCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *roundSerialLabel;
@property (nonatomic, weak) IBOutlet UILabel *bankerPointLabel;
@property (nonatomic, weak) IBOutlet UILabel *playerPointLabel;
@property (nonatomic, weak) IBOutlet UILabel *totalBetLabel;
@property (nonatomic, weak) IBOutlet UILabel *totalPayoffLabel;
@property (nonatomic, copy) NSString *defaultBackgroundImageName;
@property (nonatomic, assign) CGFloat cellX;
@property (nonatomic, assign) CGFloat cellWidth;


/**
 * A method to initialize cell
 *
 * cell 重複使用的 id
 *
 * @param identifier id for cell
 * @return cell
 */
-(id)initWithReuseIdentifier:(NSString *)identifier;

@end

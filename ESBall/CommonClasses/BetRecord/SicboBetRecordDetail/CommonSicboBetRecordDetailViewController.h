//
//  CommonSicboBetRecordDetailViewController.h
//  ESBall
//
//  Created by Nelson on 3/6/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "BetRecordDetailViewController.h"

/**
 * CommonSicboBetRecordDetailViewController subclass of BetRecordDetailViewController
 * This class implement the display of dice and dice total point.
 * This class define new UIs
 * This class also override some method from parent
 */
@interface CommonSicboBetRecordDetailViewController : BetRecordDetailViewController

@property (nonatomic, weak) IBOutlet UILabel *dicePoint;
@property (nonatomic, weak) IBOutlet UIImageView *diceLeft;
@property (nonatomic, weak) IBOutlet UIImageView *diceMiddle;
@property (nonatomic, weak) IBOutlet UIImageView *diceRight;

/**
 * A method to show dice images
 *
 * 顯示骰子圖片
 */
-(void)showDices;

/**
 * A method to show sum of dice point
 *
 * 顯示全部骰子的總和
 */
-(void)showDicePoint;

@end

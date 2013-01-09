//
//  BetRecordDetailViewController.h
//  ESBall
//
//  Created by Nelson on 1/9/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BetRecordDetailViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *roundNumberLabel;
@property (nonatomic, weak) IBOutlet UILabel *tableNumberLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateTimeLabel;
@property (nonatomic, weak) IBOutlet UILabel *commentLabel;

@property (nonatomic, assign) NSUInteger cid;
@property (nonatomic, assign) NSUInteger gameType;

@end

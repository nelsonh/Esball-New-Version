//
//  SBBetRecordCell.h
//  ESBall
//
//  Created by Nelson on 3/12/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBBetRecordCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *amountOfBetLabel;
@property (nonatomic, weak) IBOutlet UILabel *diceStringLabel;
@property (nonatomic, weak) IBOutlet UIImageView *diceImageView;

-(id)initWithReuseIdentifier:(NSString *)identifier;

@end

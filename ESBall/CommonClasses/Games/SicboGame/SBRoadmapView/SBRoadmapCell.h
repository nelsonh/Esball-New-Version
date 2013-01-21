//
//  SBRoadmapCell.h
//  ESBall
//
//  Created by Nelson on 1/18/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBRoadmapCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *diceLabel;
@property (nonatomic, weak) IBOutlet UILabel *sumLabel;
@property (nonatomic, weak) IBOutlet UILabel *bigOrSmallLabel;

-(id)initWithReuseIdentifier:(NSString *)identifier;

@end

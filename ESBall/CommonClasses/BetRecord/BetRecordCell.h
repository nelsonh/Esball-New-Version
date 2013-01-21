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
@property (nonatomic, weak) IBOutlet UILabel *subDetailLabel;
@property (nonatomic, copy) NSString *defaultBackgroundImageName;
@property (nonatomic, assign) CGFloat cellX;
@property (nonatomic, assign) CGFloat cellWidth;



-(id)initWithReuseIdentifier:(NSString *)identifier;

@end

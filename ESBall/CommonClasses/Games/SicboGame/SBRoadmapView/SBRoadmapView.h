//
//  SBRoadmapView.h
//  ESBall
//
//  Created by Nelson on 1/18/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBRoadmapCell.h"

@interface SBRoadmapView : UIView<UITableViewDataSource, UITableViewDelegate>{
    
    NSMutableArray *roadmapDatas;
    
}

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSArray *roadmapInfo;

-(SBRoadmapCell *)configureCell:(SBRoadmapCell *)cell withIndexPath:(NSIndexPath *)indexPath;
-(void)convertRoadmapInfo;
-(void)updateView;

@end

//
//  RoadmapDataView.h
//  ESBall
//
//  Created by Nelson on 12/6/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RoadmapDataView;

@protocol RoadmapDataViewDelegate <NSObject>

-(void)RoadmapDataViewDidScroll:(RoadmapDataView *)roadmapView;

//how many content
-(NSUInteger)RoadmapChartNumberOfContent:(RoadmapDataView *)roadmap;

@end

@interface RoadmapDataView : UIScrollView<UIScrollViewDelegate>{
    
    NSUInteger numberOfSections;
}

@property (nonatomic, weak) id<RoadmapDataViewDelegate> theDelegate;
@property (nonatomic, copy) NSString *table;
@property (nonatomic, copy) NSString *method;
@property (nonatomic, readonly) NSUInteger sections;

-(void)initilize;//must call to init
-(void)initilizeWithDelegate:(id<RoadmapDataViewDelegate>)delegate;
-(void)prepareToDraw;
-(void)updateView;

@end

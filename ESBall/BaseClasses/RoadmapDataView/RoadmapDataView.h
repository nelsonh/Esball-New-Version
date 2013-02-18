//
//  RoadmapDataView.h
//  ESBall
//
//  Created by Nelson on 12/6/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RoadmapDataView;

/**
 * A protocol of RoadmapDataView
 */
@protocol RoadmapDataViewDelegate <NSObject>

/**
 * Fire when roadmap did scroll
 */
-(void)RoadmapDataViewDidScroll:(RoadmapDataView *)roadmapView;

/**
 * Fire when roadmap is about to ask how many content(page) in roadmap
 */
-(NSUInteger)RoadmapChartNumberOfContent:(RoadmapDataView *)roadmap;

@end

@interface RoadmapDataView : UIScrollView<UIScrollViewDelegate>{
    
    //Number of section to draw
    NSUInteger numberOfSections;
}

@property (nonatomic, weak) id<RoadmapDataViewDelegate> theDelegate;//delegate
@property (nonatomic, copy) NSString *table;//game table
@property (nonatomic, copy) NSString *method;//ask banker or player method
@property (nonatomic, readonly) NSUInteger sections;//getter for sections

/**
 * A method to initialize roadmap 
 */
-(void)initilize;

/**
 * A method to initialze roadmap with delegate
 */
-(void)initilizeWithDelegate:(id<RoadmapDataViewDelegate>)delegate;

/**
 * A method should be call before drawing roadmap
 */
-(void)prepareToDraw;

/**
 * A method to update view and logic
 */
-(void)updateView;

@end

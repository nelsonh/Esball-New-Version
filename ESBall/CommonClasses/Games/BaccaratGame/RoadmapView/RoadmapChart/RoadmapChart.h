//
//  RoadmapChart.h
//  ESBall
//
//  Created by Nelson on 12/6/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "RoadmapDataView.h"

//781, 230 was defined for ipad
//#define kRoadmapWidth 781
//#define kRoadmapHeight 130


@interface RoadmapChart : RoadmapDataView{
    
    NSString *allRoadmapData[30];
    
}


@property (nonatomic, assign) BOOL redrawRoadmap;//Yes only redraw chart without update data default is NO

/*
 * A method to update roadmap data
 */
-(void)updateRoadmapData;

/*
 * A method to draw roadmap chart
 */
-(void)DrawRoadmapChart;

/*
 * A method to layout scroll images
 */
-(void)layoutScrollImages;

/*
 * A method that return roadmap chart width
 *
 * @return CGFloat width of chart
 */
-(CGFloat)roadmapChartWidth;

/*
 * A method that return roadmap chart height
 *
 * @return CGFloat height of chart
 */
-(CGFloat)roadmapChartHeight;

/*
 * A method that return roadmap chart background image name
 *
 * @return string of image name
 */
-(NSString *)roadmapBaseImageName;

/*
 * A method that return roadmap player image name
 *
 * @return string of player image name
 */
-(NSString *)playerImageName;

/*
 * A method that return roadmap banker image name
 *
 * @return string of banker image name
 */
-(NSString *)bankerImageName;

/*
 * A method that return roadmap tie1 image name
 *
 * @return string of tie1 image name
 */
-(NSString *)tie1ImageName;

/*
 * A method that return roadmap tie2 image name
 *
 * @return string of tie2 image name
 */
-(NSString *)tie2ImageName;

/*
 * A method that return roadmap tie3 image name
 *
 * @return string of tie3 image name
 */
-(NSString *)tie3ImageName;

/*
 * A method that return roadmap small player image name
 *
 * @return string of small player image name
 */
-(NSString *)smallPlayerImageName;

/*
 * A method that return roadmap small banker image name
 *
 * @return string of small banker image name
 */
-(NSString *)smallBankerImageName;

/*
 * A method that return roadmap zing player image name
 *
 * @return string of zing player image name
 */
-(NSString *)zingPlayerImageName;

/*
 * A method that return roadmap zing banker image name
 *
 * @return string of zing banker image name
 */
-(NSString *)zingBankerImageName;


@end

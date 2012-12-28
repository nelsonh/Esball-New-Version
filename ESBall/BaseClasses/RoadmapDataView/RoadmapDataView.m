//
//  RoadmapDataView.m
//  ESBall
//
//  Created by Nelson on 12/6/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "RoadmapDataView.h"

@implementation RoadmapDataView

@synthesize theDelegate = _theDelegate;
@synthesize table = _table;
@synthesize method = _method;
@synthesize sections = _sections;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)dealloc
{
    for(UIView *childView in self.subviews)
    {
        [childView removeFromSuperview];
    }
}

#pragma mark - public interface
-(void)initilize
{
    
}

-(void)initilizeWithDelegate:(id<RoadmapDataViewDelegate>)delegate
{
    _theDelegate = delegate;
    
    [self initilize];
}

-(void)prepareToDraw
{
    self.delegate = self;
}

-(void)updateView
{
    [self prepareToDraw];
}

#pragma mark - UIScrollView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if([self.theDelegate respondsToSelector:@selector(RoadmapDataViewDidScroll:)])
    {
        [self.theDelegate RoadmapDataViewDidScroll:self];
    }
}

#pragma mark - getter setter
-(NSUInteger)sections
{
    return numberOfSections;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

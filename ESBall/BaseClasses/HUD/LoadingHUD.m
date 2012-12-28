//
//  LoadingHUD.m
//  ESBall
//
//  Created by Nelson on 12/12/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import "LoadingHUD.h"
#import "FileFinder.h"

@implementation LoadingHUD

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
    NSLog(@"Loading HUD dealloc");
    
    if(loadingAnimView)
        [loadingAnimView stopAnimating];
}

- (id)initWithFrame:(CGRect)frame loadingAnimImages:(NSArray *)animImages
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        FileFinder *fileFinder = [FileFinder fileFinder];
        UIImageView *loadingBg = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:@"Loading_bg@2x.png"]]];
        loadingBg.frame = self.bounds;
        [self addSubview:loadingBg];
        
        loadingAnimView = [[UIImageView alloc] init];
        loadingAnimView.animationImages = animImages;
        loadingAnimView.animationDuration = animImages.count/30;
        loadingAnimView.animationRepeatCount = 0;
        CGFloat halfWidth = 60/2;
        CGFloat halfHeight = 60/2;
        CGFloat xPos = (frame.size.width/2) - halfWidth;
        CGFloat yPos = (frame.size.height/2) - halfHeight;
        loadingAnimView.frame = CGRectMake(xPos, yPos, 60, 60);
        
        [self addSubview:loadingAnimView];
        
        [loadingAnimView startAnimating];
        
    }
    return self;
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

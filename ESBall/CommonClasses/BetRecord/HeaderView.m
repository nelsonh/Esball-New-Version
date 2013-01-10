//
//  HeaderView.m
//  ESBall
//
//  Created by Nelson on 1/9/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

#import "HeaderView.h"
#import "FileFinder.h"

@implementation HeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame withTitleName:(NSString *)title withTitleXPosition:(CGFloat)titleXPos withTitleColor:(UIColor *)titleColor withBackgroundImageName:(NSString *)imageName
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        FileFinder *fileFinder = [FileFinder fileFinder];
        
        //background image
        UIImage *backImage = [UIImage imageWithContentsOfFile:[fileFinder findPathForFileWithFileName:imageName]];
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:frame];
        backgroundImageView.image = backImage;
        
        [self addSubview:backgroundImageView];
        
        //title label
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleXPos, 0, 0, frame.size.height)];
        titleLabel.textColor = titleColor;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.text = title;
        [titleLabel sizeToFit];
        
        
        [self addSubview:titleLabel];
        
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

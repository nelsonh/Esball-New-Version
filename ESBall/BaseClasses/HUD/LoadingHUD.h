//
//  LoadingHUD.h
//  ESBall
//
//  Created by Nelson on 12/12/12.
//  Copyright (c) 2012 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingHUD : UIView{
    
    UIImageView *loadingAnimView;
}

- (id)initWithFrame:(CGRect)frame loadingAnimImages:(NSArray *)animImages;

@end

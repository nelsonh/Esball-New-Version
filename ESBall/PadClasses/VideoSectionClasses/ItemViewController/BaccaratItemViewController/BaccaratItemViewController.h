//
//  BaccaratItemViewController.h
//  ESBall
//
//  Created by Nelson on 1/28/13.
//  Copyright (c) 2013 nelson. All rights reserved.
//

//subclass of ItemViewController

#import "ItemViewController.h"

@interface BaccaratItemViewController : ItemViewController{
    
    __weak UIImageView *roadmapImageView;
}

@property (nonatomic, weak) IBOutlet UIView *roadmapRefView;

@end

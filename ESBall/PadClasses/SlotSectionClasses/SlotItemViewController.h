//
//  SlotItemViewController.h
//  ESBall
//
//  Created by tomneo2004 on 12/11/27.
//  Copyright (c) 2012年 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemViewController.h"

@interface SlotItemViewController : ItemViewController{
    
    UIImage *slotImage;
}

@property (nonatomic, readwrite) UIImage *imageForSlot;

@end

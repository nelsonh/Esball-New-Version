//
//  PhoneVideoSectionChangeControllerViewController.h
//  ESBall
//
//  Created by mobile on 13/1/3.
//  Copyright (c) 2013年 nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadingHUD.h"

@interface PhoneVideoSectionChangeControllerViewController : UIViewController
{
    UILabel *labchang1,*labchang2,*labchang3,*labchang4,*labchang5,*labchang6,*labchang7,*labchang8,*labchang9,*labchang10;
    UIButton *btnchang1,*btnchang2,*btnchang3,*btnchang4,*btnchang5,*btnchang6,*btnchang7,*btnchang8,*btnchang9,*btnchang10;
    UIButton *btnPrevious;
    UILabel *changeTitle;
    UIImageView *changeBG,*changeFront,*changeTop,*changeUnder;
    LoadingHUD *loadingHUD;
    
}
@property (nonatomic,retain) IBOutlet UILabel *labchang1,*labchang2,*labchang3,*labchang4,*labchang5,*labchang6,*labchang7,*labchang8,*labchang9,*labchang10;
@property (nonatomic,retain) IBOutlet UIButton *btnchang1,*btnchang2,*btnchang3,*btnchang4,*btnchang5,*btnchang6,*btnchang7,*btnchang8,*btnchang9,*btnchang10,*btnPrevious;
@property (nonatomic,retain) IBOutlet UIImageView *changeBG,*changeFront,*changeTop,*changeUnder;
@property (nonatomic,retain) IBOutlet UILabel *changeTitle;
@property (nonatomic,retain) IBOutlet  LoadingHUD *loadingHUD;

- (IBAction) down_changeICO1;
- (IBAction) down_changeICO2;
- (IBAction) down_changeICO3;
- (IBAction) down_changeICO4;
- (IBAction) down_changeICO5;
- (IBAction) down_changeICO6;
- (IBAction) down_changeICO7;
- (IBAction) down_changeICO8;
- (IBAction) down_changeICO9;
- (IBAction) down_changeIC10;
- (IBAction) down_changetable;
@end

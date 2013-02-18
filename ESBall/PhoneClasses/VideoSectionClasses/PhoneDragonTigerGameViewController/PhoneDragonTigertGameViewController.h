//
//  PhoneDragonTigertGameViewController.h
//  ESBall
//
//  Created by mobile on 13/1/22.
//  Copyright (c) 2013年 nelson. All rights reserved.
//

#import "CommonDragonTigerGameViewController.h"
#import "DragonTigerBetRecordViewController.h"
#import "LoadingHUD.h"

@interface PhoneDragonTigertGameViewController : CommonDragonTigerGameViewController{
    
    LoadingHUD *loadingHUD;
    bool firstLoading;
}

@end

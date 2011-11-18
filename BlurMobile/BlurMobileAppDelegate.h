//
//  BlurMobileAppDelegate.h
//  BlurMobile
//
//  Created by Chris D'Agostino on 11/17/11.
//  Copyright 2011 Near Infinity Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

@interface BlurMobileAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    
    NSMutableArray *currentEmployees;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property(nonatomic, retain) NSMutableArray *currentEmployees;

@end

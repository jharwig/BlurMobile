//
//  BlurMobileAppDelegate.m
//  BlurMobile
//
//  Created by Chris D'Agostino on 11/17/11.
//  Copyright 2011 Near Infinity Corporation. All rights reserved.
//

#import "BlurMobileAppDelegate.h"
#import "EmployeeFactory.h"

@implementation BlurMobileAppDelegate

@synthesize window=_window;

@synthesize tabBarController=_tabBarController;

@synthesize currentEmployees;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the tab bar controller's current view as a subview of the window
    
    NSLog(@"Device Model is %@", [[UIDevice currentDevice] model]);
    NSLog(@"Device Name is %@", [[UIDevice currentDevice] name]);
    NSLog(@"Device SystemName is %@", [[UIDevice currentDevice] systemName]);
    NSLog(@"Device SystemVersion is %@", [[UIDevice currentDevice] systemVersion]);
    
   // If the device is the iPad, load the master list of employees
    
    if (IS_SERVER) {
        NSLog(@"Loading employees");
         EmployeeFactory *ef = [EmployeeFactory instance];
        self.currentEmployees = [ef loadAllEmployees];
        [ef printAll];
         
     }
        
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}


- (void)setCurrentEmployees:(NSMutableArray *)c {
    if (currentEmployees != c) {
        [currentEmployees release];
        currentEmployees = [c retain];
        
        
        NSArray *controllers = [self.tabBarController viewControllers];
        for (UIViewController *vc in controllers) {
            if ([vc respondsToSelector:@selector(setCurrentEmployees:)]) {
                [(id)vc setCurrentEmployees:currentEmployees];
            }
        }
    }
}

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [currentEmployees release];
    [super dealloc];
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end

//
//  AppDelegate.m
//  SoFit
//
//  Created by Prakash Subramanian on 3/20/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import "AppDelegate.h"
#import "WorkOutRoutines.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    Let_sGetStarted *letsGetStartedObj = [[Let_sGetStarted alloc]init];
    tabBarObj = [[UITabBarController alloc] init];
    tabBarObj.viewControllers = [NSArray arrayWithObjects:letsGetStartedObj, nil];
    
    [self splashScreenFunction];
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)splashScreenFunction
{
    SplashScreen *splashObject = [[SplashScreen alloc] initWithNibName:@"SplashScreen" bundle:nil];
    [self.window addSubview:splashObject.view];
    
    timer =  [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(loginScreenFunction) userInfo:nil repeats:NO];
        
}

-(void)loginScreenFunction
{
//   loginObj = [[loginScreen alloc] initWithNibName:@"loginScreen" bundle:nil];
//    navigationObj = [[UINavigationController alloc] init ];
//    [navigationObj pushViewController:loginObj animated:YES];
//    [self.window addSubview:navigationObj.view];
  
  
  
  
  WorkOutRoutines *workOutRoutines = [[WorkOutRoutines alloc] init] ;
  workOutRoutines = [[WorkOutRoutines alloc] initWithNibName:@"workOutRoutines" bundle:nil];
  navigationObj = [[UINavigationController alloc] init ];
  [navigationObj pushViewController:workOutRoutines animated:YES];
  [self.window addSubview:navigationObj.view];
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

@end

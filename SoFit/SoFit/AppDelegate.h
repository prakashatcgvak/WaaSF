//
//  AppDelegate.h
//  SoFit
//
//  Created by Prakash Subramanian on 3/20/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplashScreen.h"
#import "LoginView.h"
#import "LetsGetStarted.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSTimer *timer;
    LoginView *loginObj;
  
  
    UINavigationController *navigationObj;
    UITabBarController *tabBarObj;
}

@property (strong, nonatomic) UIWindow *window;


-(void)splashScreenFunction;
-(void)loginScreenFunction;

@end

//
//  MINetworkViewController.h
//  SoFit
//
//  Created by Prakash on 21/03/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WhoIsNearViewController.h"
#import "PokeFriendViewController.h"
#import "GymLocatorViewController.h"
#import "NetworkToFBViewController.h"
@interface MINetworkViewController : UIViewController<UIAlertViewDelegate>
{
    UIAlertView *userPrivacyAlert;  
}

@property (strong, nonatomic) IBOutlet UIButton *whoIsNearButton;
@property (strong, nonatomic) IBOutlet UIButton *pokeFriendButton;
@property (strong, nonatomic) IBOutlet UIButton *gymLocatorButton;
@property (strong, nonatomic) IBOutlet UIButton *networkToFBButton;
@property (strong, nonatomic) IBOutlet UIButton *goForBrokeButton;

@property (strong, nonatomic) IBOutlet UISwitch *privacySwitch;

@property (strong, nonatomic) WhoIsNearViewController *whoIsNearViewObject;
@property (strong, nonatomic) PokeFriendViewController *pokeFriendViewObject;
@property (strong, nonatomic) GymLocatorViewController *gymLocatorViewObject;
@property (strong, nonatomic) NetworkToFBViewController *nwToFBViewObject;

- (IBAction)GotoWhoIsNearView;
- (IBAction)GotoPokeFriendView;
- (IBAction)GotoGymLocatorView;
- (IBAction)GotoNetworkToFBView;
- (IBAction)GotoGoForBrokeView;

- (IBAction)setUserPrivacy:(id)sender;

@end

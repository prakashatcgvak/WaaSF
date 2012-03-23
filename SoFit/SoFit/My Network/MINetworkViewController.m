//
//  MINetworkViewController.m
//  SoFit
//
//  Created by Prakash on 21/03/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import "MINetworkViewController.h"

@implementation MINetworkViewController
@synthesize whoIsNearButton;
@synthesize pokeFriendButton;
@synthesize gymLocatorButton;
@synthesize networkToFBButton;
@synthesize goForBrokeButton;
@synthesize privacySwitch;

@synthesize whoIsNearViewObject;
@synthesize pokeFriendViewObject;
@synthesize gymLocatorViewObject;
@synthesize nwToFBViewObject;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"MI~Network";
    //[self.tabBarController.tabBar setHidden:FALSE];
}

- (void)viewDidUnload
{
    [self setWhoIsNearButton:nil];
    [self setPokeFriendButton:nil];
    [self setGymLocatorButton:nil];
    [self setNetworkToFBButton:nil];
    [self setGoForBrokeButton:nil];
    [self setPrivacySwitch:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)GotoGymLocatorView {
    
    gymLocatorViewObject = [[GymLocatorViewController alloc]init];
    [self.navigationController pushViewController:gymLocatorViewObject animated:YES];
    gymLocatorViewObject = nil;
}

- (IBAction)GotoNetworkToFBView {
    
    nwToFBViewObject = [[NetworkToFBViewController alloc]init];
    [self.navigationController pushViewController:nwToFBViewObject animated:YES];
    nwToFBViewObject = nil;
}

- (IBAction)GotoGoForBrokeView {
}

- (IBAction)setUserPrivacy:(id)sender {
    
    UISwitch *tempSwitch = (UISwitch *)sender;
    
    if (tempSwitch.isOn) {
        userPrivacyAlert = [[UIAlertView alloc]initWithTitle:@"" 
                                                     message:@"This will be switched off after two hours" 
                                                    delegate:self 
                                           cancelButtonTitle:@"Ok" 
                                           otherButtonTitles: nil];
        [userPrivacyAlert show];
        userPrivacyAlert = nil;
    }
        
    
}

- (IBAction)GotoWhoIsNearView {
    
    whoIsNearViewObject = [[WhoIsNearViewController alloc]init];
    [self.navigationController pushViewController:whoIsNearViewObject animated:YES];
    whoIsNearViewObject = nil;
    
}

- (IBAction)GotoPokeFriendView {
    
    pokeFriendViewObject = [[PokeFriendViewController alloc]init];
    [self.navigationController pushViewController:pokeFriendViewObject animated:YES];
    pokeFriendViewObject = nil;
    
}
@end

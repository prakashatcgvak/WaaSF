//
//  loginScreen.m
//  SoFit
//
//  Created by Vijay Sasidaran on 21/03/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView
@synthesize userNameTxtField;
@synthesize passwordTxtField;
@synthesize loginBtn;
@synthesize forgetPwdBtn;
@synthesize keepLogInBtn;

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
    self.title = @"LOGIN";
   [super viewDidLoad];
 
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tabBarController.tabBar setHidden:YES];
}
-(void)submitBtn
{
    LetsGetStarted *letsGetStared = [[LetsGetStarted alloc] initWithNibName:@"LetsGetStarted" bundle:nil];
    [self.navigationController pushViewController:letsGetStared animated:YES];
    
}

-(void)forgotPwdFunction
{
    ForgotPassword *forgetPwdObj = [[ForgotPassword alloc] initWithNibName:@"ForgotPassword" bundle:nil];
    [self.navigationController pushViewController:forgetPwdObj animated:YES];
}

- (void)viewDidUnload
{
    [self setUserNameTxtField:nil];
    [self setPasswordTxtField:nil];
    [self setLoginBtn:nil];
    [self setForgetPwdBtn:nil];
    [self setKeepLogInBtn:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

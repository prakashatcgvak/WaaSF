//
//  UserRegistration.m
//  SoFit
//
//  Created by Vijay Sasidaran on 21/03/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import "UserRegistration.h"

@implementation UserRegistration
@synthesize userImageView;
@synthesize firstNameTxtField;
@synthesize lastNameTxtField;
@synthesize userNameTxtField;
@synthesize passwordTxtField;
@synthesize emailTxtField;
@synthesize forgetPwdBtn;
@synthesize keppMeLogInBtn;
@synthesize submitBtn;
 

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
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tabBarController.tabBar setHidden:YES];
}

-(IBAction)loginPage
{
     loginObj = [[LoginView alloc] initWithNibName:@"LoginView" bundle:nil];
    [self.navigationController pushViewController:loginObj animated:YES];
}

-(void)forgotPwdFunction
{
    ForgotPassword *forgotPwdObj = [[ForgotPassword alloc] initWithNibName:@"ForgotPassword" bundle:nil];
    [self.navigationController pushViewController:forgotPwdObj animated:YES];
}
 
- (void)viewDidUnload
{
    [self setUserImageView:nil];
    [self setFirstNameTxtField:nil];
    [self setLastNameTxtField:nil];
    [self setUserNameTxtField:nil];
    [self setPasswordTxtField:nil];
    [self setEmailTxtField:nil];
    [self setForgetPwdBtn:nil];
    [self setKeppMeLogInBtn:nil];
    [self setSubmitBtn:nil];
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

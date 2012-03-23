//
//  Let'sGetStarted.m
//  SoFit
//
//  Created by Vijay Sasidaran on 21/03/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import "LetsGetStarted.h"

@implementation LetsGetStarted

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
    
    [self.tabBarController.tabBar setHidden:FALSE];
    [self.title = @""];
    
    UIBarButtonItem *aboutButton = [[UIBarButtonItem alloc] initWithTitle:@"About" style:UIBarButtonItemStyleDone target:self action:@selector(aboutBtnFunction)];
    self.navigationItem.leftBarButtonItem = aboutButton;
    
    UIBarButtonItem *logOutButton = [[UIBarButtonItem alloc] initWithTitle:@"LogOut" style:UIBarButtonItemStyleDone target:self action:@selector(logOutFunction)];
	 self.navigationItem.rightBarButtonItem = logOutButton;
     [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)aboutBtnFunction
{
    AboutWazzApp *aboutObj = [[AboutWazzApp alloc] initWithNibName:@"AboutWazzApp" bundle:nil];
    [self.navigationController pushViewController:aboutObj animated:YES];
}

-(void)logOutFunction
{
    [self.navigationController popViewControllerAnimated:YES];
}
 

- (void)viewDidUnload
{
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

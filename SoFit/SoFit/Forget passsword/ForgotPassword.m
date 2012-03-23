//
//  ForgotPassword.m
//  SoFit
//
//  Created by Vijay Sasidaran on 22/03/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import "ForgotPassword.h"

@implementation ForgotPassword

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
    self.title = @"FORGOT PASSWORD";
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(gotoUserRegFunction)];
	backButton.title = @"Back";
	self.navigationItem.leftBarButtonItem = backButton;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)gotoUserRegFunction
{
     [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)submitFunction
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

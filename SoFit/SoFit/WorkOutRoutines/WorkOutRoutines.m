//
//  WorkOutRoutines.m
//  SoFit
//
//  Created by Prakash Subramanian on 3/21/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import "WorkOutRoutines.h"
#import "WeightManagementCardio.h"
#import "StrengthList.h"
#import "TextFormattingClass.h"


@implementation WorkOutRoutines

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

- (void)viewWillAppear:(BOOL)animated{  
  TextFormattingClass *textFormattingClass = [[TextFormattingClass alloc] init];  
  self.navigationItem.titleView = [textFormattingClass setNavigationtitleWithString:@"Work Out Routines"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)buttonClicked:(id)sender{
  UIButton *btn = sender;
  switch (btn.tag) {
    case 1:             //  Weight Management / Cardio
    {
      WeightManagementCardio *weightManagementCardio = [[WeightManagementCardio alloc] init];
      [self.navigationController pushViewController:weightManagementCardio animated:YES];
    } 
      break;
    case 2:             //  Strength
    {
      StrengthList *strengthList = [[StrengthList alloc] init];
      [self.navigationController pushViewController:strengthList animated:YES];
    }
      break;
    case 3:             //  Sports performance
      
      break;
    case 4:             //  Custom
      
      break;
    case 5:             //  Mi~Tunes
      
      break;
    case 6:             //  Mi~Story Picture Book
      
      break;
  }
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

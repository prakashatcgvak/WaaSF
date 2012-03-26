//
//  WeightManagementCardio.m
//  SoFit
//
//  Created by Prakash Subramanian on 3/21/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import "StrengthCategory.h"
#import "TextFormattingClass.h"
#import <QuartzCore/QuartzCore.h>

@implementation StrengthCategory
@synthesize bannerIsVisible;
@synthesize add;
@synthesize edit;
@synthesize exerciseTable;
@synthesize strengthExerciseName;
@synthesize screenTitle;

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
  exerciseTable.backgroundColor = [UIColor clearColor];
  self.navigationItem.titleView = [textFormattingClass setNavigationtitleWithString:screenTitle];
  [textFormattingClass bannerView:self.view];
  self.bannerIsVisible = YES;
}

- (void)viewDidLoad
{
  strengthExerciseName = [[NSMutableArray array] init ];                        
  [strengthExerciseName addObject:@"Bench, Flat"];
  [strengthExerciseName addObject:@"Bench, Incline"];
  [strengthExerciseName addObject:@"Bench, Decline"];
  [strengthExerciseName addObject:@"Dips"];
  [super viewDidLoad];
  
  // Do any additional setup after loading the view from its nib.
}

- (IBAction)buttonClicked:(id)sender{
  UIButton *btn = sender;
  switch (btn.tag) {
    case 1:     //Edit Exercise Table
      if ([edit.titleLabel.text isEqualToString:@"Edit"]) {
        [exerciseTable setEditing:YES animated:YES]; 
        [edit setTitle:@"Done" forState:UIControlStateNormal];
      }
      else {
        [exerciseTable setEditing:NO animated:YES];
        [edit setTitle:@"Edit" forState:UIControlStateNormal];  
      }
      break;      
    case 2:     //Add Exercise
    {
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                      message:[NSString stringWithFormat:@"Your Custom %@ Workout \n\n\n",screenTitle]
                                                     delegate:self
                                            cancelButtonTitle:@"Cancel"
                                            otherButtonTitles:@"Ok", nil];
      UITextField *addCustomExercise = [[UITextField alloc]initWithFrame:CGRectMake(40, 75, 200, 30)];
      
      NSDateFormatter *dateTimeFormat = [[NSDateFormatter alloc] init] ;
        [dateTimeFormat setDateFormat:@"EEEE MM/dd"];
      addCustomExercise.text = [NSString stringWithFormat:@"%@ - Strength",[dateTimeFormat stringFromDate:[NSDate date]] ];
      addCustomExercise.backgroundColor = [UIColor whiteColor];
      addCustomExercise.layer.cornerRadius = 5;
      addCustomExercise.delegate = self;
      addCustomExercise.autocorrectionType=UITextAutocorrectionTypeNo;
      [alert addSubview:addCustomExercise];
      [alert bringSubviewToFront:addCustomExercise];
      
//      CATransition *tr=[CATransition animation];
//      tr.duration=0.9;
//      tr.type=kCATransitionMoveIn;
//      tr.subtype=kCATransitionFromBottom;
//      [alert.layer addAnimation:tr forKey:nil];
      
      [alert show];
      [addCustomExercise becomeFirstResponder];
    } 
      break;
  }
}


#pragma mark - TableView


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
  return [strengthExerciseName count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{	  
  static NSString *CellIdentifier = @"Cell";  
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) { 
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
	else {
    if ([cell.contentView subviews]) {
      for (UIView *subview in [cell.contentView subviews]) {
        [subview removeFromSuperview];
      }
    }
	}
  
  cell.backgroundColor = [UIColor clearColor];
  cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
  cell.textLabel.text = [strengthExerciseName objectAtIndex:indexPath.row]; 
  
  UIImageView *workStatusImage = [[UIImageView alloc]initWithFrame:CGRectMake(270, 13, 20, 20)];
  workStatusImage.image = [UIImage imageNamed:@"Check.png"];
  [cell.contentView addSubview:workStatusImage];
  
  return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
  return TRUE;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(editingStyle == UITableViewCellEditingStyleDelete)
	{
    [strengthExerciseName removeObjectAtIndex:indexPath.row];
    [exerciseTable reloadData];
    [exerciseTable setEditing:YES animated:YES];
  }
}

- (void)viewDidUnload
{
  [self setExerciseTable:nil];
  [self setEdit:nil];
  [self setAdd:nil];
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

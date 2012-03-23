//
//  WeightManagementCardio.m
//  SoFit
//
//  Created by Prakash Subramanian on 3/21/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import "WeightManagementCardio.h"
#import "TestFormattingClass.h"
#import "CardioWorkout.h"

@implementation WeightManagementCardio
@synthesize bannerIsVisible;
@synthesize add;
@synthesize edit;
@synthesize exerciseTable;
@synthesize cardioExerciseName;

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
  TestFormattingClass *testFormattingClass = [[TestFormattingClass alloc] init];  
  exerciseTable.backgroundColor = [UIColor clearColor];
  self.navigationItem.titleView = [testFormattingClass setNavigationtitleWithString:@"CARDIO"];
}

- (void)viewDidLoad
{
  cardioExerciseName = [[NSMutableArray array] init ];                        
  [cardioExerciseName addObject:@"Thread Mill"];
  [cardioExerciseName addObject:@"Elliptical"];
    [super viewDidLoad];
  
  adView = [[ADBannerView alloc] initWithFrame:CGRectMake(0.0, 400.0, 320.0, 40.0)];
  adView.requiredContentSizeIdentifiers = [NSSet setWithObject:ADBannerContentSizeIdentifierPortrait];
  adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
  [self.view addSubview:adView];
  adView.delegate=self;
  self.bannerIsVisible=NO;

    // Do any additional setup after loading the view from its nib.
}

#pragma mark - iAdd

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
  if (!self.bannerIsVisible)
  {
    [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
    // banner is invisible now and moved out of the screen on 50 px
    banner.frame = CGRectOffset(banner.frame, 0, -50);
    [UIView commitAnimations];
    self.bannerIsVisible = YES;
  }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
  if (self.bannerIsVisible)
  {
    [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
    // banner is visible and we move it out of the screen, due to connection issue
    banner.frame = CGRectOffset(banner.frame, 0, 50);
    [UIView commitAnimations];
    self.bannerIsVisible = NO;
  }
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
  return [cardioExerciseName count];
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
  cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
  cell.textLabel.text = [cardioExerciseName objectAtIndex:indexPath.row]; 
  
  UIImageView *workStatusImage = [[UIImageView alloc]initWithFrame:CGRectMake(270, 13, 20, 20)];
  workStatusImage.image = [UIImage imageNamed:@"UnCheck.png"];
  [cell.contentView addSubview:workStatusImage];
  
  return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  CardioWorkout *cardioWorkout = [[CardioWorkout alloc] init];
  cardioWorkout.screenTitle = [cardioExerciseName objectAtIndex:indexPath.row];
  [self.navigationController pushViewController:cardioWorkout animated:YES];
}
 
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
  return TRUE;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(editingStyle == UITableViewCellEditingStyleDelete)
	{
    [cardioExerciseName removeObjectAtIndex:indexPath.row];
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

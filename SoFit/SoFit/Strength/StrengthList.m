//
//  StrengthList.m
//  SoFit
//
//  Created by Prakash Subramanian on 3/26/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import "StrengthList.h"
#import "TextFormattingClass.h"
#import "StrengthCategory.h"

@implementation StrengthList
@synthesize bannerIsVisible;
@synthesize workoutList;
@synthesize exerciseName;

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
  TextFormattingClass *textFormattingClass = [[TextFormattingClass alloc] init];  
//  exerciseTable.backgroundColor = [UIColor clearColor];
  self.navigationItem.titleView = [textFormattingClass setNavigationtitleWithString:@"STRENGTH"];
  [textFormattingClass bannerView:self.view];
  self.bannerIsVisible = YES;
  exerciseName =  [[NSMutableArray alloc] initWithObjects:@"Chest",@"Legs & Buttocks",@"Core",@"Arms",@"Shoulders",@"Back", nil];  
    [super viewDidLoad];  
  // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
  [self setWorkoutList:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
  return [exerciseName count];
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
  
  UIImageView *imageView = [[UIImageView alloc] init];
  imageView.image = [UIImage imageNamed:@"workout.png"];
  [imageView setFrame:CGRectMake(5, 15, 60, 60)];
  [cell.contentView addSubview:imageView];
  
  UILabel *workoutName = [[UILabel alloc] initWithFrame:CGRectMake(70, 25, 135, 40)];
  workoutName.numberOfLines = 2;
  workoutName.backgroundColor = [UIColor clearColor];
  workoutName.text = [exerciseName objectAtIndex:indexPath.row];
  workoutName.font = [UIFont boldSystemFontOfSize:16.0f];
  [cell.contentView addSubview:workoutName];

  UILabel *workoutDescription1 = [[UILabel alloc] initWithFrame:CGRectMake(205, 3, 175, 20)];
  workoutDescription1.backgroundColor = [UIColor clearColor];
  workoutDescription1.text = @"B-Over";
  workoutDescription1.textColor = [UIColor grayColor];
  workoutDescription1.font = [UIFont italicSystemFontOfSize:12];
  [cell.contentView addSubview:workoutDescription1];

  
  UILabel *workoutDescription2 = [[UILabel alloc] initWithFrame:CGRectMake(205, 24, 175, 20)];
  workoutDescription2.backgroundColor = [UIColor clearColor];
  workoutDescription2.text = @"B-Over Lat Raises";
  workoutDescription2.textColor = [UIColor grayColor];
  workoutDescription2.font = [UIFont italicSystemFontOfSize:12];
  [cell.contentView addSubview:workoutDescription2];

  
  UILabel *workoutDescription3 = [[UILabel alloc] initWithFrame:CGRectMake(205,45, 175, 20)];
  workoutDescription3.backgroundColor = [UIColor clearColor];
  workoutDescription3.text = @"B-Over Lat";
  workoutDescription3.textColor = [UIColor grayColor];
  workoutDescription3.font = [UIFont italicSystemFontOfSize:12];
  [cell.contentView addSubview:workoutDescription3];

  UILabel *workoutDescription4 = [[UILabel alloc] initWithFrame:CGRectMake(205, 66, 175, 20)];
  workoutDescription4.backgroundColor = [UIColor clearColor];
  workoutDescription4.text = @"B-Over Lat Raises";
  workoutDescription4.textColor = [UIColor grayColor];
  workoutDescription4.font = [UIFont italicSystemFontOfSize:12];
  [cell.contentView addSubview:workoutDescription4];
  
  return  cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  StrengthCategory *strengthCategory = [[StrengthCategory alloc] init];
  strengthCategory.screenTitle = [NSString stringWithFormat:@"Strength~%@",[exerciseName objectAtIndex:indexPath.row]];
  [self.navigationController pushViewController:strengthCategory animated:YES];
}

#pragma mark - End of TableView

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

//
//  CardioWorkout.m
//  SoFit
//
//  Created by Prakash Subramanian on 3/21/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import "CardioWorkout.h"
#import "TextFormattingClass.h"

@implementation CardioWorkout
@synthesize meterConversion;
@synthesize intensityEasy;
@synthesize intensityCombo;
@synthesize intensityDifficult;
@synthesize countUp;
@synthesize countDown;
@synthesize Start;
@synthesize editTimer;
@synthesize submit;
@synthesize screenTitle;
@synthesize startTime;
@synthesize numberKeyPad;
@synthesize meterConversionArray;

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
  self.navigationItem.titleView = [textFormattingClass setNavigationtitleWithString:screenTitle];
  meterConversionArray = [[NSMutableArray alloc] initWithObjects:@"MPH",@"FPS",@"Hrs",@"Mins",@"Secs",@"Km/hr",@"m/hr",@"m/sec",nil];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
  if (self.numberKeyPad) {
  numberKeyPad.currentTextField = textField;
  }
  return YES;
}

- (void) textFieldDidBeginEditing:(UITextField *)textField { 
  
   if (textField.keyboardType == UIKeyboardTypeNumberPad) {
     if (!self.numberKeyPad) {
     // Show the numberKeyPad for very first number pad textfield
     self.numberKeyPad = [NumberKeypadDecimalPoint keypadForTextField:textField];
     }else {
     //for rest textfield which has number keypad 
     self.numberKeyPad.currentTextField = textField;
        }
    }
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
  [self.numberKeyPad removeButtonFromKeyboard];
  self.numberKeyPad = nil;  
}



- (IBAction)buttonClicked:(id)sender{
  UIButton *btn =   sender;
  switch (btn.tag) {
    case 1:      //MeterConversion
      tempMeterConversion = meterConversion.titleLabel.text;
      [self showPickerView];      
      [pickerview selectRow:[meterConversionArray indexOfObject:meterConversion.titleLabel.text] inComponent:0 animated:YES];
      break;
    case 2:      //IntensityEasy
      break;
    case 3:      //IntensityCombo
      break;
    case 4:      //IntensityDifficult
      break;
    case 5:      //CountUp
      break;
    case 6:      //Start
      break;
    case 7:      //CountDown
      break;
    case 8:      //Edit Timer
    {
      tempStartTime = startTime.text;
      [self showDatePicker];
      NSDateFormatter *df = [[NSDateFormatter alloc] init];
      [df setDateFormat:@"mm:ss"];
      [datePicker setDate:[df dateFromString:startTime.text] animated:YES];
    }
      break;
    case 9:      //Submit
      [self.navigationController popViewControllerAnimated:YES];
      break;
  }
}

#pragma mark - PickerView

- (void)showPickerView{
  actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];	
  [actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
  pickerview = [[UIPickerView alloc] initWithFrame:CGRectNull];
  pickerview.frame = CGRectMake(0,40,320,220);
  [pickerview setDelegate:self];
  [pickerview setShowsSelectionIndicator:YES];
  pickerview.autoresizingMask = UIViewAutoresizingFlexibleWidth;	
  
  UISegmentedControl *doneButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Done"]];
  doneButton.momentary = YES; 
  doneButton.tag = 1;
  doneButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
  doneButton.segmentedControlStyle = UISegmentedControlStyleBar;
  doneButton.tintColor = [UIColor blackColor];
  [doneButton addTarget:self action:@selector(dismissActionSheet:) forControlEvents:UIControlEventValueChanged];
  [actionSheet addSubview:doneButton];
  
  UISegmentedControl *cancelButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Cancel"]];
  cancelButton.momentary = YES; 
  cancelButton.tag = 2;
  cancelButton.frame = CGRectMake(10, 7.0f, 50.0f, 30.0f);
  cancelButton.segmentedControlStyle = UISegmentedControlStyleBar;
  cancelButton.tintColor = [UIColor blackColor];
  [cancelButton addTarget:self action:@selector(dismissActionSheet:) forControlEvents:UIControlEventValueChanged];
  [actionSheet addSubview:cancelButton];
  
  [actionSheet showInView:self.view];
  [actionSheet addSubview:pickerview]; 
  [actionSheet setBounds:CGRectMake(0, 0, 320, 450)];
}

//Picker View Function started
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
  return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component
{
  return [meterConversionArray count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  return [meterConversionArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component 
{
  [meterConversion setTitle:[meterConversionArray objectAtIndex:row] forState:UIControlStateNormal];
}

//Picker View Function ended

#pragma mark - DatePickerView
- (void)showDatePicker{
  actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];	
	[actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];  
	datePicker = [[UIDatePicker alloc] initWithFrame:CGRectNull];
	datePicker.frame = CGRectMake(0,40,320,225);
	datePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth;	
  datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
  
	UISegmentedControl *doneButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Done"]];
	doneButton.momentary = YES; 
  doneButton.tag = 3;
	doneButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
	doneButton.segmentedControlStyle = UISegmentedControlStyleBar;
	doneButton.tintColor = [UIColor blackColor];
	[doneButton addTarget:self action:@selector(dismissActionSheet:) forControlEvents:UIControlEventValueChanged];
	[actionSheet addSubview:doneButton];
  
  UISegmentedControl *cancelButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Cancel"]];
	cancelButton.momentary = YES; 
  cancelButton.tag = 4;
	cancelButton.frame = CGRectMake(10, 7.0f, 50.0f, 30.0f);
	cancelButton.segmentedControlStyle = UISegmentedControlStyleBar;
	cancelButton.tintColor = [UIColor blackColor];
	[cancelButton addTarget:self action:@selector(dismissActionSheet:) forControlEvents:UIControlEventValueChanged];
	[actionSheet addSubview:cancelButton];
  
	[actionSheet showInView:self.view];
  [actionSheet addSubview:datePicker]; 
	[actionSheet setBounds:CGRectMake(0, 0, 320, 450)];
}

///////

-(void)dismissActionSheet:(id)sender{
  UISegmentedControl *seg = sender;
  
  if (seg.tag == 1) {               //Done Button clicked in PickerView
    }    
    else if(seg.tag == 2){       //Cancel  Button clicked in PickerView
      [meterConversion setTitle:tempMeterConversion forState:UIControlStateNormal];
    }
    else if(seg.tag == 3){       //Done Button clicked in DatePicker      
      NSDateFormatter *df = [[NSDateFormatter alloc] init];
      [df setDateFormat:@"mm:ss"];
      startTime.text = [df stringFromDate:[datePicker date]];
    }
    else if(seg.tag == 4)  {     //Cancel Button clicked in DatePicker
      startTime.text = tempStartTime;
     }
      [actionSheet dismissWithClickedButtonIndex:0 animated:YES];
}



- (void)viewDidUnload
{
  [self setMeterConversion:nil];
  [self setIntensityEasy:nil];
  [self setIntensityCombo:nil];
  [self setIntensityDifficult:nil];
  [self setCountUp:nil];
  [self setCountDown:nil];
  [self setStart:nil];
  [self setEditTimer:nil];
  [self setSubmit:nil];
  [self setStartTime:nil];
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

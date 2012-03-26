//
//  CardioWorkout.h
//  SoFit
//
//  Created by Prakash Subramanian on 3/21/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NumberKeypadDecimalPoint.h"

@interface CardioWorkout : UIViewController<UIPickerViewDelegate> {
  UIActionSheet *actionSheet;
	UIPickerView *pickerview;
    UIDatePicker *datePicker;
  NSString *tempMeterConversion;
  NSString *tempStartTime;
//  NSMutableArray *meterConversionArray;
}
@property (strong, nonatomic) IBOutlet UILabel *startTime;
@property (nonatomic, retain)  NumberKeypadDecimalPoint *numberKeyPad;
@property (nonatomic, retain) NSMutableArray *meterConversionArray;
@property (strong, nonatomic) IBOutlet UIButton *meterConversion;
@property (strong, nonatomic) IBOutlet UIButton *intensityEasy;
@property (strong, nonatomic) IBOutlet UIButton *intensityCombo;
@property (strong, nonatomic) IBOutlet UIButton *intensityDifficult;
@property (strong, nonatomic) IBOutlet UIButton *countUp;
@property (strong, nonatomic) IBOutlet UIButton *countDown;
@property (strong, nonatomic) IBOutlet UIButton *Start;
@property (strong, nonatomic) IBOutlet UIButton *editTimer;
@property (strong, nonatomic) IBOutlet UIButton *submit;
@property (nonatomic, retain) NSString *screenTitle;
- (IBAction)buttonClicked:(id)sender;
- (void)showPickerView;
- (void)showDatePicker;
@end

//
//  WeightManagementCardio.h
//  SoFit
//
//  Created by Prakash Subramanian on 3/21/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StrengthCategory : UIViewController<UITextFieldDelegate>{
  BOOL bannerIsVisible;
}
@property (nonatomic,retain) NSString *screenTitle;
@property (nonatomic,assign) BOOL bannerIsVisible;
@property (strong, nonatomic) IBOutlet UIButton *add;
@property (strong, nonatomic) IBOutlet UIButton *edit;
@property (strong, nonatomic) IBOutlet UITableView *exerciseTable;
@property(nonatomic,retain) NSMutableArray *strengthExerciseName;
- (IBAction)buttonClicked:(id)sender;
@end

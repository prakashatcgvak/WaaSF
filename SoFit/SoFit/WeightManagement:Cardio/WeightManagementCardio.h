//
//  WeightManagementCardio.h
//  SoFit
//
//  Created by Prakash Subramanian on 3/21/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeightManagementCardio : UIViewController{
  BOOL bannerIsVisible;
}

@property (nonatomic,assign) BOOL bannerIsVisible;
@property (strong, nonatomic) IBOutlet UIButton *add;
@property (strong, nonatomic) IBOutlet UIButton *edit;
@property (strong, nonatomic) IBOutlet UITableView *exerciseTable;
@property(nonatomic,retain) NSMutableArray *cardioExerciseName;
- (IBAction)buttonClicked:(id)sender;
@end

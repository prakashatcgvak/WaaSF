//
//  StrengthList.h
//  SoFit
//
//  Created by Prakash Subramanian on 3/26/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StrengthList : UIViewController{
  BOOL bannerIsVisible;
}
@property (strong, nonatomic) IBOutlet UITableView *workoutList;
@property (nonatomic, retain) NSMutableArray *exerciseName;
@property (nonatomic,assign) BOOL bannerIsVisible;
@end

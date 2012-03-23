//
//  WeightManagementCardio.h
//  SoFit
//
//  Created by Prakash Subramanian on 3/21/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface WeightManagementCardio : UIViewController<ADBannerViewDelegate>{
  ADBannerView *adView;
  BOOL bannerIsVisible;
}

@property (nonatomic,assign) BOOL bannerIsVisible;
@property (weak, nonatomic) IBOutlet UIButton *add;
@property (weak, nonatomic) IBOutlet UIButton *edit;
@property (weak, nonatomic) IBOutlet UITableView *exerciseTable;
@property(nonatomic,retain) NSMutableArray *cardioExerciseName;
- (IBAction)buttonClicked:(id)sender;
@end

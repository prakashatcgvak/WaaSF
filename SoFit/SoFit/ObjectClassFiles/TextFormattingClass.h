//
//  TestFormattingClass.h
//  SoFit
//
//  Created by Prakash Subramanian on 3/21/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface TextFormattingClass : UIView<ADBannerViewDelegate>{
  ADBannerView *adView;
  BOOL bannerIsVisible;
}

@property (nonatomic,assign) BOOL bannerIsVisible;

- (UILabel *) setNavigationtitleWithString:(NSString *)navigationtitle;
- (void) bannerView:(UIView *)view;

@end

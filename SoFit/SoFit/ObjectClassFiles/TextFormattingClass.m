//
//  TestFormattingClass.m
//  SoFit
//
//  Created by Prakash Subramanian on 3/21/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import "TextFormattingClass.h"
#import <QuartzCore/QuartzCore.h>

@implementation TextFormattingClass
@synthesize bannerIsVisible;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) bannerView:(UIView *)view{
adView = [[ADBannerView alloc] initWithFrame:CGRectMake(0.0, 300.0, 320.0, 40.0)];
adView.requiredContentSizeIdentifiers = [NSSet setWithObject:ADBannerContentSizeIdentifierPortrait];
adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
[view addSubview:adView];
[view bringSubviewToFront:adView];
adView.delegate = self;
}

#pragma mark - iAdd

- (void)bannerViewWillLoadAd:(ADBannerView *)banner 

//- (void)bannerViewDidLoadAd:(ADBannerView *)banner
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

#pragma mark - - - - - - 


- (UILabel *) setNavigationtitleWithString:(NSString *)navigationtitle{
  UILabel *title = [[UILabel alloc] init];
  title.frame = CGRectMake(1.0, 150.0, 200.0, 40.0);  
  title.text = navigationtitle;
    title.textColor = [UIColor whiteColor];
//  title.layer.borderWidth = 2;
//  title.layer.borderColor = [UIColor redColor].CGColor;
  title.textAlignment = UITextAlignmentCenter;
  title.font = [UIFont boldSystemFontOfSize:18];
  title.backgroundColor = [UIColor clearColor];
  return title;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

//
//  TestFormattingClass.m
//  SoFit
//
//  Created by Prakash Subramanian on 3/21/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import "TestFormattingClass.h"
#import <QuartzCore/QuartzCore.h>

@implementation TestFormattingClass

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

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

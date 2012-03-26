//
//  DecimalPointButton.m
//  iDeal
//
//  Created by David Casserly on 13/03/2010.
//  Copyright 2010 devedup.com. All rights reserved.
//

#import "NumberKeypadDecimalPoint.h"

static UIImage *backgroundImageDepressed;

@implementation DecimalPointButton

+ (void) initialize {
	backgroundImageDepressed = [UIImage imageNamed:@"decimalKeyDownBackground.png"];
}

- (id) init {
	if(self = [super initWithFrame:CGRectMake(0, 480, 105, 53)]) { 
        
		[self setTitleColor:[UIColor colorWithRed:77.0f/255.0f green:84.0f/255.0f blue:98.0f/255.0f alpha:1.0] forState:UIControlStateNormal];	
		[self setBackgroundImage:backgroundImageDepressed forState:UIControlStateHighlighted];
		[self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        
        // change the title for BUTTON whether u want as DONE or DOT......
        
		[self setTitle:@"Done" forState:UIControlStateNormal];
        if ([self.titleLabel.text isEqualToString:@"."]) {
            self.titleLabel.font = [UIFont systemFontOfSize:30];
        }
        else
        {
            self.titleLabel.font = [UIFont systemFontOfSize:20];
        }
        
	}
	return self;
}

- (void)drawRect:(CGRect)rect {
	[super drawRect:rect];
	
	//show the button at same speed as keyboard
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.2]; 
	self.frame = CGRectMake(0, 427, 105, 53);
	[UIView commitAnimations];
}

+ (DecimalPointButton *) decimalPointButton {
	DecimalPointButton *button = [[DecimalPointButton alloc] init];
	return button;
}

@end


@implementation NumberKeypadDecimalPoint

static NumberKeypadDecimalPoint *keypad;

@synthesize decimalPointButton;
@synthesize showDecimalPointTimer;
@synthesize currentTextField;

#pragma mark -
#pragma mark Release

- (void) dealloc {
//	[decimalPointButton release];
//	[showDecimalPointTimer release];
//	[super dealloc];
}

- (void) addButtonToKeyboard:(DecimalPointButton *)button {	
	//Add a button to the top, above all windows
	NSArray *allWindows = [[UIApplication sharedApplication] windows];
	int topWindow = [allWindows count] - 1;
	UIWindow *keyboardWindow = [allWindows objectAtIndex:topWindow];
	[keyboardWindow addSubview:button];	
}

- (void) addTheDecimalPointToKeyboard {	
	[keypad addButtonToKeyboard:keypad.decimalPointButton];
}

- (void) decimalPointPressed {
	
    if ([keypad.decimalPointButton.titleLabel.text isEqualToString:@"Done"]) {
        [currentTextField resignFirstResponder];
    }
    else
    {
        NSString *currentText = currentTextField.text;
        if ([currentText rangeOfString:@"." options:NSBackwardsSearch].length == 0) {
            currentTextField.text = [currentTextField.text stringByAppendingString:@"."];
        }
    }
}


 //Show the keyboard
 
+ (NumberKeypadDecimalPoint *) keypadForTextField:(UITextField *)textField {
	if (!keypad) {
		keypad = [[NumberKeypadDecimalPoint alloc] init];
		keypad.decimalPointButton = [DecimalPointButton decimalPointButton];
		[keypad.decimalPointButton addTarget:keypad action:@selector(decimalPointPressed) forControlEvents:UIControlEventTouchUpInside];
	}
	keypad.currentTextField = textField;
	keypad.showDecimalPointTimer = [NSTimer timerWithTimeInterval:0.1 target:keypad selector:@selector(addTheDecimalPointToKeyboard) userInfo:nil repeats:NO];
	[[NSRunLoop currentRunLoop] addTimer:keypad.showDecimalPointTimer forMode:NSDefaultRunLoopMode];
	return keypad;
}


// Hide the keyboard

- (void) removeButtonFromKeyboard {
	[self.showDecimalPointTimer invalidate]; 
	[self.decimalPointButton removeFromSuperview];
}


@end


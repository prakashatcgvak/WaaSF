//
//  DecimalPointButton.h
//  iDeal
//
//  Created by David Casserly on 13/03/2010.
//  Copyright 2010 devedup.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DecimalPointButton : UIButton {
	
}

+ (DecimalPointButton *) decimalPointButton;

@end


@interface NumberKeypadDecimalPoint : NSObject {	
	UITextField *currentTextField;
	DecimalPointButton *decimalPointButton;
	NSTimer *showDecimalPointTimer;
}

@property (nonatomic, retain) NSTimer *showDecimalPointTimer;
@property (nonatomic, retain) DecimalPointButton *decimalPointButton;
@property (nonatomic, retain) UITextField *currentTextField;

#pragma mark -
#pragma mark Show the keypad

+ (NumberKeypadDecimalPoint *) keypadForTextField:(UITextField *)textField; 

- (void) removeButtonFromKeyboard;

@end



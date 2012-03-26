//
//  loginScreen.h
//  SoFit
//
//  Created by Vijay Sasidaran on 21/03/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LetsGetStarted.h"
#import "ForgotPassword.h"

@interface LoginView : UIViewController
{
    
}

@property (strong, nonatomic) IBOutlet UITextField *userNameTxtField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTxtField;

@property (strong, nonatomic) IBOutlet UIButton *loginBtn;
@property (strong, nonatomic) IBOutlet UIButton *forgetPwdBtn;
@property (strong, nonatomic) IBOutlet UIButton *keepLogInBtn;


-(IBAction)submitBtn ;
-(IBAction)forgotPwdFunction;

@end

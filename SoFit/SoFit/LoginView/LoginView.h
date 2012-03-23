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

@property (weak, nonatomic) IBOutlet UITextField *userNameTxtField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxtField;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgetPwdBtn;
@property (weak, nonatomic) IBOutlet UIButton *keepLogInBtn;


-(IBAction)submitBtn ;
-(IBAction)forgotPwdFunction;

@end

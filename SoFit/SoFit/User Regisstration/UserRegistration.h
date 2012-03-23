//
//  UserRegistration.h
//  SoFit
//
//  Created by Vijay Sasidaran on 21/03/12.
//  Copyright (c) 2012 cgvak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginView.h"
#import "ForgotPassword.h"
@interface UserRegistration : UIViewController
{
    LoginView *loginObj;
}

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;

@property (weak, nonatomic) IBOutlet UITextField *firstNameTxtField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTxtField;
@property (weak, nonatomic) IBOutlet UITextField *userNameTxtField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxtField;
@property (weak, nonatomic) IBOutlet UITextField *emailTxtField;

@property (weak, nonatomic) IBOutlet UIButton *forgetPwdBtn;
@property (weak, nonatomic) IBOutlet UIButton *keppMeLogInBtn;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

 


-(IBAction)loginPage;
-(IBAction)forgotPwdFunction;
 
@end

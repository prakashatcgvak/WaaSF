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

@property (strong, nonatomic) IBOutlet UIImageView *userImageView;

@property (strong, nonatomic) IBOutlet UITextField *firstNameTxtField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTxtField;
@property (strong, nonatomic) IBOutlet UITextField *userNameTxtField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTxtField;
@property (strong, nonatomic) IBOutlet UITextField *emailTxtField;

@property (strong, nonatomic) IBOutlet UIButton *forgetPwdBtn;
@property (strong, nonatomic) IBOutlet UIButton *keppMeLogInBtn;
@property (strong, nonatomic) IBOutlet UIButton *submitBtn;

 


-(IBAction)loginPage;
-(IBAction)forgotPwdFunction;
 
@end

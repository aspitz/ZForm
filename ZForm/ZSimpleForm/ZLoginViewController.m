//
//  ZLoginViewController.m
//  NavButtonSnoop
//
//  Created by Ayal Spitz on 8/21/13.
//  Copyright (c) 2013 spitz. All rights reserved.
//

#import "ZLoginViewController.h"
#import "ZButton.h"
#import "ZChevronImages.h"
#import "ZSimpleFormModel.h"
#import "ZSimpleFormViewController.h"

@interface ZLoginViewController ()
@property (nonatomic, strong) UIViewController *loginViewController;
@property (nonatomic, strong) UIViewController *signUpViewController;
@end

@implementation ZLoginViewController

- (id)init{
    self = [super init];
    if (self) {
        // build login model/view controller
        ZSimpleFormModel *loginFormModel = [ZSimpleFormModel model];
        [loginFormModel addCell:[ZSimpleTextFieldCell cellOfType:ZSimpleTextFieldCellEMailType withValue:@""] isRequired:YES];
        [loginFormModel addCell:[ZSimpleTextFieldCell cellOfType:ZSimpleTextFieldCellPasswordType withValue:@""] isRequired:YES];
        loginFormModel.leftButtonTitle = @"Sign up";
        loginFormModel.leftButtonImage = [ZChevronImages leftChevron];
        loginFormModel.rightButtonTitle = @"Login";
        loginFormModel.rightButtonImage = [ZChevronImages rightChevron];
        self.loginViewController = [ZSimpleFormViewController formWithModel:loginFormModel andCompletionBlock:^(SimpleFormButtonSide buttonType, NSArray *values) {
            if (buttonType == SimpleFormButtonLeft){
                [self slideToSignupViewController];
            }
        }];

        [self addChildViewController:self.loginViewController];
        [self.view addSubview:self.loginViewController.view];
        
        CGRect frame = CGRectZero;
        frame.size = self.view.frame.size;
        self.loginViewController.view.frame = frame;
        
        
        // build sign up model/view controller
        ZSimpleFormModel *signupFormModel = [ZSimpleFormModel model];
        [signupFormModel addCell:[ZSimpleTextFieldCell cellNamed:@"First Name" withValue:@""] isRequired:YES];
        [signupFormModel addCell:[ZSimpleTextFieldCell cellNamed:@"Last Name" withValue:@""] isRequired:YES];
        [signupFormModel addCell:[ZSimpleTextFieldCell cellOfType:ZSimpleTextFieldCellZipcodeType withValue:@""] isRequired:YES];
        [signupFormModel addCell:[ZSimpleTextFieldCell cellOfType:ZSimpleTextFieldCellEMailType withValue:@""] isRequired:YES];
        [signupFormModel addCell:[ZSimpleTextFieldCell cellOfType:ZSimpleTextFieldCellPasswordType withValue:@""] isRequired:YES];
        signupFormModel.leftButtonTitle = @"Cancel";
        signupFormModel.rightButtonTitle = @"Sign up";
        signupFormModel.rightButtonImage = [ZChevronImages rightChevron];
        self.signUpViewController = [ZSimpleFormViewController formWithModel:signupFormModel andCompletionBlock:^(SimpleFormButtonSide buttonType, NSArray *values) {
            if (buttonType == SimpleFormButtonLeft){
                // clear form
            }
            [self slideToLoginViewController];
        }];

        [self addChildViewController:self.signUpViewController];
        [self.view addSubview:self.signUpViewController.view];
        
        frame = CGRectZero;
        frame.size = self.view.frame.size;
        frame.origin.x = -self.view.frame.size.width;
        self.signUpViewController.view.frame = frame;
    }
    
    return self;
}

- (void)slideToSignupViewController{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.signUpViewController.view.frame;
        frame.origin.x += frame.size.width;
        self.signUpViewController.view.frame = frame;
        
        frame = self.loginViewController.view.frame;
        frame.origin.x += frame.size.width;
        self.loginViewController.view.frame = frame;
    }];
}

- (void)slideToLoginViewController{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.signUpViewController.view.frame;
        frame.origin.x -= frame.size.width;
        self.signUpViewController.view.frame = frame;
        
        frame = self.loginViewController.view.frame;
        frame.origin.x -= frame.size.width;
        self.loginViewController.view.frame = frame;
    }];
}

@end

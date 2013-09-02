//
//  ZLoginViewController.m
//
//  Created by Ayal Spitz on 8/27/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZLoginViewController.h"
#import "ZSimpleFormModel.h"
#import "ZSimpleTextFieldCell.h"
#import "ZSimpleFormViewController.h"
#import "ZDrawView.h"
#import "ZCircularButton.h"
#import "ZChevronImages.h"
#import "ZButton.h"

@interface ZLoginViewController ()

@property (nonatomic, strong) ZSimpleFormViewController *simpleFormViewController;
@property (nonatomic, strong) ZSimpleFormModel *model;

@end


@implementation ZLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.model = [ZSimpleFormModel model];
    [self.model add:@{TYPE_KEY:@(ZSimpleFormElementEMailType), REQUIRED_KEY:@YES}];
    [self.model add:@{TYPE_KEY:@(ZSimpleFormElementPasswordType), REQUIRED_KEY:@YES}];
    self.model.defaultTextAlignment = NSTextAlignmentCenter;
    
    self.simpleFormViewController = [[ZSimpleFormViewController alloc]init];
    self.simpleFormViewController.model = self.model;
    
    [self addChildViewController:self.simpleFormViewController];
    [self.view addSubview:self.simpleFormViewController.view];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.simpleFormViewController.view
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:60.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.simpleFormViewController.view
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:self.model.count * 44.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.simpleFormViewController.view
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:40.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.simpleFormViewController.view
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:-40.0]];

    self.simpleFormViewController.view.layer.cornerRadius = 5.0;
    self.simpleFormViewController.view.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    self.simpleFormViewController.view.layer.borderWidth = 0.5;
    self.simpleFormViewController.view.layer.masksToBounds = YES;
    

    ZButton *signupButton = [[ZButton alloc]initWithTitle:@"Sign up" andImage:[ZChevronImages leftChevron] aligned:ZImageAlignmentLeft];
    [self.view addSubview:signupButton];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:signupButton
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.simpleFormViewController.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:signupButton
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.simpleFormViewController.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:8.0]];

    ZButton *loginButton = [[ZButton alloc]initWithTitle:@"Login" andImage:[ZChevronImages rightChevron] aligned:ZImageAlignmentRight];
    loginButton.buttonPressBlock = ^(ZButton *button) {
        NSArray *cellIndexPaths = [self.simpleFormViewController unfulfilledRequiredCellIndexPaths];
        if (cellIndexPaths.count != 0){
            self.simpleFormViewController.showRequiredFlags = YES;
            [self.simpleFormViewController reloadRowsAtIndexPaths:cellIndexPaths withRowAnimation:UITableViewRowAnimationNone];
            // put up a note to the user that they have to fill in all the marked fields
        } else {
            [self.simpleFormViewController allValues];
            // we're ready to log in
        }
    };
    [self.view addSubview:loginButton];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:loginButton
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.simpleFormViewController.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:loginButton
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.simpleFormViewController.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:8.0]];

}

@end

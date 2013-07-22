//
//  ZViewController.m
//  ZForm
//
//  Created by Ayal Spitz on 7/20/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZViewController.h"
#import "ZFormModel.h"
#import "ZFormViewController.h"
#import "ZCheckbox.h"

@interface ZViewController ()

@end

@implementation ZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    ZFormViewController *formViewController = [ZFormViewController form];
//    [self.navigationController pushViewController:formViewController animated:NO];
    
//    ZCheckbox *checkbox = [ZCheckbox checkbox];
//    checkbox.backgroundColor = [UIColor yellowColor];
//    CGRect checkboxFrame = checkbox.frame;
//    checkboxFrame.origin = CGPointMake(100.0, 100.0);
//    checkbox.frame = checkboxFrame;
//    [self.view addSubview:checkbox];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    ZFormModel *model = [ZFormModel model];
    [model addTitle:@"Title" andDetail:@"Detail"];
    [model addTextFieldWithTitle:@"Event Name:" andPlaceholder:@"event"];
    [model addDateWithTitle:@"Start Date:"];
    [model addDateWithTitle:@"End Date:"];
    [model addSwitchWithTitle:@"Do something:"];
    [model addCheckboxWithTitle:@"Check something or other"];
    [model addMultiSelectWithTitle:@"People" andOptions:@[@"Ayal", @"Aviv", @"Maya"]];

    UINavigationController *form = [ZFormViewController modalFormWithName:@"Form" model:model andCompletionBlock:^(bool cancel, ZFormModel *model) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }];
    [self presentViewController:form animated:YES completion:NULL];
}

@end

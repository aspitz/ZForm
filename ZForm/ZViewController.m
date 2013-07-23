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

@interface ZViewController ()

@end

@implementation ZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    ZFormViewController *formViewController = [ZFormViewController form];
//    [self.navigationController pushViewController:formViewController animated:NO];    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    ZFormModel *model = [ZFormModel model];
    [model addTitle:@"Title" andDetail:@"Detail"];
    [model addTextFieldWithTitle:@"Event Name:" andPlaceholder:@"event"];
    [model add:ZFormModelDateElement withTitle:@"Start Date:"];
    [model add:ZFormModelDateElement withTitle:@"End Date:"];
    [model add:ZFormModelSwitchElement withTitle:@"Do something:"];
    [model add:ZFOrmModelCheckboxElement withTitle:@"Check something or other"];
    [model addMultiSelectWithTitle:@"People" andOptions:@[@"Ayal", @"Aviv", @"Maya"]];

    UINavigationController *form = [ZFormViewController modalFormWithName:@"Form" model:model andCompletionBlock:^(bool cancel, ZFormModel *model) {
        NSArray *values = [model values];
        [self dismissViewControllerAnimated:YES completion:NULL];
    }];
    [self presentViewController:form animated:YES completion:NULL];
}

@end

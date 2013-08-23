//
//  ZViewController.m
//  ZForm
//
//  Created by Ayal Spitz on 7/20/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZViewController.h"
#import "ZForm.h"
#import "ZLoginViewController.h"

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
    
//    ZFormModel *formModel = [ZFormModel model];
//    formModel.title = @"Form";
//    [formModel add:ZFormModelTextElement withTitle:@"Title" andAttributes:@{@"detail":@"detail"}];
//    [formModel add:ZFormModelTextFieldElement withTitle:@"Event Name:" andAttributes:@{@"placeholder":@"event"}];
//    [formModel add:ZFormModelTextFieldElement withTitle:@"Password:" andAttributes:@{@"secret":@YES}];
//    [formModel add:ZFormModelDateElement withTitle:@"Start Date:"];
//    [formModel add:ZFormModelDateElement withTitle:@"End Date:"];
//    [formModel add:ZFormModelSwitchElement withTitle:@"Do something:"];
//    [formModel add:ZFormModelCheckboxElement withTitle:@"Check something or other"];
//    [formModel add:ZFormModelMultiSelectElement withTitle:@"People" andAttributes:@{@"options":@[@"Ayal", @"Aviv", @"Maya"]}];
//
//    [ZFormViewController presentModalFormOnTopOf:self withModel:formModel andCompletionBlock:^(bool cancel, ZFormModel *model) {
//        NSArray *values = [model values];
//        [self dismissViewControllerAnimated:YES completion:NULL];
//    }];

    ZLoginViewController *loginViewController = [[ZLoginViewController alloc]init];
    [self presentViewController:loginViewController animated:YES completion:NULL];
}

@end

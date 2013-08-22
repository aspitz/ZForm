//
//  ZSimpleFormViewController.m
//  RegisterView
//
//  Created by Ayal Spitz on 8/9/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZSimpleFormViewController.h"
#import "ZSimpleTextFieldCell.h"
#import "ZSimpleFormView.h"
#import "ZSimpleFormModel.h"
#import "NSLayoutConstraint+Utilities.h"
#import "ZButton.h"

@interface ZSimpleFormViewController ()

@property (nonatomic, strong) ZSimpleFormView *formView;
@property (nonatomic, strong) ZSimpleFormModel *model;
@property (copy) ZSimpleFormCompletionBlock completionBlock;

@end


@implementation ZSimpleFormViewController


+ (instancetype)formWithModel:(ZSimpleFormModel *)model andCompletionBlock:(ZSimpleFormCompletionBlock)complpetionBlock{
    ZSimpleFormViewController *form = [[[self class]alloc]init];
    form.model = model;
    form.completionBlock = complpetionBlock;
    
    return form;
}

+ (void)presentModalFormOnTopOf:(UIViewController *)viewController withModel:(ZSimpleFormModel *)model andCompletionBlock:(ZSimpleFormCompletionBlock)completionBlock{

    ZSimpleFormViewController *modalForm = [[self class]formWithModel:model andCompletionBlock:completionBlock];
    [viewController presentViewController:modalForm animated:YES completion:NULL];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.formView = [[ZSimpleFormView alloc]init];
    self.formView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.formView];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithItem:self.formView equalToItem:self.view]];

    __weak typeof(self) weakSelf = self;
    
    [self.formView setLeftButtonTitle:self.model.leftButtonTitle andImage:self.model.leftButtonImage];
    self.formView.leftButton.buttonPressBlock = ^(ZButton *srcButton){
        [weakSelf leftButtonAction:nil];
    };
    
    [self.formView setRightButtonTitle:self.model.rightButtonTitle andImage:self.model.rightButtonImage];
    self.formView.rightButton.buttonPressBlock = ^(ZButton *srcButton){
        [weakSelf rightButtonAction:nil];
    };
    
    self.formView.dataSource = self.model;
}

- (ZSimpleTextFieldCell *)newCellWithPlaceholder:(NSString *)placeholder{
    ZSimpleTextFieldCell *cell = [[ZSimpleTextFieldCell alloc]init];
    cell.textField.placeholder = placeholder;
    cell.textField.textAlignment = NSTextAlignmentCenter;
    return cell;
}

- (IBAction)leftButtonAction:(id)sender{
    [self.model clearRequiredFlags];
    if (self.completionBlock){
        self.completionBlock(SimpleFormButtonLeft, [self.model values]);
    }
}

- (IBAction)rightButtonAction:(id)sender{
    if (![self.model hasUnfilledRequiredCells] && self.completionBlock){
        self.completionBlock(SimpleFormButtonRight, [self.model values]);
    }
}

@end

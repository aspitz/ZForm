//
//  ZFormModel.m
//  ZForm
//
//  Created by Ayal Spitz on 7/20/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZFormModel.h"

#import "ZCellController.h"
#import "ZTextFieldCellController.h"
#import "ZDateCellController.h"
#import "ZSwitchCellController.h"
#import "ZCheckboxCellController.h"
#import "ZMultiSelectCellController.h"

@interface ZFormModel ()

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation ZFormModel

- (instancetype)init{
    self = [super init];
    if (self) {
        self.array = [NSMutableArray array];
    }
    return self;
}

+ (instancetype)model{
    return [[[self class]alloc]init];
}

#pragma mark - ZCellControllerDelegate method

- (void)cellControllerWasSelected:(ZCellController *)cellController{
    if ((self.delegate != nil) && [self.delegate respondsToSelector:@selector(cellControllerWasSelected:)]){
        [self.delegate cellControllerWasSelected:cellController];
    }
}

- (void)cellController:(ZCellController *)cellController pushViewController:(UIViewController *)viewController{
    if ((self.delegate != nil) && [self.delegate respondsToSelector:@selector(cellController:pushViewController:)]){
        [self.delegate cellController:cellController pushViewController:viewController];
    }
}

#pragma mark - Model construction methods

- (void)add:(ZFormElementType)elementType withTitle:(NSString *)title{
    switch (elementType) {
        case ZFormModelTextElement:
            [self addTitle:title andDetail:nil];
            break;
        case ZFormModelTextFieldElement:
            [self addTextFieldWithTitle:title andPlaceholder:nil];
            break;
        case ZFormModelDateElement:
            [self addDateWithTitle:title andDate:[NSDate date]];
            break;
        case ZFormModelSwitchElement:
            [self addSwitchWithTitle:title andOn:YES];
            break;
        case ZFOrmModelCheckboxElement:
            [self addCheckboxWithTitle:title andChecked:NO];
            break;
        default:
            break;
    }
}

- (void)addTextFieldWithTitle:(NSString *)title andPlaceholder:(NSString *)placeholder{
    ZTextFieldCellController *textFieldCellController = [[ZTextFieldCellController alloc]init];
    [textFieldCellController setText:title];
    if (placeholder != nil){
        [textFieldCellController setPlaceholder:placeholder];
    }
    textFieldCellController.delegate = self;
    [self addObject:textFieldCellController];
}

- (void)addDateWithTitle:(NSString *)title andDate:(NSDate *)date{
    ZDateCellController *dateCellController = [[ZDateCellController alloc]init];
    [dateCellController setText:title];
    [dateCellController setDate:date];
    dateCellController.delegate = self;
    [self addObject:dateCellController];
}

- (void)addSwitchWithTitle:(NSString *)title andOn:(BOOL)on{
    ZSwitchCellController *switchCellController = [[ZSwitchCellController alloc]init];
    [switchCellController setText:title];
    [switchCellController setOn:on];
    switchCellController.delegate = self;
    [self addObject:switchCellController];
}

- (void)addCheckboxWithTitle:(NSString *)title andChecked:(BOOL)checked{
    ZCheckboxCellController *checkboxCellController = [[ZCheckboxCellController alloc]init];
    [checkboxCellController setText:title];
    [checkboxCellController setChecked:checked];
    checkboxCellController.delegate = self;
    [self addObject:checkboxCellController];
}

- (void)addTitle:(NSString *)title andDetail:(NSString *)detail{
    ZCellController *cellController = [[ZCellController alloc]init];
    [cellController setText:title];
    [cellController setDetailText:detail];
    cellController.delegate = self;
    [self addObject:cellController];
}

- (void)addMultiSelectWithTitle:(NSString *)title options:(NSArray *)options andSelectedOptions:(NSIndexSet *)selectedOptions{
    ZMultiSelectCellController *multiSelectCellController = [[ZMultiSelectCellController alloc]init];
    [multiSelectCellController setText:title];
    multiSelectCellController.options = options;
    multiSelectCellController.selectedOptions = selectedOptions;
    multiSelectCellController.delegate = self;
    [self addObject:multiSelectCellController];
}

- (void)addMultiSelectWithTitle:(NSString *)title andOptions:(NSArray *)options{
    [self addMultiSelectWithTitle:title options:options andSelectedOptions:nil];
}

#pragma mark - Model access methods

- (NSUInteger)count{
    return self.array.count;
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx{
    return self.array[idx];
}

- (void)addObject:(id)anObject{
    [self.array addObject:anObject];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index{
    [self.array insertObject:anObject atIndex:index];
}

- (void)removeObjectAtIndex:(NSUInteger)index{
    [self.array removeObjectAtIndex:index];
}

- (NSUInteger)indexOfObject:(id)anObject{
    return [self.array indexOfObject:anObject];
}

- (NSArray *)values{
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:self.array.count];
    
    [self.array enumerateObjectsUsingBlock:^(ZCellController *cellController, NSUInteger idx, BOOL *stop) {
        [values addObject:cellController.value];
    }];
    
    return values;
}

@end

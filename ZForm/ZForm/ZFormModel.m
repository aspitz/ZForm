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
    NSDictionary *attributes = nil;
    
    switch (elementType) {
        case ZFormModelDateElement:
            attributes = @{@"date": [NSDate date]};
            break;
        case ZFormModelSwitchElement:
            attributes = @{@"on": @(YES)};
            break;
        case ZFormModelCheckboxElement:
            attributes = @{@"checked": @(YES)};
            break;
        default:
            break;
    }
    
    [self add:elementType withTitle:title andAttributes:attributes];
}

- (void)add:(ZFormElementType)elementType withTitle:(NSString *)title andAttributes:(NSDictionary *)attributes{
    switch (elementType) {
        case ZFormModelCheckboxElement:
            [self addCheckboxWithTitle:title andChecked:[attributes[@"checked"] boolValue]];
            break;
        case ZFormModelDateElement:
            [self addDateWithTitle:(NSString *)title andDate:attributes[@"date"]];
            break;
        case ZFormModelMultiSelectElement:
            [self addMultiSelectWithTitle:title options:attributes[@"options"] andSelectedOptions:attributes[@"selectedOptions"]];
            break;
        case ZFormModelSwitchElement:
            [self addSwitchWithTitle:title andOn:[attributes[@"on"] boolValue]];
            break;
        case ZFormModelTextElement:
            [self addTitle:title andDetail:attributes[@"detail"]];
            break;
        case ZFormModelTextFieldElement:
            [self addTextFieldWithTitle:title placeholder:attributes[@"placeholder"] andSecret:attributes[@"secret"]];
            break;
        default:
            break;
    }
}

- (void)addTextFieldWithTitle:(NSString *)title placeholder:(NSString *)placeholder andSecret:(NSNumber *)secret{
    ZTextFieldCellController *textFieldCellController = [[ZTextFieldCellController alloc]init];
    [textFieldCellController setLabelText:title];
    if (placeholder != nil){
        [textFieldCellController setPlaceholder:placeholder];
    }
    [textFieldCellController setSecret:[secret boolValue]];
    textFieldCellController.delegate = self;
    [self addObject:textFieldCellController];
}

- (void)addDateWithTitle:(NSString *)title andDate:(NSDate *)date{
    ZDateCellController *dateCellController = [[ZDateCellController alloc]init];
    [dateCellController setLabelText:title];
    [dateCellController setDate:date];
    dateCellController.delegate = self;
    [self addObject:dateCellController];
}

- (void)addSwitchWithTitle:(NSString *)title andOn:(BOOL)on{
    ZSwitchCellController *switchCellController = [[ZSwitchCellController alloc]init];
    [switchCellController setLabelText:title];
    [switchCellController setOn:on];
    switchCellController.delegate = self;
    [self addObject:switchCellController];
}

- (void)addCheckboxWithTitle:(NSString *)title andChecked:(BOOL)checked{
    ZCheckboxCellController *checkboxCellController = [[ZCheckboxCellController alloc]init];
    [checkboxCellController setLabelText:title];
    [checkboxCellController setChecked:checked];
    checkboxCellController.delegate = self;
    [self addObject:checkboxCellController];
}

- (void)addTitle:(NSString *)title andDetail:(NSString *)detail{
    ZCellController *cellController = [[ZCellController alloc]init];
    [cellController setLabelText:title];
    [cellController setDetailLabelText:detail];
    cellController.delegate = self;
    [self addObject:cellController];
}

- (void)addMultiSelectWithTitle:(NSString *)title options:(NSArray *)options andSelectedOptions:(NSIndexSet *)selectedOptions{
    ZMultiSelectCellController *multiSelectCellController = [[ZMultiSelectCellController alloc]init];
    [multiSelectCellController setLabelText:title];
    multiSelectCellController.options = options;
    multiSelectCellController.selectedOptions = selectedOptions;
    multiSelectCellController.delegate = self;
    [self addObject:multiSelectCellController];
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
        [values addObject:cellController.cellValue];
    }];
    
    return values;
}

@end

//
//  ZMultiSelectCellController.m
//  ZForm
//
//  Created by Ayal Spitz on 7/22/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZMultiSelectCellController.h"
#import "ZTableViewCell.h"
#import "ZFormModel.h"
#import "ZFormViewController.h"

#import "NSString+Utilities.h"

@interface ZMultiSelectCellController ()

@property (nonatomic, strong) ZTableViewCell *cell;

@end

@implementation ZMultiSelectCellController

- (void)setup{
    [super setup];
    
    self.cell = [[ZTableViewCell alloc]initWithReuseIdentifier:[NSString UUID]];
    self.cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [self.cell setDetailLabelText:@"(0)"];
}

- (NSIndexSet *)selectedOptions{
    if (_selectedOptions == nil){
        _selectedOptions = [NSIndexSet indexSet];
    }
    return _selectedOptions;
}

- (id)value{
    return self.selectedOptions;
}

- (void)selectInTableView:(UITableView *)tableView andModel:(NSMutableArray *)model atIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)deselectFromTableView:(UITableView *)tableView andModel:(NSMutableArray *)model atIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tappedInTableView:(UITableView *)tableView andModel:(ZFormModel *)model atIndexPath:(NSIndexPath *)indexPath{
    if ((self.delegate != nil) && [self.delegate respondsToSelector:@selector(cellController:pushViewController:)]){
        [self.delegate cellController:self pushViewController:[self buildSubform]];
    }
}


- (ZFormViewController *)buildSubform{
    ZFormModel *formModel = [ZFormModel model];
    [self.options enumerateObjectsUsingBlock:^(NSString *option, NSUInteger idx, BOOL *stop) {
        BOOL checked = [self.selectedOptions containsIndex:idx];
        [formModel addCheckboxWithTitle:option andChecked:checked];
    }];
    
    ZFormViewController *formViewController = [ZFormViewController formWithName:self.cell.label.text model:formModel andCompletionBlock:^(bool cancel, ZFormModel *model) {
        NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
        [model.values enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            BOOL flag = [obj boolValue];
            if (flag){
                [indexSet addIndex:idx];
            }
        }];
        self.selectedOptions = indexSet;
        [self.cell setDetailLabelText:[NSString stringWithFormat:@"(%d)", self.selectedOptions.count]];
    }];
    
    return formViewController;
}

@end

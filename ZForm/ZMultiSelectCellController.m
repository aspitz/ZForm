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

- (id)value{
    return self.selectedOptions;
}

- (void)selectInTableView:(UITableView *)tableView andModel:(NSMutableArray *)model atIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ((self.delegate != nil) && [self.delegate respondsToSelector:@selector(cellController:pushViewController:)]){
        [self.delegate cellController:self pushViewController:[self buildSubform]];
    }
}

- (void)deselectFromTableView:(UITableView *)tableView andModel:(NSMutableArray *)model atIndexPath:(NSIndexPath *)indexPath{
    // deselect the openItemItendPath
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (ZFormViewController *)buildSubform{
    ZFormModel *formModel = [ZFormModel model];
    [self.options enumerateObjectsUsingBlock:^(NSString *option, NSUInteger idx, BOOL *stop) {
        [formModel addCheckboxWithTitle:option];
    }];
    
    
    ZFormViewController *formViewController = [ZFormViewController formWithName:self.cell.label.text andModel:formModel];
    
    return formViewController;
}

@end
